%% This program creates metric tensor for a given basis vectors
function g = metricTensor(a,b,c,alpha, beta, gamma)

g(1,1) = a*a;
g(1,2) = a*b*cosd(gamma);
g(1,3) = a*c*cosd(beta);

g(2,1) = b*a*cosd(gamma);
g(2,2) = b*b;
g(2,3) = b*c*cosd(alpha);

g(3,1) = c*a*cosd(beta);
g(3,2) = c*b*cosd(alpha);
g(3,3) = c*c;