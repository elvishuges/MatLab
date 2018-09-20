function  main
% Autor : Elvis Huges do Nascimeto 
% Universidade Estadual de Feira de Santana
% 06/11/2007


A = input('Insira a matriz aumentada:');
disp('qual Algoritmo vc deseja execultar?');
escolha = input('(1)Gauus;  (2)Fatoração-LU;  (3)Gauss-Jacobi;  (4)Gauss-Seidel (5) TODOS/Comparação \n');

if escolha == 1
  gauss(A); 
end
if escolha == 2
  luFact(A);  
end
if escolha == 3
  gaussJacobi(A); 
end
if escolha == 4
   gaussSeidel(A);
end

if escolha == 5   
   retornoGauss = gauss(A); 
   retornoFatoracaoLU = luFact(A);
   retornoGaussJacobi = gaussJacobi(A);
   retornoGaussSeidel = gaussSeidel(A);
   disp('#########################Comparação Entre Os Métodos#####################################');
   disp('x1,x2,...xn, para n Linhas do Sistema');
   disp('Eliminação de Gauss 		| Fatoração LU 			| Gauss-Jacobi 			| Gauss Seidel');
  
   fprintf('%8.16f   |      %8.16f  |    %8.16f   |   %8.16f \n', [retornoGauss,retornoFatoracaoLU,retornoGaussJacobi,retornoGaussSeidel]')
   
end



end

