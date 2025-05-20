%% PCB Lumped Parameters Calculator (Microstrip / Stripline)
% Author: Adapted from Aleksandr Sidun (AnalogHub.ie)
% GitHub: https://github.com/YOUR_USERNAME/pcb-rlc-calculator
%
% Calculates lumped R, L, C and characteristic impedance Z of PCB traces
% Valid under 1 GHz
% Ignores skin effect, copper roughness, and loss tangent
% Geometry constraints (must be satisfied):
%   Microstrip: W/H < 7.475 - 1.25*(T/H)
%   Stripline:  W/B < 2.375 - 1.25*(T/B)

%% Input Parameters
type = "microstrip";              % Set to "microstrip" or "stripline"
temp = 25;                        % Temperature in Celsius
length = 1e-3;                    % Trace length [m]
width = 0.5e-3;                   % Trace width [m]
thickness = 35e-6;                % Trace thickness [m]
height = 0.4e-3;                  % Height from plane [m] (for microstrip)

%% Constants
ro = 1.724e-8;                    % Copper resistivity [Ohm·m]
alpha = 3.9e-3;                   % Temperature coefficient of resistance
eps_r = 4.46;                     % Relative permittivity (e.g., FR4 ~4.4–4.6)

%% Derived Parameters
B = 2 * height + thickness;       % Plane-to-plane spacing for stripline [m]

%% Calculation
switch lower(type)
    case "microstrip"
        if width / height < 7.475 - 1.25 * (thickness / height)
            R_lumped = 1e3 * ro * (1 + alpha * (temp - 25)) / (thickness * width); % mOhm/m
            C_lumped = 26.378 * (eps_r + 1.41) / log(5.98 * height / (0.8 * width + thickness)); % pF/m
            L_lumped = 199.65 * log(5.98 * height / (0.8 * width + thickness)); % nH/m
            Z = 87 * log(5.98 * height / (0.8 * width + thickness)) / sqrt(eps_r + 1.41); % Ohms
        else
            error("Geometry condition for microstrip not met. Check W/H and T/H.")
        end

    case "stripline"
        if width / B < 2.375 - 1.25 * (thickness / B)
            R_lumped = 1e3 * ro * (1 + alpha * (temp - 25)) / (thickness * width); % mOhm/m
            C_lumped = 39.37 * eps_r * sqrt(2) / log(1.9 * B / (0.8 * width + thickness)); % pF/m
            L_lumped = 199.8425 * log(1.9 * B / (0.8 * width + thickness)); % nH/m
            Z = 60 * log(1.9 * B / (0.8 * width + thickness)) / sqrt(eps_r); % Ohms
        else
            error("Geometry condition for stripline not met. Check W/B and T/B.")
        end

    otherwise
        error("Invalid type. Use 'microstrip' or 'stripline'.")
end

%% Total Values (scaled by length)
R = R_lumped * length; % mOhms
L = L_lumped * length; % nH
C = C_lumped * length; % pF

%% Display Results
fprintf("PCB %s parameters (Length = %.1f mm):\n", type, length * 1e3);
fprintf("R = %.3f mOhms\n", R);
fprintf("L = %.3f nH\n", L);
fprintf("C = %.3f pF\n", C);
fprintf("Z = %.3f Ohms\n", Z);
