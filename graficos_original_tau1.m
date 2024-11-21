% VARIACIONES SEGUN tau1

global P
% Matriz de gráficos para visualizar cada grupo por separado
nombres = ['E','A','I','Q','R','C'];
figure;

% Dividir la figura en una matriz de subgráficos de 2x2
for i = 1:6
    subplot(3, 2, i); % Seleccionar el subgráfico correspondiente
    hold on
    
    legend_entries = cell(length(valores_tau1), 1); % Crear una celda para las entradas de la leyenda
    
    for j = 1:length(valores_tau1)
        % Graficar la variable correspondiente
        plot(tvalores_ori_tau1{j}, yvalores_ori_tau1{j}(:, i+1));
        
        % Añadir etiquetas y título
        xlabel('\bf Tiempo (días)');
        ylabel(['\bf', nombres(i), '(t)']);
        
        % Construir entrada de la leyenda solo con el valor de valores
        legend_entries{j} = sprintf('\\tau_1 = %g\n', valores_tau1(j));
    end
        
    % Dibujar líneas verticales
    xline(P.tau2, ':');
    
    % Definir la posición vertical de las etiquetas
    y_pos = 1.0 * max(ylim); 
    

    % Ajustar la posición horizontal de la etiqueta para tau2
    text(P.tau2 + 1, y_pos, '\tau_2', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); % Tamaño de fuente 6
    
    legend(legend_entries{1:length(valores_tau1)}); % Mostrar solo las entradas con valores asociados

    hold off
end


% Agregar título general a la figura sin recuadro
annotation('textbox', [0.35, 0.98, 0.3, 0.03], ...
    'String', 'Versión Original', ...
    'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold', ...
    'EdgeColor', 'none', 'FitBoxToText', 'on');