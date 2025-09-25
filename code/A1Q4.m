% Housekeeping
clear;
clc;

% Given constants
T = 10; % Wave period in seconds
g = 9.81; % Gravitational acceleration in m/s^2
d = 150; % Water depth in meters

% Initial guess for wavelength
L_old = (g * T^2) / (2 * pi); % Initial approximation for deep water
tolerance = 1e-6; % Convergence tolerance
max_iter = 100; % Maximum iterations
iteration = 0; % Initialize iteration counter

% Iterative calculation using while loop
while true
    % Update wavelength using the iterative equation
    L_new = (g * T^2) / (2 * pi) * tanh((2 * pi * d) / L_old);
    
    % Increment iteration counter
    iteration = iteration + 1;
    
    % Check convergence
    if abs(L_new - L_old) < tolerance
        fprintf('Converged after %d iterations: Wavelength = %.4f m\n', iteration, L_new);
        break;
    end
    
    % Update L_old for the next iteration
    L_old = L_new;
    
    % Check if maximum iterations reached
    if iteration >= max_iter
        fprintf('Solution did not converge after %d iterations.\n', max_iter);
        break;
    end
end

% Calculate Celerity (wave speed)
C = L_new / T;
fprintf('Celerity = %.4f m/s\n', C);

% Visualization
figure()
bar(1, L_new, 'FaceColor', 'b'); % Visualize Wavelength
hold on;
bar(2, C, 'FaceColor', 'r'); % Visualize Celerity
xticks([1 2])
xticklabels({'Wavelength (L)', 'Celerity (C)'})
ylabel('Value (meters or meters/second)')
title('Wave Properties at Depth = 150 m')
grid on;
