% Flow properties
a = 0.6;
U = 3;
alpha = pi / 9;

% Field properties
[theta,r] = meshgrid(0:0.01*pi:2*pi,a:(6-a)/200:6);
[x,y] = pol2cart(theta,r);

z = x + 1i * y;

% Uniform flow
Funiform = U .* z .* exp(-1i * alpha);

% Doublet flow (where mu is expressed as a function of U and a)
Fdoublet = U * a.^2 * exp(1i * alpha) ./ z;

% Kutta conditionn
gamma = -4 * pi * a * U * sin(alpha);
Fvortex = -1i * gamma / (2 * pi) .* log(z);

F = Funiform + Fdoublet + Fvortex;

psi = imag(F);
phi = real(F);

zeta = z + a.^2 ./ z;
xi = real(zeta);
yi = imag(zeta);

hold on;
xl = -2 * a : 0.1 : 2 * a;
yl = zeros(length(xl));
plot(xl,yl,'r');

contour(xi,yi,psi,101,'c');
%contour(xi,yi,phi,101,'r');%
axis([-5 5 -5 5])
daspect([1 1 1])