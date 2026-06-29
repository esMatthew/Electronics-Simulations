clear; close all; clc;

% Respuesta al escalón de un circuito RL

% Variables analíticas
V = 5;
R = 126;
L = 1e-3;

tau = L/R;

% Variables simulación
data = readtable("RLPlot.csv");

t = data.time;

% Voltaje en el capacitor (analítico)
Lca = (V/R) * (1-exp(-t/tau));

% Voltaje en el capacitor (simulación)
Lce = data.I_L1_;

figure;
plot(t, Lca, LineWidth=2.2);
hold on;
plot(t, Lce, LineStyle="--", LineWidth=2.2);

xlabel('Tiempo (s)');
ylabel('Corriente (A)');
title('Respuesta al escalón de un circuito LC');
legend('Analítico', 'Simulación (SPICE)');

xlim([0 8e-5]);
ylim([0 0.045]);

grid on;