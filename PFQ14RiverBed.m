ix=50;
intervals=500;
contours=100;
a=1;
k=1;
U=1;
[x,y]=meshgrid(0:ix/intervals:ix);
z=x+1i*y;

Fz=U*(z-a.*exp(1i.*k.*z));

hold all;
contour(x,y,imag(Fz),contours,'c');