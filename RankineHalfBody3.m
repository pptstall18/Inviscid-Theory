U = 1;
s = 0.2;

[x,y] = meshgrid(-1:0.01:1,-1:0.01:1);
[theta,r] = cart2pol(x,y);

psi =  U * (y + s * theta);

figure
hold all;
% contour(x, y, psi, 41)

u = U * (1 + s * cos(theta)./r);
v = U * s * sin(theta)./r;

%{
starty = -1 : 0.1 : 1;
startx = ones(size(starty));
startx = startx * -1;
%}

[startx,starty] = meshgrid(-1:2:0, -1 : 0.1 : 1);

quiver(x(1:10:end,1:10:end),y(1:10:end,1:10:end),u(1:10:end,1:10:end),v(1:10:end,1:10:end));

streamline(x,y,u,v,startx,starty)

Theta = 0 : 0.009 * pi : 2 * pi;
Y = s * (pi - Theta);
X = Y ./ tan(Theta);
% X(101) = -1 * s;

plot(X, Y, 'red')

axis([-1 1 -1 1])
pbaspect([1 1 1])