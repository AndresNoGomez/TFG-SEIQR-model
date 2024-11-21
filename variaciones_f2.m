% Variables para almacenar resultados
yvalores_f2 = cell(length(valores_f2), 1);
tvalores_f2 = cell(length(valores_f2), 1);

global P
% Guardar el valor original de f2
original_f2 = P.f2;

for i = 1:length(valores_f2)
    P.f2 = valores_f2(i);
    
    % Llamar a la función simulacion
    [t, y] = simulador();
    
    % Guardar los resultados
    tvalores_f2{i} = t;
    yvalores_f2{i} = y;
end

% Restablecer el valor original de f2
P.f2 = original_f2;