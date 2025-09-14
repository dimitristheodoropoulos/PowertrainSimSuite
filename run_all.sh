#!/bin/bash
echo "=== MagneticMaterialSim Full Workflow ==="

# Absolute project root
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure results subfolders exist
mkdir -p "$PROJECT_ROOT/results/csv"
mkdir -p "$PROJECT_ROOT/results/plots"
mkdir -p "$PROJECT_ROOT/results/logs"
mkdir -p "$PROJECT_ROOT/results/reports"

# --- 1. FreeFEM simulations (generate TXT meshes) ---
echo "[1/5] Running FreeFEM simulations..."
bash "$PROJECT_ROOT/freefem/scripts/run_fea.sh"

# --- 2. Python preprocessing: prepare FEA input & convert meshes ---
echo "[2/5] Running Python preprocessing scripts..."
source "$PROJECT_ROOT/venv/bin/activate"
cd "$PROJECT_ROOT"
python3 python/scripts/fea_preprocess.py
python3 python/scripts/data_processing.py
deactivate

# --- 3. Octave simulations ---
echo "[3/5] Running Octave simulations..."
export SOFT_MESH_CSV="$PROJECT_ROOT/python/results/csv/soft_mesh.csv"
export HARD_MESH_CSV="$PROJECT_ROOT/python/results/csv/hard_mesh.csv"
cd "$PROJECT_ROOT"
octave --silent "octave/scripts/core_analysis.m"
octave --silent "octave/scripts/motor_simulation.m"
octave --silent "octave/scripts/visualization.m"

# --- 4. Python FEA comparison & final reports ---
echo "[4/5] Generating Python FEA comparison and reports..."
source "$PROJECT_ROOT/venv/bin/activate"
cd "$PROJECT_ROOT/python/scripts"

# Update materials.py to read Octave FEA results and generate summary & JSON reports
python3 materials.py

# Optional: additional visualization scripts
python3 visualization.py
deactivate

# --- 5. Ngspice simulations ---
echo "[5/5] Running Ngspice simulations..."
bash "$PROJECT_ROOT/ngspice/scripts/run_ngspice.sh"

echo "=== All simulations complete! ==="
echo "Reports: $PROJECT_ROOT/results/reports"
echo "Plots:   $PROJECT_ROOT/results/plots"
echo "CSV data: $PROJECT_ROOT/results/csv"
