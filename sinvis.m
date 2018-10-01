function sinvis(p)
%SINVIS visualizes the sine function as a fuction of the unit circle.
% Traces a unit circle and the sine function concurrently, with each value
% of sine corresponding to the equivalent value on the unitcircle.

%{
Hakim Lachnani
ITP 168 - Spring 2016
lachnani@usc.edu
Revision History
Date		Changes		Programmer
------------------------------------------
04/01/2016  Original    Hakim Lachnani
%}

%check input
if ~isnumeric(p)
    error('Input must be numeric');
end;
if ~isscalar(p)
    error('Input must be a scalar');
end;
if ~(rem(p,1)==0)
    error('Input must be an integer');
end;
if p <= 0
    error('Input must be positive');
end;

%create vectors
sinX = linspace(0,2*pi*p,p*1000);
theta = linspace(0,2 * pi,1000);
xLine = cos(sinX);
x = cos(theta);
y = sin(theta);
sinY = sin(sinX);

%establish index
i = 1;

hold on %hold the figure

%create the plots
circle = plot(x(i),y(i),'b');
sine = plot(sinX(i),sinY(i),'m');
point = plot(sinX(i),sinY(i),'k*');
line = plot(x(i),y(i),'k');
hoLine = plot([0 sinX(i)],[0 sinY(i)],'r--');
axis([-2 2 -2 2]);
xlabel('X(radians)');
ylabel('Sin(X)');
title('Sine Visualization');

%for loop to redraw the plots
for i = 1:1000
    set(circle,'XData',x+sinX(i));
    set(circle,'YData',y);
    set(sine,'XData',sinX(1:i));
    set(sine,'YData',sinY(1:i));
    set(point,'XData',sinX(i));
    set(point,'YData',sinY(i));
    set(line,'XData',[sinX(i) xLine(i)+sinX(i)]);
    set(line,'YData',[0 sinY(i)]);
    set(hoLine,'XData',[sinX(i) sinX(i)+xLine(i)]);
    set(hoLine,'YData',[sinY(i) sinY(i)]);
    drawnow;
    axis([-2+sinX(i) 2+sinX(i) -2 2]);
end;
hold off