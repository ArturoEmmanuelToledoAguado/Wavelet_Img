clc;
clear all;
close all;

%Abrir imagenes
P=imread("IMG\P.jpg");
M=imread("IMG\M.jpg");

%Escala de grises
P=rgb2gray(P);
M=rgb2gray(M);

%Iteraciones
[Ca,Ch,Cv,Cd]=dwt2(P,'haar');
figure
subplot(2,2,1)
imshow(Ca)
subplot(2,2,2)
imshow(Ch)
subplot(2,2,3)
imshow(Cv)
subplot(2,2,4)
imshow(Cd)