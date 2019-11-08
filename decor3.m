clc
close all
clear all


%% Reduction de 3 a deux composantes
decor2

t_set = [t_P300; t_NP300];

%% Averages
avg_P300 = sum(t_P300) ./ size(t_P300, 1);
avg_NP300 = sum(t_NP300) ./ size(t_NP300, 1);
avg_set = sum(t_set) ./ size(t_set, 1);

%% Covariance
cov_set = cov(t_set)

%% Eigenvalues and vectors
[eig_vectors, eig_values] = eig(cov_set)

%% Dimension reduction

% Choosing the dimensions with the highest variance
max_values_index = 2

tt = tt * eig_vectors(max_values_index, :)'
unit_vectors = eig_vectors(max_values_index, :)'

%% Transforming data

t_P300 = (t_P300) * unit_vectors;
t_NP300 = (t_NP300) * unit_vectors;

t_P300 = -t_P300;
t_NP300 = -t_NP300;

offset = min([min(t_P300(:)), min(t_NP300(:))]) - 0.1;

t_P300 = t_P300 - offset;
t_NP300 = t_NP300 - offset;

figure()
hold on
grid('on')
title('Decorrelation 3 composantes')
scatter(t_P300(:,1), zeros(size(t_P300)), 'filled')
scatter(t_NP300(:,1), zeros(size(t_NP300)), 'filled')
hold off



%% Histograms - P300 And NP300
% T3D1
figure()
nbins = 30;
h = histfit(t_P300(:,1),nbins, 'lognormal');
h(1).FaceAlpha = 0.5;
hold on
h = histfit(t_NP300(:,1),nbins, 'normal');
h(1).FaceAlpha = 0.5;
legend('P300','' ,'NP300', '')
title('T3D1 Parameter Histogram')
hold off

%% Frontier
pd_P300 = fitdist(t_P300(:,1),'lognormal')
pd_NP300 = fitdist(t_NP300(:,1),'normal')
x = linspace(0, 1.5, 1000);
pdf_p = pd_P300.pdf(x);
pdf_np = pd_NP300.pdf(x);
[~, frontier_i] = min(abs(pdf_np./pdf_p -1));
front = x(frontier_i)