clear; close all; clc;

Rth = 535;
Vth = 6.87;

Rload = 100:0.1:1500;

Iload = Vth ./ (Rth + Rload);
Pload = Iload.^2 .* Rload;

% Información de la tabla
rawTable = readtable('Mediciones Lab 2.xlsx','Sheet','Sheet1');
x = rawTable.Rload_Ohm_;
y = rawTable.Pload_Watts_;

% Display
figure;

plot(x,y, LineWidth=2);
hold on;

plot(Rload, Pload, LineWidth=2);

grid on;
xlabel('Resistencia (Ohms)');
ylabel('Potencia (Watts)');
title('Potencia vs Resistencia en equivalente Thévenin');

legend("P Medido", "P Ideal", 'Location','best');