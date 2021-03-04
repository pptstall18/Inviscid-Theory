ix=5;
interval=100;
contours=-100:1.700508/2:100;
gamma=10;
d=4;
a=2;
[x,y]=meshgrid(-ix:ix/interval:ix);
[r,theta]=cart2pol(x,y);
z=x+1i*y;
zo1=d;

hold all;
Fz=(-1i*gamma/2*pi).*(log(z-zo1)-log(z-(a^2/d))+log(z));
contour(x,y,imag(Fz),contours,'c');
fill((a*cos(theta)),(a*sin(theta)),'k');
grid on;
grid minor;
axis([-ix ix -ix ix])
pbaspect([1 1 1]);