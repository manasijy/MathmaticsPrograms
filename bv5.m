function bv5
xlow = 0; xhigh = 1;
solinit = bvpinit(linspace(xlow, xhigh, 10), [1, -1]);
sol = bvp4c(@bvp5ode, @bvp5bc, solinit);
xinit = linspace(xlow, xhigh);
sxinit = deval(sol, xinit);

plot(xinit,  sxinit(1,:))

%%
function dydx = bvp5ode(x,y)
dydx = [y(2) -y(1)];

function res = bvp5bc(ya, yb)
res = [ya(1)-1 yb(2)];