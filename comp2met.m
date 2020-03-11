%% Comparador de dos métodos

function comp2met(met1, met2, prob)
% La función comp2met resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante los dos métodos que se le pasan por parámetros,
% y respresenta:
%  La solución obtenida por ambos métodos
%  La diferencia entre las soluciones obtenidas por ámbos métodos
%  La trayectoria obtenida por ambos métodos (sólo si la dimensión es 2
%  o 3)
%  El máximo de la diferencia entre las soluciones obtenidas por ambos
%  métodos  
%
% ENTRADA:
%  met1: primer método con el que se pretende resolver el problema
%  met2: segundo método con el que se pretende resolver el problema
%  prob: número del problema que se quiere resolver (consultar "datos.m")
%
% SALIDA:
%  No hay parámetros de salida

datos
[t1,x1] = met1(f, intervalo, x0, N);
[t2,x2] = met2(f, intervalo, x0, N);

dim = size(x1,2);
colors = ['r' 'g' 'b'];
figure(1)
for i = 1:dim
    subplot(dim,1,i)
    plot(t1,x1(:,i),colors(1))
    hold on
    plot(t2,x2(:,i),colors(2))
    s = sprintf('Coordenada %i de la solución', i);
    title(s)
end
hold off

pause(2)
dif = x1-x2;
figure(2)
for i = 1:dim
    subplot(dim,1,i)
    plot(t1,dif(:,i),colors(i))
    s = sprintf('Diferencia en la coordenada %i de la solución', i);
    title(s)
end

if dim == 2
    pause(2)
    figure(3)
    plot(x1(:,1),x1(:,2))
    hold on
    plot(x2(:,1),x2(:,2))
    title('Trayectoria de la solución')
elseif dim == 3
    pause(2)
    figure(3)
    plot3(x1(:,1),x1(:,2),x1(:,3))
    hold on
    plot3(x2(:,1),x2(:,2),x2(:,3))
    title('Trayectoria de la solución')
end
hold off

pause(2)
figure(4)
ninf = max(max(x1-x2));
for i = 1:dim
    plot([0 1],[ninf ninf],colors(i))
    s = sprintf('El máximo es: %i', ninf);
    legend(s)
    title('Máximo de la diferencia entre soluciones')
end 
hold off
end

