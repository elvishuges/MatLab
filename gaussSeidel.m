function retornoGaussSeidel = gaussSeidel(A)
%GAUSSSEIDEL Summary of this function goes here
%   Detailed explanation goes here

disp('Início do Método Gauss-Seidel');
erro = 0.00001;
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
x0 = zeros(n,1); 
x=zeros(n,1); 

% corpo principal do método
iteracao = 1;
while(iteracao < maxIteracao )       
     
     fprintf('%8.1f  ',iteracao);
     
     for i=1:n
     I=[1:i-1 i+1:n];
     x(i)=(B(i)-A(i,I)*x(I))/A(i,i);
     end
     
     esp=(abs(x-x0)); % calcula o erro
     xFormatada = x';
     fprintf([repmat('%8.16f\t', 1, size(xFormatada, 2)) '\n'], xFormatada')
         % fprintf(' %8.16f \n',xFormatada);
        
     if max(esp)< erro % verifica o se no vetor de erro "esp" o maior elemento é menor que o criterio de parada
           break;
     end
     x0=x;
     iteracao = iteracao + 1;
end

retornoGaussSeidel = x;
%#########################Realiza o pivotamento #######################

 function APivot = pivotamento(A)
     APivot = A;
       [n,m] = size (APivot);
        for k2=1:n-1
            [big,i] = max (abs( APivot(k2:n,k2)));
            ipr = i+k2-1;
            if ipr ~= k2
            APivot([k2,ipr],:)= APivot ([ipr,k2],:);
            end
        end  
 end

%####################################################
 
end

