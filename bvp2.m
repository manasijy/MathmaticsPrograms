function bvp2

solver = 'bvp4c';
bvpsolver = fcnchk(solver);
lambda = 15;
% q = 1;
solinit = bvpinit(linspace(0,pi, 10), @mat4init, lambda);
sol = bvpsolver(@mat4ode, @mat4bc, solinit);

%%
xinit = linspace(0, pi);
sxinit = deval(sol, xinit);

plot(xinit,  sxinit(1,:))
sol.parameters


%%
function dydx = mat4ode(x,y,lambda)
dydx = [y(2)
    -(lambda-2*1*cos(2*x)*y(1))]; % q=1

function res = mat4bc(ya, yb, lambda)
res = [ya(2); yb(2); ya(1)-1];
    
function yinit = mat4init(x)
yinit = [cos(4*x); -4*sin(4*x)];