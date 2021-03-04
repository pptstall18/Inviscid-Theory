[x,y]=meshgrid(-1.5:0.01:1.5,-1.5:0.01:1.5);
[theta,r]=cart2pol(x,y);
%for line vortex, 
gamma=3;
utv=gamma./(2*pi.*r);

%for the sink
m=-1.5;
urs=m./(2*pi.*r);

u=urs.*cos(theta)-utv.*sin(theta);
v=1 * urs.*sin(theta)+utv.*cos(theta);

quiver(x,y,u,v)

[startt,startr] = meshgrid(0:0.1*pi:2*pi,sqrt(2):100:3);
[startx,starty] = pol2cart(startt,startr);

streamline(x,y,u,v,startx,starty)

axis([-1 1 -1 1])
daspect([1 1 1])