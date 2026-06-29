clear; close all; clc;

%% Filtro Pasa Bajas

% Datos de simulación Pasa Bajas (PB).

PBsim = readtable("PBsim.csv");

f        = PBsim.frequency;
Vo1_gain = PBsim.V__Vo1__gain_;

% Los valores para Vo, en KiCad, son graficados por medio de una escala
% logarítmica. Debemos de pasarlos a su escala lineal

Vo1 = 10.^(Vo1_gain / 20); % Magnitud del voltaje (Simulación)

% Datos experimentales

PBexp = readtable("medidas lab4.xlsx");

f_exp    = PBexp.frecuenciaHz;
Vo1_exp  = PBexp.VpVamp;            % Valores crudos
Vo1_expN = Vo1_exp ./ max(Vo1_exp); % Valores normalizados

figure;

semilogx(f, Vo1, LineWidth=2);
hold on;
semilogx(f_exp, Vo1_expN, LineWidth=2, Marker='o', MarkerEdgeColor='r', MarkerSize=10, LineStyle='--');
grid on;
title("Filtro Pasa Bajas");
xlabel("Frecuencia (Hz)");
ylabel("|H(j\omega)|");
legend('Simulación', 'Experimento');
ylim([0 1.05]);

xline(1000, ':r', 'f_c', 'LineWidth', 1.5);

hold off;

%% Filtro Pasa Altas

% Datos de simulación Pasa Altas (PA).

PAsim = readtable("PAsim.csv");

Vo2_gain = PAsim.V__Vo2__gain_;

% Paso de escala logarítmica (en dB) a escala lineal

Vo2 = 10.^(Vo2_gain / 20); % Magnitud del voltaje (Simulación)

% Datos experimentales

Vo2_exp  = PBexp.VpVamp_1;           % Valores crudos
Vo2_expN = Vo2_exp ./ max(Vo2_exp);  % Valores normalizados

figure;

semilogx(f, Vo2, LineWidth=2);
hold on;
semilogx(f_exp, Vo2_expN, LineWidth=2, Marker='o', MarkerEdgeColor='r', MarkerSize=10, LineStyle='--');
grid on;
title("Filtro Pasa Altas");
xlabel("Frecuencia (Hz)");
ylabel("|H(j\omega)|");
legend('Simulación', 'Experimento');
ylim([0 1.05]);

xline(100, ':r', 'f_c', 'LineWidth', 1.5);
hold off;

%% Filtro Pasa Bandas

% Datos de simulación Pasa Bandas (PBN).

PBNsim = readtable("PNBsim.csv");

Vo3_gain = PBNsim.V__Vo3__gain_;

PBNsim_real = readtable("PBNsim_real.csv");

Vo3_gain_real = PBNsim_real.V__Vo3__gain_;

% Paso de escala logarítmica (en dB) a escala lineal

Vo3 = 10.^(Vo3_gain / 20); % Magnitud del voltaje (Simulación)
Vo3_real = 10.^(Vo3_gain_real / 20); % Magnitud del voltaje (Simulación)

% Datos experimentales

Vo3_exp  = PBexp.VpVamp_2;           % Valores crudos
Vo3_expN = Vo3_exp ./ max(Vo3_exp);  % Valores normalizados

figure;

semilogx(f, Vo3, LineWidth=2);
hold on;
semilogx(f_exp, Vo3_expN, LineWidth=2, Marker='o', MarkerEdgeColor='r', MarkerSize=10, LineStyle='--');
semilogx(f, Vo3_real, LineWidth=2)
grid on;
title("Filtro Pasa Bandas");
xlabel("Frecuencia (Hz)");
ylabel("|H(j\omega)|");
legend('Simulación', 'Experimento', "Simulación (real)");
ylim([0 1.05]);

xline(452, '--r', 'f_{c1},', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
xline(552, '--r', 'f_{c2}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right');
hold off;

%% Filtro Rechaza Bandas

% Datos de simulación Pasa Bandas (RBN).

RBNsim = readtable("RBNsim.csv");

Vo4_gain = RBNsim.V__Vo4__gain_;

RBNsim_real = readtable("RBN_real.csv");

Vo4_gain_real = RBNsim_real.V__Vo4__gain_;

% Paso de escala logarítmica (en dB) a escala lineal

Vo4 = 10.^(Vo4_gain / 20); % Magnitud del voltaje (Simulación)
Vo4_real = 10.^(Vo4_gain_real / 20); % Magnitud del voltaje (Simulación)

% Datos experimentales

Vo4_exp  = PBexp.VpVamp_3;           % Valores crudos
Vo4_expN = Vo4_exp ./ max(Vo4_exp);  % Valores normalizados

figure;

semilogx(f, Vo4, LineWidth=2);
hold on;
semilogx(f_exp, Vo4_expN, LineWidth=2, Marker='o', MarkerEdgeColor='r', MarkerSize=10, LineStyle='--');
semilogx(f, Vo4_real, LineWidth=2);
grid on;
title("Filtro Rechaza Bandas");
xlabel("Frecuencia (Hz)");
ylabel("|H(j\omega)|");
legend('Simulación', 'Experimento', "Simulación (real)");
ylim([0 1.05]);

xline(100, '--r', 'f_{c1},', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
xline(1000, '--r', 'f_{c2}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right');
hold off;