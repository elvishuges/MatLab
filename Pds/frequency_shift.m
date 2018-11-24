% PROBLEMA 3
% PROCESSAMENTO DIGITAL DE AUDIO
% ELVIS, ENIO, KELVIN, LINDELMO

clear;
close all;
clc;

fs = 8000;   %Frequencia de amostragem
bits = 24;   %Quantidade de bits de resolução
duracao = 5; %Duração em segundos do auido

recObj = audiorecorder(fs,bits,1); %Objeto de audio
disp('gravando...');
recordblocking(recObj, duracao);   %Gravando o audio

x = getaudiodata(recObj); %Audio original amostrado
N = numel(x);             %Quantidade de amostras
xf = fft(x);              %Transformada rapida de fourier do sinal orignal
xf((N/2):N) = 0;          %Extraindo só as frequências positivas

frequency_shift = 400;        %Frequencia de deslocamento
index = frequency_shift*N/fs; %Index do vetor para o deslocamento
xf2 = xf(index:end);          %Deslocando o vetor xf para esquerda
offset = numel(xf) - numel(xf2);
xf2(end:end+offset) = 0;      %Reajustando o tamanho do vetor
x2 = ifft(xf2,'symmetric');   %Obtendo o sinal modificado no dominio do tempo

%Recuperando o sinal deslocando o sinal recuperado para direita
xf3(index:N+index-1) = xf2;
xf3 = xf3(1:N);
x3 = ifft(xf3,'symmetric');

vals =fs*(0:(N)-1)/N;

%Plotando os graficos

subplot(2,1,1);
plot(vals,abs(xf))
title('Transformada de Fourier do Sinal Original');
xlabel('Frenquencia (Hz)');
ylabel('|X(f)|');

subplot(2,1,2);
tick = linspace(0,duracao,fs*duracao);
plot(tick, x);
title('Sinal Original');
xlabel('Tempo (segundos)');
ylabel('x[n]');

figure();
subplot(2,1,1);
plot(vals,abs(xf2))
title('Transformada de Fourier do Sinal Modificado');
xlabel('Frenquencia (Hz)');
ylabel('|X(f)|');

subplot(2,1,2);
plot(tick, x2);
title('Sinal Modificado');
xlabel('Tempo (segundos)');
ylabel('x_{Modificado}[n]');

figure();
subplot(2,1,1);
plot(vals,abs(xf3))
title('Transformada de Fourier do Sinal Recuperado');
xlabel('Frenquencia (Hz)');
ylabel('|X(f)|');

subplot(2,1,2);
plot(tick, x3);
title('Sinal Recuperado');
xlabel('Tempo (segundos)');
ylabel('x_{Recuperado}[n]');

sound(x3);

