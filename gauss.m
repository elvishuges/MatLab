function retornoGauss = gauss(A)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

disp('Eliminação de Gauss c/ Pivotamento:');


[R,C] = size(A); % tamanho do sistema para ser dividido em A e B
B = A(:,C); % cria matriz das constantes
A(:,C) = []; % nova A com coeficientes
[m,n] = size (A);
nb = n+1;
if(m~=n), error('a matriz dos coeficientes deve ser quadrada'); end    
Aug = [A  B];   

for k=1: n-1
    fprintf('interação k = %8.1f \n',k);
    [big,i] = max (abs( Aug(k:n,k)));
    %fprintf('maior:%8.4f',big);
    ipr = i+k-1;
    if ipr ~= k
        Aug([k,ipr],:) = Aug ([ipr,k],:);
    end
    for i=k+1:n
        factor = Aug(i,k)/Aug(k,k);
        Aug(i,k:nb)=Aug(i,k:nb) -factor*Aug(k,k:nb);       
    end
    fprintf([repmat('%8.16f\t', 1, size(Aug, 2)) '\n'], Aug')
end
% retro substituição
x = zeros(n,1); % cria o vetor x com n linhas e 1 coluna


x(n) = Aug (n,nb)/Aug(n,n); % posição n


for i = n-1:-1:1 %substituição regressiva
    %fprintf('  i : %8.16f \n',i);
    x(i) = (Aug(i,nb) -Aug (i,i+1:n)*x(i+1:n))/Aug(i,i);
    %fprintf('%8.16f \n',x(i));
end

disp('Raizes da eleiminação de Gauss:');
fprintf([repmat('%8.16f\t', 1, size(x, 2)) '\n'], x')
retornoGauss = x;
end

