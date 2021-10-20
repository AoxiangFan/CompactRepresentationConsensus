clear,clc
close all
warning off

% randomly generate a smooth surface

K = 8;
w = rand(K,1) - 0.5;
mu = rand(K,2);
SIGMA = 0.04*eye(2);

[Z, m] = SurfaceGeneration(w, mu, SIGMA, K, 1);
In = 100;
Out = 100;
[X, Y] = SampleGeneration(In, Out, w, mu, SIGMA, K, m);

% run algorithms for regression

[z1, t1] = CRC_regression(X, Y, 1);
e1 = sum(sum(abs(Z - z1)))/numel(Z);
disp(['Fourier Representation, mean error: ',num2str(e1), ', time cost ', num2str(t1), ' seconds']);

[z2, t2] = VFC_regression(X, Y, 1);
e2 = sum(sum(abs(Z - z2)))/numel(Z);
disp(['Regularization Theory mean error: ',num2str(e2), ', time cost ', num2str(t2), ' seconds']);

[z3, t3] = FastVFC_regression(X, Y, 1);
e3 = sum(sum(abs(Z - z3)))/numel(Z);
disp(['Low-rank Approximation mean error: ',num2str(e3), ', time cost ', num2str(t3), ' seconds']);

[z4, t4] = SparseVFC_regression(X, Y, 1);
e4 = sum(sum(abs(Z - z4)))/numel(Z);
disp(['Sparse Random Basis mean error: ',num2str(e4), ', time cost ', num2str(t4), ' seconds']);








