
global P

% Gráfico de todas las variables juntas:
figure;
plot(t_ori, y_ori(:,1), 'b', t_ori, y_ori(:,2), 'r', t_ori, y_ori(:,3), 'g', t_ori, y_ori(:,4), 'm', t_ori, y_ori(:,5), 'c', t_ori, y_ori(:,6), t_ori, y_ori(:,7),t_ori, y_ori(:,8),'k');
xlabel('Tiempo (días)');
ylabel('Población');
title('Versión Original');
axis([0 100 0 4000]);
hold on
xline(P.tau1,':');
xline(P.tau2,':');
h = legend;
h.String = {'S', 'E', 'A', 'I', 'Q', 'R','C', 'M'};
hold off