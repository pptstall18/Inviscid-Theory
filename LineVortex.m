[x,y]=meshgrid(-5:0.01:5,-5:0.01:5);


positionx=2;
positiony=2;
zo=positionx+1i.*positiony;
z=x+1i*y;
gamma=2;

%complex potential
Fz=-1.*(gamma/(2*pi)).*log(z-zo);
hold all;
contour(x,y,imag(Fz),41,'c');
contour(x,y,real(Fz),41,'r');

axis([-5 5 -5 5]);
pbaspect([1 1 1]);
