clear; close all; clc;

% Variables
R1 = 1000;
R2 = 1000;
R3 = 500;
R4 = 500;

Req = 1/(1/(R4+R2)+1/500);

t = 0:0.01e-3:5e-3;
f = 1000; 

% Cálculos
Vin = 10.*sin(2 .* pi .* f .* t);
Vx = Vin .* (Req/(Req+R1)); % Voltaje que alimenta la segunda malla del circuito
Vout = Vx .* (R4/(R4+R2)); % Voltaje de salida

disp(max(Vout));
disp(max(Vin));

% Resultados
plot(t, Vin, LineWidth=2, Color='r');
hold on;
plot(t, Vout, LineWidth=2, Color='b');

legend("Vin", "Vout", Location="best");
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Voltaje de entrada y salida del circuito');

grid on;