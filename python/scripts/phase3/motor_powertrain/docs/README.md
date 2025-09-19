# Electrical Engineer – Motor Powertrain – Phase 3

## Overview
This module extends **PowertrainSimSuite** for motor and drive unit simulation. It enables multi-criteria optimization, advanced FEA processing, and visualization to support motor design and selection in a fully software-based workflow.

### Key Features
- Octave/MATLAB functions for motor and powertrain performance analysis
- Multi-criteria optimization: efficiency, cost, torque, thermal performance
- Drive unit simulation and evaluation tools
- Advanced FEA processing for motor components
- Visualization and selection of optimal motor designs

## Inputs
Phase 3 inputs are derived from Phase 2 outputs:
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
Activate the Python environment:
```bash
source venv/bin/activate

Run the motor powertrain workflow:
bash python/scripts/phase3/run_phase3.sh

