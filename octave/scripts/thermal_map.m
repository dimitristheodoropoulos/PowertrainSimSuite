% Simple thermal model
clear; clc;

losses = linspace(100, 500, 10);
ambient = 25;
thermal_resistance = 0.1; % K/W
temperature = ambient + losses * thermal_resistance;

data = [losses' temperature'];
csvwrite('results/csv/thermal_map.csv', data);

% Plot
figure;
plot(losses, temperature, 'm-o','LineWidth',2);
xlabel('Losses [W]');
ylabel('Temperature [C]');
title('Thermal Map');
grid on;
print -dpng 'results/plots/thermal_map.png';
