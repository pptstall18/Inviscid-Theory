ix=5;
interval=50;
[x,y]=meshgrid(-ix:ix/interval:ix);

gamma = 100;
a = 2;
yo = 0;
y2=sqrt(3*a);

z=x+1i*y;
zo1=a+1i*yo;
zo2=-a+1i*yo;
Fz=-(1i*gamma*log(z-zo1))/2*pi;
Fz2=-(1i*gamma*log(z-zo2))/2*pi;

Fz3=Fz+Fz2;

hold all;
contour(x,y,imag(Fz3),interval,'b');
yline(sqrt(3*a),'r');
yline(-sqrt(3*a),'r');
