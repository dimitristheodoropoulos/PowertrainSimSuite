# PowertrainSimSuite

**PowertrainSimSuite** is a comprehensive Python/Octave/FreeFEM/Ngspice workflow for simulating and analyzing magnetic materials and electric motor powertrains. It integrates multi-physics simulations, optimization, and visualization across multiple engineering roles.

This project is developed in **three phases**, progressively extending capabilities from magnetic material analysis to full powertrain modeling, suitable for software-based workflows without proprietary hardware.

---

## **Phases Overview**

### **Phase 1 – Magnetic Materials Simulation**
- FEA of soft and hard magnetic materials
- Core loss analysis and visualization
- Ngspice simulations for magnetic circuits
- Python/Octave preprocessing and report generation

### **Phase 2 – Multi-Material & Preprocessing Workflow**
- Data preparation and integration of Phase 1 outputs
- Multi-material analysis and visualization
- Intermediate results for powertrain modeling

### **Phase 3 – Powertrain Engineering**
Extends Phase 2 for two specialized roles:

1. **Powertrain Modeling Engineer**
   - Octave/MATLAB functions for powertrain modeling
   - Multi-physics integration (electromagnetic + thermal + mechanical)
   - Multi-criteria optimization (efficiency, torque, thermal)
   - Large-scale data processing and visualization

2. **Electrical Engineer – Motor Powertrain**
   - Motor and drive unit simulation
   - Multi-criteria optimization (efficiency, cost, torque, heat)
   - Advanced FEA processing
   - Visualization and selection of optimal designs

---

## **Roles Covered**
- Associate Electrical Engineer – System Design & Powertrain Modelling
- Powertrain Modeling Engineer
- Electrical Engineer – Motor Powertrain
- Optimus (optional: robotic integration concepts)

---

## **Project Structure**

PowertrainSimSuite/
├─ python/
│ ├─ scripts/
│ │ ├─ materials.py
│ │ ├─ fea_preprocess.py
│ │ ├─ data_processing.py
│ │ ├─ optimization.py
│ │ └─ visualization.py
│ └─ data/ # Material CSVs
├─ octave/
│ ├─ scripts/
│ │ ├─ core_analysis.m
│ │ ├─ motor_simulation.m
│ │ └─ visualization.m
│ └─ utils/
│ └─ helpers.m
├─ freefem/
│ ├─ scripts/
│ └─ models/
├─ ngspice/
│ ├─ scripts/
│ └─ circuits/
├─ results/
│ ├─ csv/
│ ├─ plots/
│ ├─ logs/
│ └─ reports/
├─ tests/
│ ├─ test_ngspice.sh
│ ├─ test_octave_core.m
│ └─ test_python.py
├─ run_all.sh
├─ requirements.txt
├─ README.md
└─ venv/ # Excluded from repo


---

## **Installation & Setup**




git clone https://github.com/dimitristheodoropoulos/PowertrainSimSuite.git
cd PowertrainSimSuite

python3 -m venv venv
source venv/bin/activate

pip install -r python/requirements.txt


pip install -r python/requirements.txt


Ensure external tools are installed and in your system PATH

Octave / MATLAB

FreeFEM++

Ngspice


bash run_all.sh


| Type     | Folder             |
| -------- | ------------------ |
| CSV Data | `results/csv/`     |
| Plots    | `results/plots/`   |
| Logs     | `results/logs/`    |
| Reports  | `results/reports/` |

Python tests:
source venv/bin/activate
python tests/test_python.py


Octave core scripts tests:
octave --silent tests/test_octave_core.m

Ngspice test:
bash tests/test_ngspice.sh

Notes

Fully software-based workflow; no extra hardware required

All tools are free/open-source (Python, Octave, FreeFEM, Ngspice)

Results are automatically stored in results/ subfolders

Workflow demonstrates progressive development from magnetic materials → powertrain modeling → motor optimization