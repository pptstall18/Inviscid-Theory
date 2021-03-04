%set range of x and y;
ix= 5; iy= 5;
[x,y]=meshgrid(-ix:0.01:ix,-iy:0.05:iy);
theta = linspace(0,2*pi,100);

%position of doublet centre;
positionx=1;positiony=1;

%uniform flow velocity
U=3;

%uniform flow angle of attack
alpha=0;

%radius of doublet
r=0.01;
z=x+1i*y;
zo=positionx+1i*positiony;

%Complex Potential

Fz=(U*r^2*exp(1i*alpha))./(z-zo);

hold all;
contour(x,y,imag(Fz),(51*ix),'c');
contour(x,y,real(Fz),(51*ix),'r');
fill((positionx+r*cos(theta)),(positiony+r*sin(theta)),'k');

grid on;
grid minor;
grid on;
grid minor;
axis([-ix ix -iy iy]);
pbaspect([1 1 1]);

