%x,y,theta variables are defined below
ix= 5; 
intervals=100;
[x,y]=meshgrid(-ix:1/intervals:ix);

theta = linspace(0,2*pi,intervals);

%adjustable parameters U=uniform flow velocity, r=radius of cylinder,
%alpha=angle of attack, positionx= x coordinate position of centre,
%positiony= y coordinate position of centre, gamma= strength of vorticity
U=10; alpha=pi/6;
r=1;

%Getting rid of the terms inside the cylinder
for i = 1 : length(x)
    for j = 1 : length(x)
        if (x(i,j)^2 + y(i,j)^2 <= r)
            x(i,j) = NaN;
            y(i,j) = NaN;
        end
    end
end

positionx=0; positiony=0;
gamma=-4*pi*r*U*sin(alpha);

%zo=initial starting position, z=complex variable Fz=complex potential

zo=positionx+1i.*positiony;
z=x+1i*y;
zeta= (z) + ((r)^2./(z));
zs1=r*cos(pi+2*alpha)+1i*r*sin(pi+2*alpha);
zs2=r;
zetas1=(zs1) + ((r)^2./(zs1));
zetas2=(zs2) + ((r)^2./(zs2));
%complex potential of uniform flow at angle of attack%

Fzu=(U*(z-zo)*exp(-1i*alpha));

%complex potential of cylinder%
Fzc=(U*(r^2)*exp(1i*alpha))./(z-zo)+(-1i*gamma*log(z-zo))./(2*pi);

%complex potential of a cylinder with uniform flow at angle of attack%
Fz=Fzu+Fzc;

intervals=-100:1:100;
figure (1)
hold on
contour(x,y,imag(Fz),(intervals),'c');
fill((positionx+r*cos(theta)),(positiony+r*sin(theta)),'k');
plot(real(zs1),imag(zs1),'-o','Markerfacecolor','r','Markersize',4);
plot(real(zs2),imag(zs2),'-o','Markerfacecolor','r','Markersize',4);
axis(3.5*[-r r -r r]);
pbaspect([1 1 1]);

figure (2)
hold all;
contour(real(zeta),imag(zeta),imag(Fz),(intervals),'c');
%Stagnation Points%
xl = -2 * r : 0.1 : 2 * r;
yl = zeros(length(xl));
plot(xl,yl,'r','Linewidth',1);
plot(real(zetas1),imag(zetas1),'-o','Markerfacecolor','r','Markersize',3);
plot(real(zetas2),imag(zetas2),'-o','Markerfacecolor','r','Markersize',3);
%axis display options%
grid on;
grid minor;
axis(3.5*[-r r -r r]);
pbaspect([1 1 1]);
