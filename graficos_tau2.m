% VARIACIONES SEGUN tau2:
% 
% global P
% nombres = {'E','A','I','Q','R','C'};
% figure;
% 
% % Crear un array para almacenar las líneas de las gráficas
% all_lines = [];
% 
% % Dividir la figura en una matriz de subgráficos de 3x2
% for i = 1:6
%     subplot(3, 2, i); 
%     hold on
% 
%     if i == 3
%         axis([0 30 0 170])
%     end
% 
%     legend_entries = cell(length(valores_tau2), 1);
% 
%     for j = 1:length(valores_tau2)
%         line_handle = plot(tvalores_tau2{j}, yvalores_tau2{j}(:, i+1));
% 
%         if i == 1 % Solo almacenar las líneas una vez (en la primera subgráfica)
%             all_lines = [all_lines, line_handle];
%         end
% 
%         xlabel('\bf Tiempo (días)');
%         ylabel(['\bf', nombres{i}, '(t)']);
%         legend_entries{j} = sprintf('\\tau_2 = %g\n', valores_tau2(j));
%     end
% 
%     % Dibujar líneas verticales
%     xline(P.tau1, ':');
% 
%     % Definir la posición vertical de las etiquetas
%     y_pos = 1.0 * max(ylim); 
% 
%     % Agregar etiquetas para tau1 en la parte superior del gráfico
%     text(P.tau1 - 0.7, y_pos, '\tau_1', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); % Tamaño de fuente 6
% 
%     hold off
% end
% 
% % Crear las entradas de la leyenda
% legend_entries = cell(length(valores_tau2), 1);
% for j = 1:length(valores_tau2)
%     legend_entries{j} = sprintf('\\tau_2 = %g\n', valores_tau2(j));
% end
% 
% % Crear la leyenda global
% legend_handle = legend(all_lines, legend_entries);
% 
% % Ajustar la posición de la leyenda para que esté fuera de las gráficas, arriba en el centro
% new_position = [0.46, 0.92, 0.1, 0.11]; % [x, y, width, height]
% legend_handle.Position = new_position; 
% legend_handle.Units = 'normalized';
% legend_handle.Orientation = 'horizontal'; % Opcional: para que la leyenda sea horizontal
% set(legend_handle, 'FontSize', 11); % Cambia este valor para ajustar el tamaño de la fuente de la leyenda


global P
nombres = {'E','A','I','Q','R','C'};
figure;

% Crear un array para almacenar las líneas de las gráficas
all_lines = [];

% Definir los colores para las líneas
line_colors = [0.9 0.9 0; 1 0.5 0; 0.7 0 0]; % Amarillo, Naranja, Rojo

% Dividir la figura en una matriz de subgráficos de 3x2
for i = 1:6
    subplot(3, 2, i); 
    hold on

    if i == 3
        axis([0 30 0 170])
    end

    legend_entries = cell(length(valores_tau2), 1);

    for j = 1:length(valores_tau2)
        line_handle = plot(tvalores_tau2{j}, yvalores_tau2{j}(:, i+1), 'LineWidth', 1.3, 'Color', line_colors(j,:));

        if i == 1 % Solo almacenar las líneas una vez (en la primera subgráfica)
            all_lines = [all_lines, line_handle];
        end

        xlabel('\bf Tiempo (días)');
        ylabel(['\bf', nombres{i}, '(t)']);
        legend_entries{j} = sprintf('\\tau_2 = %g\n', valores_tau2(j));
    end

    % Dibujar líneas verticales
    xline(P.tau1, ':');

    % Definir la posición vertical de las etiquetas
    y_pos = 1.0 * max(ylim); 

    % Agregar etiquetas para tau1 en la parte superior del gráfico
    text(P.tau1 - 0.7, y_pos, '\tau_1', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); % Tamaño de fuente 6

    hold off
end

% Crear las entradas de la leyenda
legend_entries = cell(length(valores_tau2), 1);
for j = 1:length(valores_tau2)
    legend_entries{j} = sprintf('\\tau_2 = %g\n', valores_tau2(j));
end

% Crear la leyenda global
legend_handle = legend(all_lines, legend_entries);

% Ajustar la posición de la leyenda para que esté fuera de las gráficas, arriba en el centro
new_position = [0.46, 0.92, 0.1, 0.11]; % [x, y, width, height]
legend_handle.Position = new_position; 
legend_handle.Units = 'normalized';
legend_handle.Orientation = 'horizontal'; % Opcional: para que la leyenda sea horizontal
set(legend_handle, 'FontSize', 11); % Cambia este valor para ajustar el tamaño de la fuente de la leyenda


