%% Test para el método de Euler mejorado
%
% Carga los datos del problema seleccionado, aplica el método de Euler
% mejorado por medio de la función 'meulermej' y muestra las gráficas de
% los resultados

datos
[t,x] = meulermej(f, intervalo, x0, N);
graficas