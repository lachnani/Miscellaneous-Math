function [elPlot] = drawellipse(a,b)
%DRAWELLIPSE Animated ellipse
%   Draws an animated ellipse of specified dimensions with a line to
%   origin. Takes values of a then b to determine size.

%{
Hakim Lachnani
ITP 168 - Spring 2016
lachnani@usc.edu
Revision History
Date		Changes		Programmer
------------------------------------------
03/23/2016  Original    Hakim Lachnani
%}

if (isscalar(a) == 0) || (a <= 0)
        error('Invalid a value');
    end;
if (isscalar(b) == 0) || (b <= 0)
        error('Invalid b value');
    end;
theta = linspace(0,360,1000);
x = a * cosd(theta);
y = b * sind(theta);

i = 1;

hold on 
ellipse = plot(x(i),y(i),'b');
point = plot(x(i),y(i),'b*');
line = plot(x(i),y(i),'b');
axis([-2 2 -2 2]);

for i = 1:1000
    set(ellipse,'XData',x(1:i));
    set(ellipse,'YData',y(1:i));
    set(point,'XData',x(i));
    set(point,'YData',y(i));
    set(line,'XData',[0 x(i)]);
    set(line,'YData',[0 y(i)]);
    drawnow;
end;
hold off

end

