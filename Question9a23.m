[x,y]=meshgrid(-1:0.01:1,-1:0.01:1);
[theta,r]=cart2pol(x,y);
alpha=2/3;
u=r.^alpha;
q=r.^(alpha-1);
psi=u.*sin(alpha.*theta);
phi=u.*cos(alpha.*theta);
hold all;
q=r.^(alpha-1);
utheta=-alpha.*q.*sin(alpha.*theta);
ur=alpha.*q.*cos(alpha.*theta);

u=ur.*cos(theta)-utheta.*sin(theta);
v=ur.*sin(theta)+utheta.*cos(theta);

k=10;
quiver(x(1:k:end,1:k:end),y(1:k:end,1:k:end),u(1:k:end,1:k:end),v(1:k:end,1:k:end));
contour(x,y,psi,21,'b');
contour(x,y,phi,21,'r');
daspect([1 1 1]);