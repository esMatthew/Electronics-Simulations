clear; close all; clc;

% Respuesta al escalón de un circuito RLC

% Variables analíticas
Vf = 1.03;
alpha = 18000;
omega = 30600;
A1 = -1.03;
A2 = 1.028;

% Variables simulación
data = readtable("RLCPlot.csv");

t = data.time;

% Voltaje en el capacitor (analítico)
Vca = Vf + exp(-alpha.*t) .* (A1 * cos(omega.*t) + A2 * sin(omega.*t));

% Voltaje en el capacitor (simulación)
Vce = data.V__Vo_;

figure;
plot(t, Vca, LineWidth=2.2);
hold on;
plot(t, Vce, LineStyle="--", LineWidth=2.2);

xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Respuesta al escalón de un circuito RLC');
legend('Analítico', 'Simulación (SPICE)');

xlim([0 0.001]);
ylim([0 1.7]);

xticks(0 : 0.0001 : 0.0015);
grid on;