%  Introducimos las condiciones iniciales del modelo y los valores
%  numéricos de los parámetros. Se crean los vectores que contienen los
%  valores con los que estudiaremos la sensibilidad de cada parámetro.
% Se definen las variables P e init_conditions como variables globales,
% de forma que al cambiar un valor numerico en este script, este cambio se
% tenga en cuenta en todas las simulaciones y graficas que se realicen.

[S0, E0, A0, I0, Q0, R0, C0, M0] = deal(1.4e7, 1000, 1000, 100, 0, 0, 0, 0);
N0 = S0 + E0 + Q0 + A0 + I0 + R0;

global P init_conditions
P = struct('b', 300, 'mu', 2.06e-5, 'beta', 5.18e-8, 'sigma', 0.2597, 'phi', 0.95, 'epsilon', 0.59, 'alpha', 0.2591, 'p', 0.12, 'f2', 0.12, 'f1', 0.66, 'r2', 0.037, 'r1', 0.037, 'r3', 1/21, 'delta', 0.01, 'tau2', 4, 'tau1', 1);
init_conditions = [S0, E0, A0, I0, Q0, R0, C0, M0];

valores_phi = [0.5 0.7 0.95];
valores_f2 = [0.075 0.1 0.15];
valores_f1 = [0.2 0.4 0.7];
valores_tau2 = [2 3 4];
valores_tau1 = [0.25 1 1.25];