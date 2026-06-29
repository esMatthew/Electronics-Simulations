clear; close all; clc;

Req = 0:0.1:20;
V = 10; % Volts
Rs = 8; % Resistencia interna

I = V./(Rs + Req);
P = (I.^2) .* Req;

Req_ideal = Rs;
P_max = max(P);

figure;
plot(Req, P, 'LineWidth', 1.6);
hold on;

axis([0 20 0 (P_max + 0.5)]);

yline(P_max, 'r--', 'LineWidth', 1.6);
xline(Req_ideal, 'r:', 'LineWidth', 1.2);

text(Req_ideal - 2.5, P_max + 0.15, ...
    sprintf('Ideal: %.2f W\nReq = %.1f \\Omega', P_max, Req_ideal), ...
    'Color','r','FontSize',10);

grid on;
xlabel("Resistencia [Ohm]");
ylabel("Potencia [W]");
title("Potencia vs Resistencia equivalente de red resistiva");
legend("P(Req)", "P ideal", 'Location','best');

hold off;