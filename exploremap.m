function exploremap()
%EXPLOREMAP is an interactive 3D map of the main Hawaiian islands
% The EXPLOREMAP function takes in no inputs and returns no outputs
% It loads longitude, lattitude, and elevation data, creates a boundary
% box, and plots a surface which represents a section of overall terrain
% map. The terrain map is drawn in a subplot below the surface plot and
% shows the overall terrain along with the boundary lines that translate to
% the boundaries of the surface plot. Have fun...

%Header stuff goes here
%{
Hakim Lachnani
ITP 168 - Spring 2016
lachnani@usc.edu
Revision History
Date		Changes		Programmer
------------------------------------------
04/07/2016  HW9         Hakim Lachnani
%}

%load data
load('HW9.mat');

%we now have access to the variables X,Y ELEV

%calculate the differences between each element in X and Y
xDiff = diff(X);
yDiff = diff(Y);

%create a vector of zeros
xMeters = zeros([1 335]);
yMeters = zeros([230 1]);

%calculate the values of the X and Y vectors in METERS
for xi = 2:335
    xMeters(xi) = xMeters(xi-1) + 6371000.*tand(X(xi)-X(xi-1));
end;
for yi = 2:230
    yMeters(yi) = yMeters(yi-1) + 6371000.*tand(Y(yi)-Y(yi-1));
end;

%find dimensions of the ELEV variable to determine the number of rows and
%columns
[ySize,xSize] = size(ELEV);
yScale = (ySize-50)/20;
xScale = (xSize-50)/31;
%build grid


%determine boundary box size
bSize = 50;

%give starting and ending X and Y points
xStart = 1;
xEnd = 50;
yStart = 1;
yEnd = 50;

%determine how many points to shift when we move
shiftX = xMeters(10);
shiftY = yMeters(10);


%create the vectors for the boundary box (two elements in each)
%Top Line
xTop = [xMeters(xStart) xMeters(xEnd)];
yTop = [yMeters(yEnd) yMeters(yEnd)];
%Bottom Line
xBottom = [xMeters(xStart) xMeters(xEnd)];
yBottom = [yMeters(yStart) yMeters(yStart)];
%Left Line
xLeft = [xMeters(xStart) xMeters(xStart)];
yLeft = [yMeters(yStart) yMeters(yEnd)];
%Right Line
xRight = [xMeters(xEnd) xMeters(xEnd)];
yRight = [yMeters(yStart) yMeters(yEnd)];

%plot first grid (use the value of the boundary box size)
%call subplot and plot the surface
subplot(2,1,1), surfP = surf(xMeters(1:50),yMeters(1:50),ELEV(1:50,1:50));

%set the axis to equal
subplot(2,1,1), axis equal

%call subplot and plot the contour and the boundary box
subplot(2,1,2), cont = contour3(xMeters,yMeters,ELEV);
hold on
top = plot(xTop,yTop);
bottom = plot(xBottom,yBottom);
left = plot(xLeft,yLeft);
right = plot(xRight,yRight);
subplot(2,1,2), axis equal
hold off
%set shifts
yShift = 0;
xShift = 0;

%don't touch this stuff
set(gcf,'KeyPressFcn',@callback);
set(gcf,'CurrentCharacter','n');
while (true)
    choose = get(gcf,'CurrentCharacter');
    switch choose
        case 's'
            %the user wants to move south
            %write code here
            if yShift<20
            yShift = yShift + 1;
            end;
            %stop writing code here
        case 'w'
            %the user wants to move north
            %write code here
            if yShift>0
                yShift = yShift - 1;
            end;
            %stop writing code here
        case 'a'
            %the user wants to move west
            %write code here
            if xShift <31
                xShift = xShift + 1;
            end;
            %stop writing code here
        case 'd'
            %the user wants to move east
            %write code here
            if xShift > 0
                xShift = xShift - 1;
            end;
            %stop writing code here
        case 'q'
            %user quits
            break;
    end;
    set(gcf,'CurrentCharacter','n');
    %continue writing code here
    
    %calculate NEW boundary box X and Y values (for all 4 lines)
    set(top,'XData',xTop(1:2)+xShift*shiftX), set(top,'YData',yTop(1:2)+yShift*shiftY);
    set(bottom,'XData',xBottom(1:2)+xShift*shiftX), set(bottom,'YData',yBottom(1:2)+yShift*shiftY);
    set(left,'XData',xLeft(1:2)+xShift*shiftX), set(left,'YData',yLeft(1:2)+yShift*shiftY);
    set(right,'XData',xRight(1:2)+xShift*shiftX), set(right,'YData',yRight(1:2)+yShift*shiftY);
    xLow = round(50 + yShift*9);
    xHigh = round(1 + yShift*9);
    yLow = round(50 + xShift*5.8);
    yHigh = round(1 + xShift*5.8);
    set(surfP,'XData',xMeters(xHigh:xLow)); 
    set(surfP,'YData',yMeters(yHigh:yLow)); 
    set(surfP,'ZData',ELEV(xHigh:xLow,yHigh:yLow));
    
    %use set function to set XData and YData for the boundary lines and the
    %surface plot
    
    
    %call drawnow function
    drawnow;
    subplot(2,1,1), axis equal
    subplot(2,1,2), axis equal
end;
end

%don't touch any of this.
function callback(~, callbackdata)

end