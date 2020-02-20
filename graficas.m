%% Gráficas
% Dibuja las gráficas correspondientes a cada una de las componentes de la
% variable 'x', que representa las soluciones de un problema de valor
% inicial calculado anteriormente, y representa las trayectorias  de 'x' si
% la dimensión es superior a 1.

dim = size(x,2);
colors = ['r' 'g' 'b'];
figure(1)
for i = 1:dim
    subplot(dim,1,i)
    plot(t,x(:,i),colors(i))
    s = sprintf('Coordenada %i de la solución', i);
    title(s)
end
if dim == 2
    pause(2)
    figure(2)
    plot(x(:,1),x(:,2))
    title('Trayectoria de la solución')
elseif dim == 3
    pause(2)
    figure(2)
    plot3(x(:,1),x(:,2),x(:,3))
    title('Trayectoria de la solución')
end