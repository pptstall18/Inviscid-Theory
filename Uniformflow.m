ix=5;
intervals=50;
contours=100;
[x,y]=meshgrid(-ix:ix/intervals:ix);

z=x+1i*y;
alpha=3/2;
U=10;
Fz=U*z*exp(-1i*alpha);

contour(x,y,imag(Fz),'c');