clear; close all; clc; 

% Variables
R1 = 1000;
R2 = 10000;
V1 = 10;

% Cálculos
Vout = (R2/(R1+R2)) * V1;
I = V1 / (R1 + R2);

VR1 = R1 * I;

% Resultados
fprintf("Voltaje de salida Vout: %.4f V\n", Vout);
fprintf("Voltaje de Resistencia 1: %.4f V\n", VR1);
fprintf("Corriente: %.2e A\n", I);