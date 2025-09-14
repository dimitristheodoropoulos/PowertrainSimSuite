#!/bin/bash
project_root=$(dirname "$(realpath "$0")")/..

circuits_dir="$project_root/ngspice/circuits"
mkdir -p "$project_root/results/logs"

# Remove quotes from wildcard so Bash expands *.cir
for cir in $circuits_dir/*.cir; do
    echo "Running Ngspice circuit: $cir"
    ngspice -b "$cir" -o "$project_root/results/logs/$(basename "$cir" .cir).log"
done
