ix=40;
[x,y] = meshgrid(-ix:0.01:ix,-ix:0.01:ix);
[theta,r]=cart2pol(x,y);
U=1;
s=0.1;
hold all;
psi=U*(y+s*theta);

ux=U*(1+s*cos(theta)./r);
uy=U*s*sin(theta)./r;
starty= -10:0.2:10;
startx= ones(size(starty));
startx= startx * -1;
streamline(x,y,ux,uy,startx,starty);
interval=15;
quiver(x(1:interval:end,1:interval:end),y(1:interval:end,1:interval:end),ux(1:interval:end,1:interval:end),uy(1:interval:end,1:interval:end),'c');
Theta = 0 : 0.007 * pi : 2*pi;
Y= s*(pi-Theta);
X= Y./ tan(Theta);
plot(X,Y,'r');
axis(0.1*[-ix ix -ix ix]);
pbaspect([1 1 1]);



