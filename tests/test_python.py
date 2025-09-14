# test_python.py
import pandas as pd
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
results_dir = PROJECT_ROOT / "python/results/csv"

def test_fea_input_exists():
    fea_input = results_dir / "fea_input.csv"
    assert fea_input.exists(), f"FEA input file missing: {fea_input}"

def test_mesh_files_exist():
    soft_mesh = results_dir / "soft_mesh.csv"
    hard_mesh = results_dir / "hard_mesh.csv"
    assert soft_mesh.exists(), "Soft mesh CSV missing"
    assert hard_mesh.exists(), "Hard mesh CSV missing"

if __name__ == "__main__":
    test_fea_input_exists()
    test_mesh_files_exist()
    print("✅ Python FEA input tests passed.")
