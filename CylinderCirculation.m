%x,y,theta variables are defined below
ix= 2; 
iy= 2;
intervals=100;
[x,y]=meshgrid(-ix:ix/intervals:ix);
theta = linspace(0,2*pi,intervals);


%adjustable parameters U=uniform flow velocity, r=radius of cylinder,
%alpha=angle of attack, positionx= x coordinate position of centre,
%positiony= y coordinate position of centre, gamma= strength of vorticity
U=10; alpha=pi/6;
r=1;
positionx=0; positiony=0;
gamma=-4*pi*r*U*sin(alpha);

%zo=initial starting position, z=complex variable Fz=complex potential

zo=positionx+1i.*positiony;
z=x+1i*y;
%complex potential of uniform flow at angle of attack

Fzu=(U*(z)*exp(-1i*alpha));

%complex potential of cylinder 
Fzc=(U*(r^2)*exp(1i*alpha))./(z-zo)+(-1i*gamma*log(z-zo))./(2*pi);

%complex potential of a cylinder with uniform flow at angle of attack
Fz=Fzu+Fzc;

%plotting the psi function followed by a solid circle
hold all;
contour(x,y,imag(Fz),(-40:0.02:40),'c');
%contour(x,y,real(Fz),(21*ix),'r');%
plot((positionx+r*cos(theta)),(positiony+r*sin(theta)),'k','LineWidth',1);
plot((r),(0),'-o','Markerfacecolor','r');

%The Leading Stagnation Point is at a point on the cylinder with angle
%-2*alpha to the origin
plot((r*cos(pi+2*alpha)),(r*sin(pi+2*alpha)),'-o','Markerfacecolor','r');
grid on;
grid minor;
axis([-ix ix -iy iy]);
pbaspect([1 1 1]);


