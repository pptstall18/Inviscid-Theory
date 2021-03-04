ix=5;
interval=500;
contours=30;
h=1;
U=1;
m=4*pi*U*h;

[x,y]=meshgrid(-ix:ix/interval:ix,0:ix/interval:ix);
zo=1i*h;

z=(x+1i*y)/h;

Fz=z-((m*log(h^2*(z.^2)+1))/2*pi*U*h);
hold all;
contour(x,y,imag(Fz),contours,'c');
contour(x,y,real(Fz),contours,'r');
grid on;
grid minor;
axis([-ix ix 0 ix])
pbaspect([1 1 1]);