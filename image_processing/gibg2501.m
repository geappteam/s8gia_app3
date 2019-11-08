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


%% Classification des images
clc, clear all, close all;

coast_images = dir('baseDeDonneesImagesLabEtProblematique\baseDeDonneesImages\coast*.jpg');
%forest_images = dir('baseDeDonneesImagesLabEtProblematique\baseDeDonneesImages\forest*.jpg');
%street_images = dir('baseDeDonneesImagesLabEtProblematique\baseDeDonneesImages\street*.jpg');

% Détermination de la taille de l'échantillon de validation (et
% complémentairement d'entrainement)
validation_set_size = round(size(coast_images,1)*0.20);

% Création de l'échantillon d'entrainement
coast_training_set = coast_images(1:end - validation_set_size, 1);
%forest_training_set = forest_images(1:end - validation_set_size, 1);
%street_training_set = street_images(1:end - validation_set_size, 1);

% Création de l'échantillon de validation
coast_validation_set = coast_images(end-validation_set_size+1:end, 1);
%forest_validation_set = forest_images(end-validation_set_size+1:end, 1);
%street_validation_set = street_images(end-validation_set_size+1:end, 1);

coast_vector_images = {size(coast_training_set, 1)};
% coast_vector_images_R = zeros(1, size(coast_training_set, 1)*256^2);
% coast_vector_images_G = zeros(1, size(coast_training_set, 1)*256^2);
% coast_vector_images_B = zeros(1, size(coast_training_set, 1)*256^2);

coast_vector_images_R = [];
coast_vector_images_G = [];
coast_vector_images_B = [];

%for i=1:size(coast_training_set, 1)
for i=1:1
    im = double(imread(strcat('baseDeDonneesImagesLabEtProblematique\baseDeDonneesImages\', coast_training_set(1).name)));
    coast_vector_images{i} = reshape(im,1,256^2,3);
    coast_vector_images_R = [coast_vector_images_R coast_vector_images{i}(1,:,1)];
    coast_vector_images_G = [coast_vector_images_G coast_vector_images{i}(1,:,2)];
    coast_vector_images_B = [coast_vector_images_B coast_vector_images{i}(1,:,3)];
end

mean_R = mean(coast_vector_images_R);
mean_G = mean(coast_vector_images_G);
mean_B = mean(coast_vector_images_B);

norm_coast_vector_images_R = coast_vector_images_R - mean_R;
norm_coast_vector_images_G = coast_vector_images_G - mean_G;
norm_coast_vector_images_B = coast_vector_images_B - mean_B;

covar_RR = sum((norm_coast_vector_images_R ) .* (norm_coast_vector_images_R ), 'all')/size(norm_coast_vector_images_R,2);
covar_RG = sum((norm_coast_vector_images_R ) .* (norm_coast_vector_images_G), 'all')/size(norm_coast_vector_images_R,2);
covar_RB = sum((norm_coast_vector_images_R ) .* (norm_coast_vector_images_B), 'all')/size(norm_coast_vector_images_R,2);

covar_GR = sum((norm_coast_vector_images_G) .* (norm_coast_vector_images_R ), 'all')/size(norm_coast_vector_images_R,2);
covar_GG = sum((norm_coast_vector_images_G) .* (norm_coast_vector_images_G), 'all')/size(norm_coast_vector_images_R,2);
covar_GB = sum((norm_coast_vector_images_G) .* (norm_coast_vector_images_B), 'all')/size(norm_coast_vector_images_R,2);

covar_BR = sum((norm_coast_vector_images_B) .* (norm_coast_vector_images_R ), 'all')/size(norm_coast_vector_images_R,2);
covar_BG = sum((norm_coast_vector_images_B) .* (norm_coast_vector_images_G), 'all')/size(norm_coast_vector_images_R,2);
covar_BB = sum((norm_coast_vector_images_B) .* (norm_coast_vector_images_B), 'all')/size(norm_coast_vector_images_R,2);


covar_mat = [covar_RR covar_RG covar_RB; covar_GR covar_GG covar_GB; covar_BR covar_BG covar_BB];

[eig_vecs, eig_vals] = eig(covar_mat);

[max_eig_val, col_of_max] = max(eig_vals,[],'all', 'linear');
col_of_max = mod(col_of_max, size(eig_vals,1));

if col_of_max == 0
    col_of_max = 3;
end

log_max_eig_val = log10(max_eig_val);

for i=1:size(eig_vals)
    if  log10(max(eig_vals(:,i))) < log_max_eig_val - 2
        eig_vecs(:,i) = [];
    end
end

final_data = eig_vecs'*[norm_coast_vector_images_R;norm_coast_vector_images_G;norm_coast_vector_images_B];

% forest_vector_images = {size(forest_training_set, 1)};
% for i=1:size(forest_training_set, 1)
%     im = double(imread(strcat('baseDeDonneesImagesLabEtProblematique\baseDeDonneesImages\', forest_training_set(1).name)));
%     forest_vector_images{i} = reshape(im,1,256^2,3);
% end
% 
% street_vector_images = {size(street_training_set, 1)};
% for i=1:size(street_training_set, 1)
%     im = double(imread(strcat('baseDeDonneesImagesLabEtProblematique\baseDeDonneesImages\', street_training_set(1).name)));
%     street_vector_images{i} = reshape(im,1,256^2,3);
% end

disp(covar_mat);
