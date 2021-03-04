[x,y]=meshgrid(-1:0.1:1,-1:0.1:1);
[theta,r]=cart2pol(x,y);
ur= (m./((2*pi)*r));
ux=ur*cos(theta);
uy=ur*sin(theta);
quiver(x,y,ux,uy);
