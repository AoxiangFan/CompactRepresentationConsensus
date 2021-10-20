function [Z, m] = SurfaceGeneration(w, mu, SIGMA, K, flag)

a = 0; b = 1; N = 15;
[X, Y] = meshgrid(linspace(a, b, N));
T = [X(:) Y(:)];
Z = zeros(N);
for ii = 1:K
    p = w(ii) * mvnpdf(T, mu(ii, :), SIGMA);
    Z = Z + reshape(p, [N, N]);
end
if flag
   figure, surf(X, Y, Z)
   shading interp
   title('ground truth');
end
m = max(max(abs(Z)));