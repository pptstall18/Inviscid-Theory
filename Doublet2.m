[x,y]=meshgrid(-1:0.01:1,-1:0.01:1);
[theta,r]=cart2pol(x,y);

mu=0.3;
psi=mu*sin(theta)./(2*pi*r);
phi=-1*mu.*cos(theta)./(2*pi*r);

contour(x,y,phi,-1:0.1:1,'c');
pbaspect([1 1 1])
axis([-1 1 -1 1])