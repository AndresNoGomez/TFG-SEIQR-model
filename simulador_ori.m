% La funcion simulador_ori ejecuta simulacion numérica del modelo original en el intervalo [0,100]. 

% Se definen t1=min{tau1, tau2}, t2 = max{tau1,tau2} de forma que la
% simulación queda dividida en tres intervalos:
% [0,t1) : Submodelo sin cuarentenas
% [t1,t2) : Submodelo con cuarentenas solo para sintomaticos (o asintomaticos)
% [t2,100] : Modelo alcompleto

% No tiene argumentos ya que hemos definido la cadena P con los parametros
% como una variable global. Antes de cada llamada a la funcion, se
% ajustaran los valores de los parametros según las necesidades.



function [t, y] = simulador_ori()

    global P

    lags = [P.tau1 P.tau2];
    options = ddeset('RelTol', 1e-6, 'AbsTol', 1e-6);


    % Caso 1: La cuarentena se impone primero en los sintomaticos.
    if P.tau1 < P.tau2
        t1 = P.tau1;
        t2 = P.tau2;
        tspan_sin = [0 t1];
        tspan_pre2 = [t1 t2];
        tspan_ppal = [t2 100];


        % Primer intervalo [0, t1)
        sol_pre1 = dde23(@ddefun_sin, lags, @history, tspan_sin, options);

        % Segundo intervalo [t1, t2)
        sol_pre2 = dde23(@ddefun_pre1, lags, sol_pre1, tspan_pre2, options);

        % Tercer intervalo [t2, 100]
        sol_ppal = dde23(@ddefun, lags, sol_pre2, tspan_ppal, options);



    % Caso 2: La cuarentena se impone primero en los asintomaticos
    elseif P.tau2 < P.tau1
        t1 = P.tau2;
        t2 = P.tau1;
        tspan_sin = [0 t1];
        tspan_pre2 = [t1 t2];
        tspan_ppal = [t2 100];

        % Primer intervalo [0, t1)
        sol_pre1 = dde23(@ddefun_sin, lags, @history, tspan_sin, options);

        % Segundo intervalo [t1, t2)
        sol_pre2 = dde23(@ddefun_pre2, lags, sol_pre1, tspan_pre2, options);

        % Tercer intervalo [t2, 100]
        sol_ppal = dde23(@ddefun, lags, sol_pre2, tspan_ppal, options);



    % Caso 3: La cuarentena se impone en sintomaticos y asintomaticos a la vez
    else
        t1 = P.tau1;
        tspan_sin = [0 t1];
        tspan_ppal = [t1 100];

        % Primer intervalo [0, t1)
        sol_pre1 = dde23(@ddefun_sin, lags, @history, tspan_sin, options);

        % Intervalo final [t1, 100]
        sol_ppal = dde23(@ddefun, lags, sol_pre1, tspan_ppal, options);
    end



    % Malla de discretizacion del tiempo:
    t = transpose(sol_ppal.x);
    % Matriz con las soluciones finales:
    y = transpose(sol_ppal.y);
end




% Sistema del modelo completo:
function dydt = ddefun(t, y, Z)
    global P

    ylag1 = Z(:, 1);
    ylag2 = Z(:, 2);

    dydt = zeros(8, 1);
    dydt(1) = P.b - P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.mu * y(1);
    dydt(2) = P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.alpha * y(2) - P.mu * y(2);
    dydt(3) = (1 - P.p) * P.alpha * y(2) - P.f2 * y(3) - P.r2 * y(3) - P.mu * y(3);
    dydt(4) = P.p * P.alpha * y(2) - P.f1 * y(4) - P.r1 * y(4) - P.mu * y(4);
    dydt(5) = P.f2 * ylag2(3) + P.f1 * ylag1(4) - P.r3 * y(5) - P.delta * y(5) - P.mu * y(5);
    dydt(6) = P.r2 * y(3) + P.r1 * y(4) + P.r3 * y(5) - P.mu * y(6);
    dydt(7) = P.delta * y(5);
    dydt(8) = P.mu * (y(1) + y(2) + y(3) + y(4) + y(5) + y(6));
end



% Sistema del submodelo sin cuarentenas:
function dydt = ddefun_sin(t, y, Z)
    global P

    ylag1 = Z(:, 1);
    ylag2 = Z(:, 2);

    dydt = zeros(8, 1);
    dydt(1) = P.b - P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.mu * y(1);
    dydt(2) = P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.alpha * y(2) - P.mu * y(2);
    dydt(3) = (1 - P.p) * P.alpha * y(2) - P.r2 * y(3) - P.mu * y(3) - P.delta*P.f2*y(3) ;
    dydt(4) = P.p * P.alpha * y(2) - P.r1 * y(4) - P.mu * y(4) - P.delta * P.f1 * y(4);
    dydt(5) = 0;
    dydt(6) = P.r2 * y(3) + P.r1 * y(4) - P.mu * y(6);
    dydt(7) = P.delta * P.f1 * y(4) + P.delta*P.f2*y(3);
    dydt(8) = P.mu * (y(1) + y(2) + y(3) + y(4) + y(5) + y(6));
end


% Sistema del submodelo con cuarentenas solo en sintomaticos:
function dydt = ddefun_pre1(t, y, Z)
    global P

    ylag1 = Z(:, 1);
    ylag2 = Z(:, 2);

    dydt = zeros(8, 1);
    dydt(1) = P.b - P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.mu * y(1);
    dydt(2) = P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.alpha * y(2) - P.mu * y(2);
    dydt(3) = (1 - P.p) * P.alpha * y(2) - P.r2 * y(3) - P.mu * y(3) - P.delta*P.f2*y(3) ;
    dydt(4) = P.p * P.alpha * y(2) - P.f1 * y(4) - P.r1 * y(4) - P.mu * y(4) - P.delta * P.f1 * y(4);
    dydt(5) = P.f1 * ylag1(4) - P.r3 * y(5) - P.mu * y(5);
    dydt(6) = P.r2 * y(3) + P.r1 * y(4) + P.r3 * y(5) - P.mu * y(6);
    dydt(7) = P.delta * P.f1 * y(4) + P.delta*P.f2*y(3);
    dydt(8) = P.mu * (y(1) + y(2) + y(3) + y(4) + y(5) + y(6));
end

% Sistema del submodelo con cuarentenas solo en asintomaticos:
function dydt = ddefun_pre2(t, y, Z)
    global P

    ylag1 = Z(:, 1);
    ylag2 = Z(:, 2);

    dydt = zeros(8, 1);
    dydt(1) = P.b - P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.mu * y(1);
    dydt(2) = P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.alpha * y(2) - P.mu * y(2);
    dydt(3) = (1 - P.p) * P.alpha * y(2) + P.f2 * y(3) - P.r2 * y(3) - P.mu * y(3) - P.delta*P.f2*y(3) ;
    dydt(4) = P.p * P.alpha * y(2) - P.r1 * y(4) - P.mu * y(4) - P.delta * P.f1 * y(4);
    dydt(5) = P.f2 * ylag2(3) - P.r3 * y(5) - P.mu * y(5);
    dydt(6) = P.r2 * y(3) + P.r1 * y(4) + P.r3 * y(5) - P.mu * y(6);
    dydt(7) = P.delta * P.f1 * y(4) + P.delta*P.f2*y(3);
    dydt(8) = P.mu * (y(1) + y(2) + y(3) + y(4) + y(5) + y(6));
end


% Función history para marcar las condiciones iniciales
function s = history(t)
    global init_conditions
    s = init_conditions(:);
end









