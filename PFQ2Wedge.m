% Phi= Ar^6/5cos(6theta/5)

[theta,r]=meshgrid(0:(5/600)*pi:(5/3)*pi,0:0.01:2);
[x,y]=pol2cart(theta,r);
psi=r.^(6/5)*sin(6/5*theta);
phi=r.^(6/5)*cos(6/5*theta);

utheta=-(6/5)*r.^(1/5)*sin(6/5*theta);
ur=(6/5)*r.^(1/5)*cos(6/5*theta);
u=ur.*cos(theta)-utheta.*sin(theta);
v=ur.*sin(theta)+utheta.*cos(theta);


contour(x,y,psi,41,'c');
hold on
contour(x,y,phi,41,'r');
k=20;
quiver(x(1:k:end,1:k:end),y(1:k:end,1:k:end),u(1:k:end,1:k:end),v(1:k:end,1:k:end));
p=-r.^(2/5);
contour(x,y,p,20,'g');
axis([-1 1 -1 1]);
pbaspect([1 1 1]);






