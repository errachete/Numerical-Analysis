%% Test para la funci�n ode45
%
% Carga los datos del problema seleccionado, aplica la funci�n de Matlab
% 'ode45' y muestra las gr�ficas de los resultados

datos
[t,x] = ode45(f,[intervalo(1):(intervalo(2)-intervalo(1))/N:intervalo(2)],x0);
graficas