function [Z,t] = VFC_regression(X, Y, flag)

conf = VFC_init([]);
conf.a = 10;
conf.lambda = 1e-8;
tic
v1 = VFC(X, Y, conf);
t = toc;

C = v1.C;
X2 = v1.X;
K = size(X2,1);

a = 0; b = 1; N = 15;
beta = 0.1;
[X, Y] = meshgrid(linspace(a, b, N));
T = [X(:) Y(:)];
z = zeros(N^2,1);
for ii = 1:N^2
    tmp = 0;
    for k = 1:K
        tmp = tmp + C(k)*exp(-beta*norm(T(ii,:)-X2(k,:))^2);
    end
    z(ii) = tmp;
end
Z = reshape(z, N, N);
if flag
   figure, surf(X,Y,Z);
   shading interp
   title('regularization theory');
end


