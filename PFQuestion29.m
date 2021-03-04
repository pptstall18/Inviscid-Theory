[x,y]=meshgrid(-5:0.005:5);
[r,theta]=cart2pol(x,y);
x2=r/R;
R=1;
gamma=5;

utheta=gamma*(1-exp(-(r.^2/R^2)))/2*pi.*r;
y2=utheta.*R./gamma;
plot(x2,y2);
