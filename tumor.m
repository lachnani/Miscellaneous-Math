function tumor(m,n)
%TUMORS Generates a tumor
%   Creates a 3D surface made to simulate a tumor.

%{
Hakim Lachnani
ITP 168 - Spring 2016
lachnani@usc.edu
Revision History
Date		Changes		Programmer
------------------------------------------
03/28/2016  Original    Hakim Lachnani
%}

if ~isnumeric(m) || ~isnumeric(n)
    error('Inputs must be numeric');
end;
if ~isscalar(m) || ~isscalar(n)
    error('Inputs must be a scalar');
end;
if m <= 0 || n <= 0
    error('Inputs must be positive');
end;

theta = linspace(0,2*pi);
phi = linspace(0,pi);

[thetaGrid, phiGrid] = meshgrid(theta,phi);

rho = 1 + (1/5)*sin(m*thetaGrid).*sin(n*phiGrid);

xGrid = rho.*sin(phiGrid).*cos(thetaGrid);
yGrid = rho.*sin(phiGrid).*sin(thetaGrid);
zGrid = rho.*cos(phiGrid);

surf(xGrid,yGrid,zGrid);


end

