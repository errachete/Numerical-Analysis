%% Test para la función ode45
%
% Carga los datos del problema seleccionado, aplica la función de Matlab
% 'ode45' y muestra las gráficas de los resultados

datos
[t,x] = ode45(f,[intervalo(1):0.01:intervalo(2)],x0);
graficas