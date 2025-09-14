% Core Analysis - updated to export FEA results for Python
project_root = fileparts(mfilename('fullpath'));
results_dir = fullfile(project_root,'../../python/results/csv');

fea_input_file = fullfile(results_dir,'fea_input.csv');

if ~exist(fea_input_file, 'file')
    error('FEA input CSV not found: %s', fea_input_file);
end

% Load combined soft + hard magnetic data
data = csvread(fea_input_file, 1, 0);  % skip header

% Compute mean core losses
soft_mean = mean(data(1,2));  % soft row
hard_mean = mean(data(2,2));  % hard row

printf("Soft magnetic mean core loss: %.2f\n", soft_mean);
printf("Hard magnetic mean core loss: %.2f\n", hard_mean);

% --- Export FEA results CSV for Python comparison ---
fea_results_file = fullfile(results_dir,'fea_results.csv');
fid = fopen(fea_results_file,'w');
fprintf(fid,'Material,MeanCoreLoss\n');
fprintf(fid,'soft,%.4f\n', soft_mean);
fprintf(fid,'hard,%.4f\n', hard_mean);
fclose(fid);
printf("✅ FEA results exported to: %s\n", fea_results_file);
