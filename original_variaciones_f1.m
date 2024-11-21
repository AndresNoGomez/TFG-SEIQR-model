% Variables para almacenar resultados
yvalores_ori_f1 = cell(length(valores_f1), 1);
tvalores_ori_f1 = cell(length(valores_f1), 1);

global P
% Guardar el valor original de f1
original_f1 = P.f1;

for i = 1:length(valores_f1)
    P.f1 = valores_f1(i);
    
    % Llamar a la función simulacion
    [t, y] = simulador_ori();
    
    % Guardar los resultados
    tvalores_ori_f1{i} = t;
    yvalores_ori_f1{i} = y;
end

% Restablecer el valor original de f1
P.f1 = original_f1;