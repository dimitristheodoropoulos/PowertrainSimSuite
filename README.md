# MagneticMaterialSim

**MagneticMaterialSim** is a Python/Octave/FreeFEM/Ngspice workflow for simulating and analyzing soft and hard magnetic materials. It generates FEA input, runs simulations, produces plots, and exports validation reports.

---

## **Project Structure**

MagneticMaterialSim/
├─ python/  
│  ├─ scripts/  
│  │  ├─ materials.py  
│  │  ├─ fea_preprocess.py  
│  │  ├─ data_processing.py  
│  │  ├─ optimization.py  
│  │  └─ visualization.py  
│  └─ data/ # Material CSVs  
├─ octave/  
│  ├─ scripts/  
│  │  ├─ core_analysis.m  
│  │  ├─ motor_simulation.m  
│  │  └─ visualization.m  
│  └─ utils/  
│     └─ helpers.m  
├─ freefem/  
│  ├─ scripts/  
│  └─ models/  
├─ ngspice/  
│  ├─ scripts/  
│  └─ circuits/  
├─ results/  
│  ├─ csv/  
│  ├─ plots/  
│  ├─ logs/  
│  └─ reports/  
├─ tests/  
│  ├─ test_ngspice.sh  
│  ├─ test_octave_core.m  
│  └─ test_python.py  
├─ run_all.sh  
├─ requirements.txt  
├─ .gitignore  
├─ README.md  
└─ venv/ # Python virtual environment (excluded from repo)

---

## **Installation & Setup**

1. Clone the repository (once uploaded to GitHub):

```bash
git clone https://github.com/yourusername/MagneticMaterialSim.git
cd MagneticMaterialSim

Create and activate Python virtual environment:
python3 -m venv venv
source venv/bin/activate

Install Python dependencies:
pip install -r python/requirements.txt
Ensure FreeFEM, Octave, and Ngspice are installed and in your system PATH.

Running the Project

Run all simulations and reports with:
bash run_all.sh

Phase 1 Workflow Includes:

FreeFEM mesh generation

Python preprocessing, FEA input, material summary, and reports

Octave simulations (core analysis + motor simulation + plots)

Ngspice simulations

Output Locations
Type	Folder
CSV Data	results/csv/
Plots	results/plots/
Logs	results/logs/
Reports	results/reports/

source venv/bin/activate
python tests/test_python.py

Octave core scripts tests:
octave --silent tests/test_octave_core.m

Ngspice test:
bash tests/test_ngspice.sh

otes

Phase 1 is complete; future phases will extend this project for multi-physics optimization, motor design, and Tesla-specific workflows.

Only free/open tools are used: Python, Octave, FreeFEM, Ngspice.

CSVs, plots, and reports are automatically generated and stored in the results/ subfolders.