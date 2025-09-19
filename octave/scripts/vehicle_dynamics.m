## vehicle_dynamics.m
## Basic vehicle dynamics simulation (longitudinal model)

disp("=== Running Vehicle Dynamics Simulation (basic) ===");

## Parameters
m = 1200;        % vehicle mass (kg)
F_trac = 4000;   % traction force (N)
F_res = 300;     % resistive force (N)
dt = 0.1;        % time step (s)
t_end = 20;      % simulation time (s)

## Initialization
t = 0:dt:t_end;
v = zeros(size(t));  % velocity (m/s)
x = zeros(size(t));  % position (m)

## Simulation loop
for k = 2:length(t)
    a = (F_trac - F_res) / m;  % acceleration
    v(k) = v(k-1) + a * dt;
    x(k) = x(k-1) + v(k-1) * dt + 0.5 * a * dt^2;
end

## Ensure results directories exist
results_csv_dir = fullfile("results", "csv");
results_plots_dir = fullfile("results", "plots");

if ~exist(results_csv_dir, "dir")
    mkdir(results_csv_dir);
end
if ~exist(results_plots_dir, "dir")
    mkdir(results_plots_dir);
end

## Save results to CSV
results_file = fullfile(results_csv_dir, "vehicle_dynamics.csv");
csvwrite(results_file, [t' v' x']);

## Plot results
figure;
subplot(2,1,1);
plot(t, v, "b-", "LineWidth", 2);
xlabel("Time (s)"); ylabel("Velocity (m/s)");
title("Vehicle Velocity vs Time"); grid on;

subplot(2,1,2);
plot(t, x, "r-", "LineWidth", 2);
xlabel("Time (s)"); ylabel("Position (m)");
title("Vehicle Position vs Time"); grid on;

## Save plot
print(fullfile(results_plots_dir, "vehicle_dynamics.png"), "-dpng");

disp("✅ Vehicle dynamics simulation complete.");
