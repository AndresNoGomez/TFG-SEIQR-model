% Variables para almacenar resultados
yvalores_ori_phi = cell(length(valores_phi), 1);
tvalores_ori_phi = cell(length(valores_phi), 1);

global P
% Guardar el valor original de phi
original_phi = P.phi;

for i = 1:length(valores_phi)
    P.phi = valores_phi(i);
    
    % Llamar a la función simulacion
    [t, y] = simulador_ori();
    
    % Guardar los resultados
    tvalores_ori_phi{i} = t;
    yvalores_ori_phi{i} = y;
end

% Restablecer el valor original de phi
P.phi = original_phi;
