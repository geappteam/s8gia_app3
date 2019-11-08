%%NOTE: Recommend to understand priori P(Ci)
%% Bayes parameters
% Cost
false_neg_cost = 3;
false_pos_cost = 1;
L = [ 0 false_neg_cost ; false_pos_cost 0 ];
% Dimension
dimensions = 4;
M = dimensions;
% Data
X = ref_P300;
%% Bayes - A : Classification Algorithm (wih hypothesis of Gauss laws only)
[rowX,colX] = size(X);
mx = zeros(1,colX);
PXC = zeros(1,colX);
RX = zeros(1,colX);
for i = 1:colX
    %Mean 
    mx(i) = sum(X(:,i))/length(X(:,i));
    %Gauss
    PXC = 1/(((2*pi)^(M/2))*(det(Co.*eye(size(Co)))*(1/2)))*exp(-1/2*(X-mx(i))*inv(Co.*eye(size(Co)))*(X-mx(i))');
end

% PC = ones(1,colX)*1/colX;
% PX = 1/rowX;
% for i = 1:length(X)
%     RX(i) = 1/PX*sum(l*PXC*PC);
% end

%% Bayes - B : Classification Algorithm (without Gauss laws hypothesis, without mathematical expression of frontiers, with Bayes Risk)


%% Bayes - C : Classification Algorithm (with mathematical expression of frontiers, with hypothesis of Gauss Density Probability)