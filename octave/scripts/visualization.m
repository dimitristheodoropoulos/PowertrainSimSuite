% Octave Visualization for PowertrainSimSuite Phase3 FAST

project_root = fileparts(mfilename('fullpath'));
results_dir = fullfile(project_root,'../../results/csv');

soft_csv = getenv('SOFT_MESH_CSV');
hard_csv = getenv('HARD_MESH_CSV');

if isempty(soft_csv) || ~exist(soft_csv, 'file')
    warning('Soft mesh CSV not found. Using default.');
    soft_csv = fullfile(results_dir, 'soft_mesh.csv');
end
if isempty(hard_csv) || ~exist(hard_csv, 'file')
    warning('Hard mesh CSV not found. Using default.');
    hard_csv = fullfile(results_dir, 'hard_mesh.csv');
end

printf("Generating plots for %s and %s...\n", soft_csv, hard_csv);

soft_mesh = csvread(soft_csv, 1, 0);
hard_mesh = csvread(hard_csv, 1, 0);

% --- Safe graphics toolkit ---
try
    graphics_toolkit("qt");
    printf("Using Qt toolkit.\n");
catch
    graphics_toolkit("gnuplot");
    printf("Qt not available. Using gnuplot headless.\n");
end

% --- Force headless fonts ---
set(0,'DefaultAxesFontName','Liberation Sans');
set(0,'DefaultTextFontName','Liberation Sans');
set(0, 'DefaultFigureVisible','off');

% --- Soft mesh plot ---
figure;
plot(soft_mesh(:,1), soft_mesh(:,2), 'bo');
title('Soft Magnetic Mesh Nodes');
xlabel('X'); ylabel('Y'); grid on;

% --- Hard mesh plot ---
figure;
plot(hard_mesh(:,1), hard_mesh(:,2), 'ro');
title('Hard Magnetic Mesh Nodes');
xlabel('X'); ylabel('Y'); grid on;

% --- Save plots ---
plots_dir = fullfile(project_root, '../../results/plots');
if ~exist(plots_dir,'dir'); mkdir(plots_dir); end

print('-dpng', fullfile(plots_dir,'soft_mesh.png'));
print('-dpng', fullfile(plots_dir,'hard_mesh.png'));

printf("✅ Plots saved.\n");
