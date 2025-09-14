import pandas as pd
from pathlib import Path
import json

project_root = Path(__file__).resolve().parent.parent
results_dir = project_root / "python/results/csv"
plots_dir = project_root / "python/results/plots"
plots_dir.mkdir(parents=True, exist_ok=True)

# Load material summaries
soft = pd.read_csv(results_dir / "soft_summary.csv")
hard = pd.read_csv(results_dir / "hard_summary.csv")

# Load FEA results
fea_results_file = results_dir / "fea_results.csv"
comparison_data = {}
if fea_results_file.exists():
    fea = pd.read_csv(fea_results_file)
    comparison_data = {
        "soft": {
            "material_core_loss": soft["mean_core_loss"].values[0],
            "fea_core_loss": fea.loc[fea.Material=="soft","MeanCoreLoss"].values[0]
        },
        "hard": {
            "material_core_loss": hard["mean_core_loss"].values[0],
            "fea_core_loss": fea.loc[fea.Material=="hard","MeanCoreLoss"].values[0]
        }
    }
    # Save JSON for dashboard
    with open(results_dir / "fea_comparison.json", "w") as f:
        json.dump(comparison_data, f, indent=2)
    print(f"[INFO] Saved FEA comparison JSON: {results_dir / 'fea_comparison.json'}")
else:
    print("⚠️ FEA results not found. Skipping comparison.")
