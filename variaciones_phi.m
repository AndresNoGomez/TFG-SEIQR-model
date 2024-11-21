% Simulación del modelo conservativo para los diferentes valores del
% parámetro phi que hemos almacenado en el vector valores_phi. En la celda
% yvalores_phi almacenamos las matrices con la solución para cada uno de
% los valores. En la celda tvalores_phi almacenamos las mallas de tiempo
% correspondientes a la simulación con cada valor.


% Variables para almacenar resultados
yvalores_phi = cell(length(valores_phi), 1);
tvalores_phi = cell(length(valores_phi), 1);

global P

original_phi = P.phi;

for i = 1:length(valores_phi)
    P.phi = valores_phi(i);
    [t, y] = simulador();   
    tvalores_phi{i} = t;
    yvalores_phi{i} = y;
end

% Restablecer el valor original de phi
P.phi = original_phi;