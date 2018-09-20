function retornoGaussJacobi = gaussJacobi(A)
%GAUSSSEIDEL Summary of this function goes here
%   Detailed explanation goes here

disp('Início do Método Gauss-Jacobi');
erro = 0.00001; % valor do erro
maxIteracao = 100;
% realizando o pivotamento...

A = pivotamento(A); % chama a função para realizar o pivotamento
% abaixo é a parte responsavel por decompor a matriz original em
% coeficientes A e termos independentes B
[R,C] = size(A); 
B = A(:,C);
A(:,C) = []; 

% cria um vetor dos resultados a cada iteração
[n,m] = size (A);
x=zeros(n,1); 
xAntiga = zeros(n,1);
iteracao = 1;

while(iteracao < maxIteracao )     
           
     fprintf('%8.1f  ',iteracao);
     
     for i=1:n
     I=[1:i-1 i+1:n]; %armazena os que serão subtraidos em cada iteração nas linhs do sistema
     xAntiga(i)=(B(i)-A(i,I)*x(I))/A(i,i);
     end
         
     xFormatada = xAntiga'; % formata para ser imprimida no console
     fprintf([repmat('%8.16f\t', 1, size(xFormatada, 2)) '\n'], xFormatada') % imprime ni console
     esp =abs((xAntiga-x));% calcula o valor do erro e armazena na matriz esp
     if max(esp) < erro %verifica o se no vetor de erro "esp" o maior elemento é menor que o criterio de parada
           break;
     end  
     
     x = xAntiga;         
     iteracao = iteracao + 1;
end
retornoGaussJacobi = xAntiga;
%#########################Realiza o pivotamento #######################

 function APivot = pivotamento(A)
     APivot = A;
       [n,m] = size (A);
        for k2=1: n-1
            [big,i] = max (abs( APivot(k2:n,k2))); % verifica o maior valor 
            ipr = i+k2-1;
            if ipr ~= k2
            APivot([k2,ipr],:)= APivot ([ipr,k2],:); % troca as linhas 
            end
        end  
 end

%####################################################

end

