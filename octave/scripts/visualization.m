% Octave Visualization for MagneticMaterialSim

project_root = fileparts(mfilename('fullpath'));
results_dir = fullfile(project_root,'../../results/csv');

% Use environment variables if set, else fallback
soft_csv = getenv('SOFT_MESH_CSV');
hard_csv = getenv('HARD_MESH_CSV');

if isempty(soft_csv) || ~exist(soft_csv, 'file')
    warning('Soft mesh CSV not found. Falling back to default results CSV.');
    soft_csv = fullfile(results_dir, 'soft_mesh.csv');
end
if isempty(hard_csv) || ~exist(hard_csv, 'file')
    warning('Hard mesh CSV not found. Falling back to default results CSV.');
    hard_csv = fullfile(results_dir, 'hard_mesh.csv');
end

printf("Generating plots for %s and %s...\n", soft_csv, hard_csv);

soft_mesh = csvread(soft_csv, 1, 0);  % skip header
hard_mesh = csvread(hard_csv, 1, 0);

% --- Plot soft magnetic mesh ---
figure;
plot(soft_mesh(:,1), soft_mesh(:,2), 'bo');
title('Soft Magnetic Mesh Nodes');
xlabel('X'); ylabel('Y'); grid on;

% --- Plot hard magnetic mesh ---
figure;
plot(hard_mesh(:,1), hard_mesh(:,2), 'ro');
title('Hard Magnetic Mesh Nodes');
xlabel('X'); ylabel('Y'); grid on;

% --- Save plots ---
plots_dir = fullfile(project_root, '../../results/plots');
if ~exist(plots_dir, 'dir'); mkdir(plots_dir); end

soft_plot_file = fullfile(plots_dir, 'soft_mesh.png');
hard_plot_file = fullfile(plots_dir, 'hard_mesh.png');

print('-dpng', soft_plot_file);
print('-dpng', hard_plot_file);

printf("✅ Plots saved: %s , %s\n", soft_plot_file, hard_plot_file);
