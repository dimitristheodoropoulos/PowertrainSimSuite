#!/bin/bash
set -euo pipefail

echo "=== PowertrainSimSuite Phase 3 Workflow (Headless) ==="

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
LOG_DIR="$PROJECT_ROOT/results/logs"

# --- Δημιουργία φακέλων ---
mkdir -p "$PROJECT_ROOT/results/csv" \
         "$PROJECT_ROOT/results/plots" \
         "$PROJECT_ROOT/results/reports" \
         "$LOG_DIR"

# --- Error trap ---
trap 'echo "❌ Σφάλμα στο βήμα $STEP. Δες logs στο $LOG_DIR"' ERR

# 1️⃣ FreeFEM
STEP="FreeFEM simulations"
echo "[1/6] $STEP..."
for f in "$PROJECT_ROOT/freefem/scripts/"*.edp; do
    [[ -f "$f" ]] || continue
    echo "Running $f..."
    xvfb-run freefem++ "$f" -nw \
        > "$LOG_DIR/$(basename "$f").log" 2>&1
done

# 2️⃣ Python preprocessing
STEP="Python preprocessing"
echo "[2/6] $STEP..."
cd "$PROJECT_ROOT/python"
python3 scripts/fea_preprocess.py \
    > "$LOG_DIR/python_fea_preprocess.log" 2>&1 || true
python3 scripts/data_processing.py \
    > "$LOG_DIR/python_data_processing.log" 2>&1 || true

# 3️⃣ Octave headless
STEP="Octave simulations"
echo "[3/6] $STEP..."
cd "$PROJECT_ROOT"
octave --silent --eval "
graphics_toolkit('gnuplot');
set(0,'DefaultFigureVisible','off');
set(0,'DefaultAxesFontName','Liberation Sans');
set(0,'DefaultTextFontName','Liberation Sans');
if exist('octave/scripts/core_analysis.m','file'), run('octave/scripts/core_analysis.m'); end
if exist('octave/scripts/motor_simulation.m','file'), run('octave/scripts/motor_simulation.m'); end
if exist('octave/scripts/visualization.m','file'), run('octave/scripts/visualization.m'); end
if exist('octave/scripts/vehicle_dynamics.m','file'), run('octave/scripts/vehicle_dynamics.m'); end
" > "$LOG_DIR/octave.log" 2>&1

# 4️⃣ Python FEA comparison & plots
STEP="Python FEA comparison"
echo "[4/6] $STEP..."
cd "$PROJECT_ROOT/python/scripts"
if [[ -f "materials.py" ]]; then
    python3 materials.py > "$LOG_DIR/python_materials.log" 2>&1
else
    echo "⚠️ materials.py missing" | tee "$LOG_DIR/python_materials.log"
fi

# 5️⃣ Ngspice
STEP="Ngspice simulations"
echo "[5/6] $STEP..."
bash "$PROJECT_ROOT/ngspice/scripts/run_ngspice.sh" \
    > "$LOG_DIR/ngspice.log" 2>&1 || true

# 6️⃣ Output check & report
STEP="Output check"
echo "[6/6] $STEP..."
if [[ -f "$PROJECT_ROOT/python/scripts/check_outputs.py" ]]; then
    python3 "$PROJECT_ROOT/python/scripts/check_outputs.py" \
        > "$LOG_DIR/python_check_outputs.log" 2>&1 || true
fi
if [[ -f "$PROJECT_ROOT/python/scripts/report_generator.py" ]]; then
    python3 "$PROJECT_ROOT/python/scripts/report_generator.py" \
        > "$LOG_DIR/python_report.log" 2>&1 || true
fi

echo "=== All simulations complete! ==="
echo "Reports: $PROJECT_ROOT/results/reports"
echo "Plots:   $PROJECT_ROOT/results/plots"
echo "CSV:     $PROJECT_ROOT/results/csv"
echo "Logs:    $PROJECT_ROOT/results/logs"
