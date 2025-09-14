% test_octave_core.m
printf("=== Testing Octave core scripts ===\n");

project_root = fileparts(mfilename('fullpath'));
results_dir = fullfile(project_root,'../python/results/csv');

soft_csv = fullfile(results_dir, 'soft_mesh.csv');
hard_csv = fullfile(results_dir, 'hard_mesh.csv');

if exist(soft_csv, 'file') && exist(hard_csv, 'file')
    printf("✅ Mesh CSV files found.\n");
else
    printf("⚠️ Mesh CSV files missing.\n");
end

% Test helpers
pkg load statistics; % if any stats functions are used
soft_data = csvread(soft_csv);
hard_data = csvread(hard_csv);

printf("Soft mesh nodes: %d\n", size(soft_data,1));
printf("Hard mesh nodes: %d\n", size(hard_data,1));
