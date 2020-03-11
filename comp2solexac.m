%% Comparador de un m�todo con la soluci�n exacta

function comp2solexac(met, prob)
% La funci�n comp2solexac resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,Y]
%  x(t0)=x0
% con x0 en R^n, mediante el m�todo que se le pasa por par�metro,
% y respresenta:
%  La soluci�n obtenida por el m�todo y la soluci�n exacta
%  La diferencia entre la soluci�n obtenida y la soluci�n exacta
%  La trayectoria de la soluci�n obtenida por el m�todo y la exacta (s�lo 
%  si la dimensi�n es 2 o 3)
%  El m�ximmo de la diferencia entre la soluci�n obtenida y la exacta
%
% ENTRADA:
%  met: m�todo con el que se pretende resolver el problema
%  prob: n�mero del problema que se quiere resolver (consultar "datos.m")
%
% SALIDA:
%  No hay par�metros de salida

datos
[t1,x1] = met(f, intervalo, x0, N);
x2 = sol_ex(t1);

dim = size(x1,2);
colors = ['r' 'g' 'b'];
figure(1)
for i = 1:dim
    subplot(dim,1,i)
    plot(t1,x1(:,i),colors(1))
    hold on
    plot(t1,x2(:,i),colors(2))
    s = sprintf('Coordenada %i de la soluci�n', i);
    title(s)
end
hold off

pause(2)
dif = x1-x2;
figure(2)
for i = 1:dim
    subplot(dim,1,i)
    plot(t1,dif(:,i),colors(i))
    s = sprintf('Diferencia en la coordenada %i de la soluci�n', i);
    title(s)
end

if dim == 2
    pause(2)
    figure(3)
    plot(x1(:,1),x1(:,2))
    hold on
    plot(x2(:,1),x2(:,2))
    title('Trayectoria de la soluci�n')
elseif dim == 3
    pause(2)
    figure(3)
    plot3(x1(:,1),x1(:,2),x1(:,3))
    hold on
    plot3(x2(:,1),x2(:,2),x2(:,3))
    title('Trayectoria de la soluci�n')
end
hold off

pause(2)
figure(4)
ninf = max(max(x1-x2));
for i = 1:dim
    plot([0 1],[ninf ninf],colors(i))
    s = sprintf('El m�ximo es: %i', ninf);
    legend(s)
    title('M�ximo de la diferencia entre soluciones')
end 

end



