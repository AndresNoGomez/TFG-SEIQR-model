
% VARIACIONES SEGUN phi:

global P
% Matriz de gráficos para visualizar cada grupo por separado
nombres = ['E','A','I','Q','R','C'];
figure;

% Dividir la figura en una matriz de subgráficos de 2x2
for i = 1:6
    subplot(3, 2, i); % Seleccionar el subgráfico correspondiente
    hold on
    
    % Añadir etiquetas y título
    xlabel('\bf Tiempo (días)');
    ylabel(['\bf', nombres(i), '(t)']);
    
    legend_entries = cell(length(valores_phi), 1); % Crear una celda para las entradas de la leyenda
    
    for j = 1:length(valores_phi)
        % Graficar la variable correspondiente
        plot(tvalores_ori_phi{j}, yvalores_ori_phi{j}(:, i+1));
        
        
        % Construir entrada de la leyenda solo con el valor de valores
        legend_entries{j} = sprintf('\\phi = %g\n', valores_phi(j));
    end
        
    % Dibujar líneas verticales
    xline(P.tau1, ':');
    xline(P.tau2, ':');
    
    % Definir la posición vertical de las etiquetas
    y_pos = 1.0 * max(ylim); 
    
    % Agregar etiquetas para tau1 y tau2 en la parte superior del gráfico
    text(P.tau1 - 0.7, y_pos, '\tau_1', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); % Tamaño de fuente 6
    
    % Ajustar la posición horizontal de la etiqueta para tau2
    text(P.tau2 + 1, y_pos, '\tau_2', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); % Tamaño de fuente 6
    
    legend(legend_entries{1:length(valores_phi)}); % Mostrar solo las entradas con valores asociados

    hold off
end

% Agregar título general a la figura sin recuadro
annotation('textbox', [0.35, 0.98, 0.3, 0.03], ...
    'String', 'Versión Original', ...
    'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold', ...
    'EdgeColor', 'none', 'FitBoxToText', 'on');