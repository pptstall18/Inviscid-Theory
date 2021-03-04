
[psi,phi]=meshgrid(-pi:2.*pi/20:pi,-3:27/50:24);
F=phi+1i*psi;
z=F-exp(-F);

x=real(z);
y=imag(z);

hold all
plot(x,y)
axis([-20 20 -20 20])
daspect([1 1 1])