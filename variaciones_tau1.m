% Variables para almacenar resultados
yvalores_tau1 = cell(length(valores_tau1), 1);
tvalores_tau1 = cell(length(valores_tau1), 1);

global P
% Guardar el valor original de tau1
original_tau1 = P.tau1;

for i = 1:length(valores_tau1)
    P.tau1 = valores_tau1(i);
    
    % Llamar a la función simulacion
    [t, y] = simulador();
    
    % Guardar los resultados
    tvalores_tau1{i} = t;
    yvalores_tau1{i} = y;
end

% Restablecer el valor original de tau1
P.tau1 = original_tau1;