clear all; close all; clc

f = 50; %frequencia do sinal (ventilador)
fs = 30; %frequencia de amostragem

Ts = 1/fs;
%>>>>>>>>>>>>>> Amostragem do Sinal (TEMPO)<<<<<<<<<<<<<<
tempo = [0:1/(100*f):10/f]; %tempo amostral
sinal = sin(2*pi*f*tempo);  %sinal senoidal
subplot(2,1,1);
plot(tempo, sinal); %plot da amostragem
hold on;
%
N = 101; 
amostras = [0:1:N-1];
t_sample = [0:Ts:amostras(N)*Ts];
DigitalFrequency = 2*pi*(f/fs);
sinal_sample = sin(DigitalFrequency.*amostras);
stem(t_sample,sinal_sample, 'red');
axis([0 10/f -1.5 1.5]);
set(gca,'FontSize', 16);
xlabel('$t$', 'Interpreter', 'LaTex', 'FontSize', 18);
ylabel('$x[n.Ts], x(t)$','Interpreter','Latex','FontSize',18);


%>>>>>>>>>>>>>>>>SIMULAÇÃO DO GIRO NO TEMPO<<<<<<<<<<<<<<<<<<<
%desenha o circulo
clc
r = 1; xc = 0; yc = 0;
theta = linspace(0,2*pi);
x = r*cos(theta) + xc; y = r*sin(theta) + yc;
subplot(2,1,2);
plot(x,y)
title('Simulação da Amostragem no Tempo');
axis(gca, 'equal');
axis([-1.5 1.5 -1.5 1.5]);

%Superamostragem (f > 2*fs)
%Parado (f = 2*fs)
%Aliasing (f < 2*fs)

w = 2*pi*f; %giro no sentido horário
%t = 0;
n = 0;

while n <= 100
    
        t = n*Ts;
        %disp('tempo');
        %disp(t)
        pos_x = cos(w*t);
        pos_y = sin(w*t);
        pos = r*[pos_x,pos_y];
        bola = viscircles(pos,0.05);
        pause(0.8);
        delete(bola);
        %disp('numero do pulso');
        %disp(n); 
        n = n + 1;
  
    %t = t+0.1;
    
end
