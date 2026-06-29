clear; close all; clc;

% Script para calcular el voltaje y la corriente que pasan por RLoad=330ohm

% Variables
R1 = 1000; R2 = 220; R3 = 1000; R4 = 510; Rload = 330;
V1 = 12; V2 = 5;

Rp = R1 + R3;
Rs = R2 + R4;

% Voltaje y corriente load por LKC
Vload = ((V1./Rp) + (V2./Rs)) ./ (1./Rp + 1./Rs + 1./Rload);
Iload = Vload / Rload;
Pload = Iload * Vload;

fprintf("Voltaje sobre resistencia Rload: %.4f V\n", Vload);
fprintf("Corriente sobre resistencia Rload: %.4f A\n", Iload);
fprintf("Potencia sobre resistencia Rload: %.4f W\n", Pload);
