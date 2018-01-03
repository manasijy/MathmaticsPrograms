% Here we define the basis vectors and do some algebra 

a = 1;b = 1; c = 1;
alpha = 90; beta = 90; gamma = 90;
basis_a = [a,0,0]';
basis_b = [0,b,0]';
basis_c = [0,0,c]';
g = metricTensor(a,b,c,alpha, beta, gamma);
Vol = sqrt(det(g));
g_rcp = inv(g);

rcp_a = g*basis_a;
rcp_b = g*basis_b;
rcp_c = g*basis_c;