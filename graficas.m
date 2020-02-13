%% 
% Dibuja las gráficas correspondientes a cada una de las componentes de la
% variable 'x', que representa las soluciones de un problema de valor
% inicial calculado anteriormente, y representa las trayectorias  de 'x' si
% la dimensión es superior a 1.

dim = size(x,2)
if dim == 1
    figure(1)
    plot(t,x,'r')
elseif dim == 2
    figure(1)
    subplot(2,1,1)
    plot(t,x(:,1),'r')
    subplot(2,1,2)
    plot(t,x(:,2),'g')
    pause(2)
    figure(2)
    comet(x(:,1),x(:,2))
else
    figure(1)
    subplot(3,1,1)
    plot(t,x(:,1),'r')
    subplot(3,1,2)
    plot(t,x(:,2),'g')
    subplot(3,1,3)
    plot(t,x(:,3),'b')
    pause(2)
    figure(2)
    comet3(x(:,1),x(:,2),x(:,3))
end