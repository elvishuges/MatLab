  function retornoFatoracaoLU = luFact(A) 
    

  [R,C] = size(A); % captura o numero de linhas R e do colunas C
  B = A(:,C); % separa no vetor B a ultima coluna C da matriz A
  A(:,C) = []; % excluir da matriz A a coluna C

  [R,C] = size(A); % captura novamente o numero da linha e da coluna na nova matriz A
  disp('Fatoraçao LU:');
  for i=1:R
  L(i,1) = A(i,1);
  U(i,i) = 1;
  end

  for j=2:R
    U(1,j) = A(1,j)/L(1,1);    
  end
  for i= 2:R    
      for j = 2:i
          L(i,j) = A(i,j) -L(i,1:j-1) * U(1:j-1,j);
      end
      for j=i+1:R
        U(i,j) = (A(i,j) - L(i,1:i-1)*U(1:i-1,j))/L(i,i);         
      end
  end 

  disp('L:');

  fprintf([repmat('%8.16f\t', 1, size(L, 2)) '\n'], L')
  fprintf('\n');
  disp('U:');
  fprintf([repmat('%8.16f\t', 1, size(U, 2)) '\n'], U')
   
   y = encontraY(L,B);
   x = encontraX(U,y);
   disp('Raizes Fatoração LU:');
   
   fprintf([repmat('%8.16f\t', 1, size(x, 2)) '\n'], x')
   
   retornoFatoracaoLU = x;
   
end


 function y = encontraY(L,B)
        n = length(B);
        y(1,1) = B(1)/L(1,1);
        for i= 2:n
            y(i,1) = (B(i) - L(i,1:i-1)*y(1:i-1,1))./L(i,i); 
        end
        
 end
  
 
 
  function x = encontraX(U,y)
        n = length(y);
        x(n,1) = y(n)/U(n,n);
        for i=n -1:-1:1
            x(i,1) = (y(i) - U(i,i+1:n) * x(i+1:n,1)./U(i,i));
        end
    end
