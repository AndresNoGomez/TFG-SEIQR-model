% Variables para almacenar resultados
yvalores_ori_tau2 = cell(length(valores_tau2), 1);
tvalores_ori_tau2 = cell(length(valores_tau2), 1);

global P
% Guardar el valor original de tau2
original_tau2 = P.tau2;

for i = 1:length(valores_tau2)
    P.tau2 = valores_tau2(i);
    
    % Llamar a la función simulacion
    [t, y] = simulador_ori();
    
    % Guardar los resultados
    tvalores_ori_tau2{i} = t;
    yvalores_ori_tau2{i} = y;
end

% Restablecer el valor original de tau2
P.tau2 = original_tau2;