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
imshowpair(P,M,"montage")

%Iteraciones
[Ca,Ch,Cv,Cd]=dwt2(P,'haar');
[Ca2,Ch2,Cv2,Cd2]=dwt2(Cd,'haar');
[Ca3,Ch3,Cv3,Cd3]=dwt2(Cd2,'haar');
[Ca4,Ch4,Cv4,Cd4]=dwt2(Cd3,'haar');
[Ca5,Ch5,Cv5,Cd5]=dwt2(Cd4,'haar');

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
[f,c,d]=size(Cd5);
M=imresize(M,[f c]);
Imrec5=idwt2(Ca5,Ch5,Cv5,M,'haar');
Imrec4=idwt2(Ca4,Ch4,Cv4,Imrec5,'haar');
Imrec3=idwt2(Ca3,Ch3,Cv3,Imrec4,'haar');
Imrec2=idwt2(Ca2,Ch2,Cv2,Imrec3,'haar');
Imrec=idwt2(Ca,Ch,Cv,Imrec2,'haar');
Imrec=uint8(Imrec);
figure
imshow(Imrec)