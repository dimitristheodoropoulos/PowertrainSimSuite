# Powertrain Modeling Engineer – Phase 3

## Overview
This module extends **PowertrainSimSuite** for powertrain modeling. It focuses on multi-physics integration, optimization, and data visualization to support software-based workflows without hardware.

### Key Features
- Octave/MATLAB functions for powertrain modeling
- Electromagnetic + thermal + mechanical multi-physics analysis
- Multi-criteria optimization: efficiency, torque, thermal performance
- Large-scale data processing and visualization from Phase 2 outputs

## Inputs
Phase 2 outputs from:
- `python/scripts/phase3/common_inputs/csv/`
- `python/scripts/phase3/common_inputs/plots/`
- `python/scripts/phase3/common_inputs/reports/`

Key files:
- `fea_results.csv`
- `soft_summary.csv`
- `hard_summary.csv`

## Outputs
- CSV summaries: `python/scripts/phase3/powertrain_modeling/results/csv/`
- Plots: `python/scripts/phase3/powertrain_modeling/results/plots/`

## Tools
- Python (NumPy, Pandas, Matplotlib)
- Octave / MATLAB
- FreeFEM++
- Ngspice

## How to Run
Activate Python environment:
```bash
source venv/bin/activate
Run the powertrain modeling workflow:
bash python/scripts/phase3/run_phase3.sh


---

### **2️⃣ `motor_powertrain/docs/README.md`**

```markdown
# Electrical Engineer – Motor Powertrain – Phase 3

## Overview
This module extends **PowertrainSimSuite** for motor and drive unit simulation. Focuses on multi-criteria optimization, FEA processing, and visualization for motor design and selection.

### Key Features
- Octave/MATLAB functions for motor & powertrain performance
- Multi-criteria optimization: efficiency, cost, torque, thermal
- Drive unit simulation and analysis
- Advanced FEA processing
- Visualization and selection of optimal motor designs

## Inputs
Phase 2 outputs from:
- `python/scripts/phase3/common_inputs/csv/`
- `python/scripts/phase3/common_inputs/plots/`
- `python/scripts/phase3/common_inputs/reports/`

Key files:
- `fea_results.csv`
- `soft_summary.csv`
- `hard_summary.csv`

## Outputs
- CSV summaries: `python/scripts/phase3/motor_powertrain/results/csv/`
- Plots: `python/scripts/phase3/motor_powertrain/results/plots/`

## Tools
- Python (NumPy, Pandas, Matplotlib)
- Octave / MATLAB
- FreeFEM++
- Ngspice

## How to Run
Activate Python environment:
```bash
source venv/bin/activate

Run the motor powertrain workflow:
bash python/scripts/phase3/run_phase3.sh

