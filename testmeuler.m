%% Test para el m�todo de Euler
%
% Carga los datos del problema seleccionado, aplica el m�todo de Euler
% (expl�cito) por medio de la funci�n 'meuler' y muestra las gr�ficas de
% los resultados

datos
[t,x] = meuler(f, intervalo, x0, 10000);
graficas