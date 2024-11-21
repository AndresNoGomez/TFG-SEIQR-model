% Gráficamos la solución obtenida en los grupos E, A, I, Q, R, C para cada
% uno de los valores de phi que hemos considerado.

% global P
% nombres = {'E','A','I','Q','R','C'};
% figure;
% 
% % Crear un array para almacenar las líneas de las gráficas
% all_lines = [];
% 
% for i = 1:6
% 
%     subplot(3, 2, i); 
%     hold on
% 
%     if i == 3
%         axis([0 30 0 170])
%     end
% 
%     xlabel('\bf Tiempo (días)');
%     ylabel(['\bf', nombres{i}, '(t)']);
% 
%     for j = 1:length(valores_phi)
%         line_handle = plot(tvalores_phi{j}, yvalores_phi{j}(:, i+1));
%         if i == 1 % Solo almacenar las líneas una vez (en la primera subgráfica)
%             all_lines = [all_lines, line_handle];
%         end
%     end
% 
%     xline(P.tau1, ':');
%     xline(P.tau2, ':');
% 
%     y_pos = 1.0 * max(ylim); 
%     text(P.tau1 - 0.7, y_pos, '\tau_1', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); 
%     text(P.tau2 + 1, y_pos, '\tau_2', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); 
% 
%     hold off
% end
% 
% % Crear las entradas de la leyenda
% legend_entries = cell(length(valores_phi), 1);
% for j = 1:length(valores_phi)
%     legend_entries{j} = sprintf('\\phi = %g\n', valores_phi(j));
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
% 




global P
nombres = {'E','A','I','Q','R','C'};
figure;

% Crear un array para almacenar las líneas de las gráficas
all_lines = [];

% Definir los colores para las líneas
line_colors = [0.9 0.9 0; 1 0.5 0; 0.7 0 0]; % Rojo oscuro, Naranja, Amarillo oscuro

for i = 1:6
    subplot(3, 2, i); 
    hold on

    if i == 3
        axis([0 30 0 170])
    end

    xlabel('\bf Tiempo (días)');
    ylabel(['\bf', nombres{i}, '(t)']);

    for j = 1:length(valores_phi)
        if j <= 3
            line_handle = plot(tvalores_phi{j}, yvalores_phi{j}(:, i+1), 'LineWidth', 1.5, 'Color', line_colors(j,:));
        else
            line_handle = plot(tvalores_phi{j}, yvalores_phi{j}(:, i+1), 'LineWidth', 1.5);
        end
        if i == 1 % Solo almacenar las líneas una vez (en la primera subgráfica)
            all_lines = [all_lines, line_handle];
        end
    end

    xline(P.tau1, ':');
    xline(P.tau2, ':');

    y_pos = 1.0 * max(ylim); 
    text(P.tau1 - 0.7, y_pos, '\tau_1', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); 
    text(P.tau2 + 1, y_pos, '\tau_2', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 6.5); 

    hold off
end

% Crear las entradas de la leyenda
legend_entries = cell(length(valores_phi), 1);
for j = 1:length(valores_phi)
    legend_entries{j} = sprintf('\\phi = %g\n', valores_phi(j));
end

% Crear la leyenda global
legend_handle = legend(all_lines, legend_entries);

% Ajustar la posición de la leyenda para que esté fuera de las gráficas, arriba en el centro
new_position = [0.46, 0.92, 0.1, 0.11]; % [x, y, width, height]
legend_handle.Position = new_position; 
legend_handle.Units = 'normalized';
legend_handle.Orientation = 'horizontal'; % Opcional: para que la leyenda sea horizontal
set(legend_handle, 'FontSize', 11); % Cambia este valor para ajustar el tamaño de la fuente de la leyenda

