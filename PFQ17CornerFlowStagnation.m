ix=5;
interval=500;
contours=500;
[x,y]=meshgrid(-ix:ix/interval:ix);
m=2;
a=1;
z=x+1i*y;

zo1=2*a+1i*a;
zo2=-2*a+1i*a;
zo3=-2*a-1i*a;
zo4=2*a-1i*a;

Fz=-m*(log(z-zo1)+log(z-zo2)+log(z-zo3)+log(z-zo4))/2*pi;

contour(x,y,imag(Fz),contours,'c');
grid on;
grid minor;
axis([-ix ix -ix ix])
pbaspect([1 1 1]);