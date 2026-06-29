clear; close all; clc;

% Datos Simulación.
data = readtable("Sim1.csv");

t = data.time;
VcSim = data.V__Vc_;

% Resultado Analítico:

Vm = 3.55;
omega = 1000;
phase = pi/4;

Vc = Vm .* cos(omega.*t - phase);

Vs = 5 .* cos(omega.*t);

% Resultado Experimental:

Vme = 3.35;
phase1 = 45.86 * pi/180;

Vce = Vme .* cos(omega.*t - phase1);

% Gráfica

figure;
plot(t, Vs, LineWidth=1);
hold on;
plot(t, VcSim, LineWidth=2);
plot(t, Vc, LineWidth=2, LineStyle="--");
plot(t, Vce, LineWidth=2, LineStyle=":");

legend("Vs-Alimentación", "Vc-Simulación", "Vc-Analítico", "Vc-Experimental", "Best");
title("Voltaje a lo largo de un Capacitor en un cxto Sinusoidal RC");

xlabel("Tiempo (s)");
ylabel("Voltaje (V)");

xlim([min(t) max(t)]);

grid on;