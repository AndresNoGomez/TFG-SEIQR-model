% La función simulador_sd ejecuta la simulación del modelo en su versión
% sin desfases. La función de matlab para ecuaciones diferenciales
% ordinarias, ode45, es más apropiada para este caso.


function [t, y] = simulador_sd()

    global init_conditions

    tspan = [0 100];
    y0 = init_conditions;
    options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);

    [t, y] = ode45(@odefun, tspan, y0, options);
end

% Sistema del modelo sin desfases
function dydt = odefun(t, y)
    
    global P

    dydt = zeros(8, 1);
    dydt(1) = P.b - P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.mu * y(1);
    dydt(2) = P.beta * (1 - P.epsilon * P.phi) * y(1) * (P.sigma * y(3) + y(4)) - P.alpha * y(2) - P.mu * y(2);
    dydt(3) = (1 - P.p) * P.alpha * y(2) - P.f2 * y(3) - P.r2 * y(3) - P.mu * y(3);
    dydt(4) = P.p * P.alpha * y(2) - P.f1 * y(4) - P.r1 * y(4) - P.mu * y(4);
    dydt(5) = P.f2 * y(3) + P.f1 * y(4) - P.r3 * y(5) - P.delta * y(5) - P.mu * y(5);
    dydt(6) = P.r2 * y(3) + P.r1 * y(4) + P.r3 * y(5) - P.mu * y(6);
    dydt(7) = P.delta * y(5);
    dydt(8) = P.mu * (y(1) + y(2) + y(3) + y(4) + y(5) + y(6));
end

