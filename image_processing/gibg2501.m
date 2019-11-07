%% D1
clc, clear all, close all;

iterations = 10;
data_points = [20, 50, 100, 500];

m = cell(iterations, length(data_points));
C = cell(iterations, length(data_points));

m_average = cell(length(data_points), 1);
C_average = cell(length(data_points), 1);

m_stddev = cell(length(data_points), 1);
C_stddev = cell(length(data_points), 1);

for i=1:length(data_points)
    % Initialise les cells aux bonnes dimensions 
    m_average{i} = zeros(2, 1);
    C_average{i} = zeros(2, 2);
    
    m_stddev{i} = zeros(2, 1);
    C_stddev{i} = zeros(2, 2);
    
    N = data_points(i);
    
    for j=1:iterations
    
    x1 = randn(1, N) + 3;
    x2 = randn(1, N) - 1;

    % Calcul des moyennes
    m{j,i} = [sum(x1)/N; sum(x2)/N];

    % Estimation de la covariance
    ctmp = [x1 - m{j,i}(1); x2 - m{j,i}(2)];
    C{j,i} = (ctmp * ctmp') / (N - 1);
    
    % Accumulation pour calcul de la moyenne des moyenne et des ecarts-types
    m_average{i} = m_average{i} + m{j,i};
    C_average{i} = C_average{i} + C{j,i};
    end

    m_average{i} = m_average{i} ./ iterations;
    C_average{i} = C_average{i} ./ iterations;

    for j=1:iterations
        m_stddev{i} = m_stddev{i} + (m{j,i} - m_average{i}).^2
        C_stddev{i} = C_stddev{i} + (C{j,i} - C_average{i}).^2
    end

    m_stddev{i} = sqrt(m_stddev{i} / (iterations-1));
    C_stddev{i} = sqrt(C_stddev{i} / (iterations-1));

    % Affichage
    figure;
    plot(x1, x2, '+');
    hold on;
    plot([m_average{i}(1) m_average{i}(1)], get(gca,'ylim'));
    plot([(m_average{i}(1)- m_stddev{i}(1)) (m_average{i}(1)- m_stddev{i}(1))], get(gca,'ylim'));
    title(sprintf('Serie de %d points generes', N));
end

load C1.txt
load C2.txt
load C3.txt


%%
clc, clear all, close all;
im = double(imread('baseDeDonneesImagesLabEtProblematique\baseDeDonneesImages\coast_art294.jpg'));

R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

mean_R = mean(R, 'all');
mean_G = mean(G, 'all');
mean_B = mean(B, 'all');

covar_RR = sum((R - mean_R) .* (R - mean_R), 'all')/256^2-1;
covar_RG = sum((R - mean_R) .* (G - mean_G), 'all')/256^2-1;
covar_RB = sum((R - mean_R) .* (B - mean_B), 'all')/256^2-1;

covar_GR = sum((G - mean_G) .* (R - mean_R), 'all')/256^2-1;
covar_GG = sum((G - mean_G) .* (G - mean_G), 'all')/256^2-1;
covar_GB = sum((G - mean_G) .* (B - mean_B), 'all')/256^2-1;

covar_BR = sum((B - mean_B) .* (R - mean_R), 'all')/256^2-1;
covar_BG = sum((B - mean_B) .* (G - mean_G), 'all')/256^2-1;
covar_BB = sum((B - mean_B) .* (B - mean_B), 'all')/256^2-1;

covar_mat = [covar_RR covar_RG covar_RB; covar_GR covar_GG covar_GB; covar_BR covar_BG covar_BB];

[eig_vals, eig_vec] = eig(covar_mat);

disp(covar_mat);
