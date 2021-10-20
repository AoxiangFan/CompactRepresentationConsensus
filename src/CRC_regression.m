function [Z,t] = CRC_regression(X,Y, flag)

conf = CRC_init([]);
conf.a = 10;
tic
[~, ~, C] = CRC(X, Y, conf);
t = toc;

P = [0,1,0,1,2,0,2,1,2,3,0,3,1,3,2,4,0,4,1,3,4,2,4,3,5,0,5,1,5,2,4,5,3,6,0,6,1,6,2,5,4,6,3,5];
Q = [0,0,1,1,0,2,1,2,2,0,3,1,3,2,3,0,4,1,4,3,2,4,3,4,0,5,1,5,2,5,4,3,5,0,6,1,6,2,6,4,5,3,6,5];
K = 15;
a = 0; b = 1; N = 15;
[X, Y] = meshgrid(linspace(a, b, N));
T = [X(:) Y(:)];
z = zeros(N^2,1);
for ii = 1:N^2
    tmp = 0;
    for k = 1:K
        tmp = tmp +C(k)*cos(pi*P(k)*T(ii,1))*cos(pi*Q(k)*T(ii,2));
    end
    z(ii) = tmp;
end
Z = reshape(z, N, N);
if flag
   figure, surf(X,Y,Z);
   shading interp
   title('fourier representation');
end