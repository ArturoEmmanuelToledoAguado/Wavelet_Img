clc;
clear all;
close all;

%Abrir imagenes
P=imread("IMG\P.jpg");
M=imread("IMG\M.jpg");

%Escala de grises
P=rgb2gray(P);
M=rgb2gray(M);

figure
imshow(P)

%Iteraciones
[Ca,Ch,Cv,Cd]=dwt2(P,'haar');
[Ca2,Ch2,Cv2,Cd2]=dwt2(Cd,'haar');

figure
subplot(2,2,1)
imshow(Ca)
subplot(2,2,2)
imshow(Ch)
subplot(2,2,3)
imshow(Cv)
subplot(2,2,4)
imshow(Cd)

%Rearmado
[f,c]=size(Cd2);
M=imresize(M,[f c]);
Imrec2=idwt2(Ca2,Ch2,Cv2,M,'haar');
Imrec=idwt2(Ca,Ch,Cv,Imrec2,'haar');
figure
imshow(Imrec)