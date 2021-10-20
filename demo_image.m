clear,clc
close all

warning off   % This is vital to reduce the time cost of SparseVFC

load ./data/wash.mat
% load ./data/castle.mat
% load ./data/leafs.mat

% normalize data into the cube [0,1]^2 
[Xn, Yn] = normr(X, Y); 

% Compact Representation Consensus (CRC)
conf1 = CRC_init([]);
tic
[idx1, ~, ~] = CRC(Xn, Yn, conf1);
toc
figure
showMatchedFeatures(I1, I2, X(idx1,:), Y(idx1,:), 'montage');



conf2 = VFC_init([]);
% Vector Field Consensus (VFC)
tic
VecFld = VFC(Xn, Yn, conf2);
idx2 = VecFld.VFCIndex;
toc
figure
showMatchedFeatures(I1, I2, X(idx2,:), Y(idx2,:), 'montage');

% FastVFC
tic
VecFld = FastVFC(Xn, Yn, conf2);
idx3 = VecFld.VFCIndex;
toc
figure
showMatchedFeatures(I1, I2, X(idx3,:), Y(idx3,:), 'montage');

% SparseVFC
tic
VecFld = SparseVFC(Xn, Yn, conf2);
idx4 = VecFld.VFCIndex;
toc
figure
showMatchedFeatures(I1, I2, X(idx4,:), Y(idx4,:), 'montage');
