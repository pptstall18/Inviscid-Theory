ix=10;
interval=200;
contours=-200:1.700508/2:200;
gamma1=10;
gamma2=-23;
d=4;
d2=-5;
a=2;
U=5;
alpha=pi/3;
[x,y]=meshgrid(-ix:ix/interval:ix);
[r,theta]=cart2pol(x,y);
z=x+1i*y;
zo1=d;
zo2=d2;
zeta=z+(a^2)./z;

Fz=(-1i*gamma1/2*pi).*(log(z-zo1)-log(z-(a^2/d))+log(z))+(U*(a^2)*exp(1i*alpha))./(z)+(U*(z)*exp(-1i*alpha));
Fz2=(-1i*gamma2/2*pi).*(log(z-zo2)-log(z-(a^2/d2))+log(z));
Fzt=Fz+Fz2;
contour(x,y,imag(Fzt),contours,'c');
hold on;
fill((a*cos(theta)),(a*sin(theta)),'k','LineWidth',1);
hold off;
grid on;
grid minor;
axis(3*[-a a -a a])
pbaspect([1 1 1]);
