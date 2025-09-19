Phase 3 – Powertrain Engineering
Overview

Phase 3 extends PowertrainSimSuite with two specialized roles:

Powertrain Modeling Engineer

Octave/MATLAB functions for powertrain modeling

Multi-physics integration (electromagnetic + thermal + mechanical)

Multi-criteria optimization (efficiency, torque, thermal)

Large-scale data processing & visualization from Phase 2 outputs

Electrical Engineer – Motor Powertrain

Octave/MATLAB functions for motor & powertrain performance

Multi-criteria optimization (efficiency, cost, torque, heat)

Drive unit simulation tools

Advanced FEA processing

Visualization & selection of optimal designs

Inputs

Phase 3 uses Phase 2 outputs from:

python/scripts/phase3/common_inputs/csv/

python/scripts/phase3/common_inputs/plots/

python/scripts/phase3/common_inputs/reports/

Key files:

fea_results.csv

soft_summary.csv

hard_summary.csv

Outputs

Powertrain Modeling results: python/scripts/phase3/powertrain_modeling/results/

CSV summaries

Plots

Motor Powertrain results: python/scripts/phase3/motor_powertrain/results/

CSV summaries

Plots

Tools

Python (NumPy, Pandas, Matplotlib)

Octave / MATLAB

FreeFEM++

Ngspice

How to Run

Activate your Python environment:
source venv/bin/activate

Run the full Phase 3 workflow:
bash run_all.sh
