clear; close all; clc;

% Datos Simulación.
data = readtable("Sim2.csv");

t = data.time;
VlSim = data.V__Vl_;

% Resultado Analítico:

Vm = 3.54;
omega = 100000;
phase = pi/4;

Vl = Vm .* cos(omega.*t + phase);

Vs = 5 .* cos(omega.*t);

% Resultado Experimental:

Vme = 3.03;
phase1 = 38.98 * pi/180;

Vle = Vme .* cos(omega.*t + phase1);

% Gráfica

figure;
plot(t, Vs, LineWidth=1);
hold on;
plot(t, VlSim, LineWidth=2);
plot(t, Vl, LineWidth=2, LineStyle="--");
plot(t, Vle, LineWidth=2, LineStyle=":");

legend("Vs-Alimentación", "Vl-Simulación", "Vl-Analítico", "Vl-Experimental", "Best");
title("Voltaje a lo largo de un Inductor en un cxto Sinusoidal RL");

xlabel("Tiempo (s)");
ylabel("Voltaje (V)");

xlim([min(t) max(t)]);

grid on;