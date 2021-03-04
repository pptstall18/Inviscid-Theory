ix=10;
interval=100;
contours=50;
m=-3;
h=5;
U=10;
[x,y]=meshgrid(-ix:ix/interval:ix);
zo=1i*h;

z=x+1i*y;

Fz=U*z-(m*(log(z-zo)+log(z+zo))/2*pi);

hold all;
contour(x,y,imag(Fz),contours,'c');
contour(x,y,real(Fz),contours,'r');
grid on;
grid minor;
axis([-ix ix 0 ix])
pbaspect([1 1 1]);

