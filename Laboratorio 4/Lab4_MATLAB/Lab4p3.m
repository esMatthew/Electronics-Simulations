clear; close all; clc;

% Datos experimentales

Q = 80;
P = 350;
Qprima = -Q;

f = 60;
omega = 2*pi*f;

Vrms = 127;

Xc = -(Vrms)^2 / Qprima;

C = 1/(Xc * omega);

disp(C*1000000);