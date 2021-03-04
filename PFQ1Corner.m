%Find Streamline of the Flow Phi=Axy

[x,y] = meshgrid(-1:0.01:1,-1:0.01:1);

u = x;
v = -y;
psi=0.5*(x.^2-y.^2);
l=6-3*(x.^2+y.^2);
figure
quiver(x,y,u,v)



startx = -1:0.01:1;
starty = ones(size(startx));
streamline(x,y,u,v,startx,starty)
hold on
[sx,sy]=size(startx);
for i=1:sy
starty(i)=-1;
end
streamline(x,y,u,v,startx,starty)
starty = zeros(size(startx));
streamline(x,y,u,v,startx,starty)

contour(x,y,psi,41,'r')
hold on
contour(x,y,l,101,'g')
daspect([1 1 1]);
