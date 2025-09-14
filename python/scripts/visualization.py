import matplotlib.pyplot as plt
import pandas as pd
from pathlib import Path
import json

project_root = Path(__file__).resolve().parent.parent
results_dir = project_root / "python/results/csv"
plots_dir = project_root / "python/results/plots"
plots_dir.mkdir(parents=True, exist_ok=True)

# Load comparison data
comparison_file = results_dir / "fea_comparison.json"
if comparison_file.exists():
    with open(comparison_file, "r") as f:
        comparison = json.load(f)
else:
    comparison = {}
    print("⚠️ No comparison data available for plotting.")

if comparison:
    materials = ["soft", "hard"]
    material_loss = [comparison[m]["material_core_loss"] for m in materials]
    fea_loss = [comparison[m]["fea_core_loss"] for m in materials]

    # Bar chart comparison
    x = range(len(materials))
    plt.figure(figsize=(6,4))
    plt.bar([i-0.15 for i in x], material_loss, width=0.3, label="Material")
    plt.bar([i+0.15 for i in x], fea_loss, width=0.3, label="FEA")
    plt.xticks(x, ["Soft Magnetic", "Hard Magnetic"])
    plt.ylabel("Core Loss")
    plt.title("Material vs FEA Core Loss Comparison")
    plt.legend()
    plt.grid(True, axis='y', linestyle='--', alpha=0.7)
    
    plot_file = plots_dir / "core_loss_comparison.png"
    plt.savefig(plot_file, dpi=150)
    plt.close()
    print(f"[INFO] Saved FEA vs Material comparison plot: {plot_file}")
