clc
clear all
close all
%% LOAD DATA
data_P300_path = 'Donnees8/ref_P300';
data_NP300_path = 'Donnees8/ref_NP300';
load(data_P300_path);
load(data_NP300_path);

ref_set = [ref_P300; ref_NP300];

%% Averages
avg_P300 = sum(ref_P300) ./ size(ref_P300, 1);
avg_NP300 = sum(ref_NP300) ./ size(ref_NP300, 1);
avg_set = sum(ref_set) ./ size(ref_set, 1);

%% Covariance
cov_set = cov(ref_set)

%% Eigenvalues and vectors
[eig_vectors, eig_values] = eig(cov_set)

%% Dimension reduction

% Choosing the dimensions with the highest variance
dimension_count = 3;
[~, max_values_index] = maxk(eig_values * ones(4,1), dimension_count);


unit_vectors = eig_vectors(max_values_index, :)';

%% Transforming data

t_P300 = (ref_P300) * unit_vectors;
t_NP300 = (ref_NP300) * unit_vectors;

figure()
hold on
grid('on')
title('Decorrelation 3 composantes')
scatter3(t_P300(:,1), t_P300(:,2), t_P300(:,3), 'filled')
scatter3(t_NP300(:,1), t_NP300(:,2), t_NP300(:,3), 'filled')
hold off


%% Histograms - P300 And NP300
% T1D1
figure()
nbins = 30;
h = histfit(t_P300(:,1),nbins);
h(1).FaceAlpha = 0.5;
hold on
h = histfit(t_NP300(:,1),nbins);
h(1).FaceAlpha = 0.5;
legend('P300','' ,'NP300', '')
title('T1D1 Parameter Histogram')
hold off

% T1D2
figure()
nbins = 30;
h = histfit(t_P300(:,2),nbins);
h(1).FaceAlpha = 0.5;
hold on
h = histfit(t_NP300(:,2),nbins);
h(1).FaceAlpha = 0.5;
legend('P300','' ,'NP300', '')
title('T1D2 Parameter Histogram')
hold off

% T1D3
figure()
nbins = 30;
h = histfit(t_P300(:,3),nbins);
h(1).FaceAlpha = 0.5;
hold on
h = histfit(t_NP300(:,3),nbins);
h(1).FaceAlpha = 0.5;
legend('P300','' ,'NP300', '')
title('T1D3 Parameter Histogram')
hold off