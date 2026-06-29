clear; close all; clc;

% Respuesta al escalón de un circuito RC

% Variables analíticas
R = 10000;
I = 0.5e-3;
C = 0.1e-6;

tau = R * C;

% Variables simulación
data = readtable("RCPlot.csv");

t = data.time;

% Voltaje en el capacitor (analítico)
Vca = I * R * (1 - exp(-t/tau));

% Voltaje en el capacitor (simulación)
Vce = data.V__VC1_;

figure;
plot(t, Vca, LineWidth=2.2);
hold on;
plot(t, Vce, LineStyle="--", LineWidth=2.2);

xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Respuesta al escalón de un circuito RC');
legend('Analítico', 'Simulación (SPICE)');

xlim([0 0.01]);
ylim([0 5.5]);

grid on;