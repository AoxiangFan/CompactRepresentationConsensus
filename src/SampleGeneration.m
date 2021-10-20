function [X, Y] = SampleGeneration(In, Out, w, mu, SIGMA, K, m)

Ti = rand(In,2);
Zi = zeros(In,1);
for ii = 1:K
    p = w(ii) * mvnpdf(Ti, mu(ii, :), SIGMA);
    Zi = Zi + p;
end
To = rand(Out,2);
Zo = 6*m*rand(Out,1) - 3*m;
X = [Ti;To];
Y = [Zi;Zo];