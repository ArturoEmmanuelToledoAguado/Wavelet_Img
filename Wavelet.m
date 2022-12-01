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
[Ca2,Ch2,Cv2,Cd2]=dwt2(Ca,'haar');
[Ca3,Ch3,Cv3,Cd3]=dwt2(Ca2,'haar');
[Ca4,Ch4,Cv4,Cd4]=dwt2(Ca3,'haar');
[Ca5,Ch5,Cv5,Cd5]=dwt2(Ca4,'haar');
[Ca6,Ch6,Cv6,Cd6]=dwt2(Ca5,'haar');
[Ca7,Ch7,Cv7,Cd7]=dwt2(Ca6,'haar');
[Ca8,Ch8,Cv8,Cd8]=dwt2(Ca7,'haar');

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
[f,c,d]=size(Ca8);
M=imresize(M,[f c]);
Imrec8=idwt2(M,Ch8,Cv8,Cd8,'haar');
Imrec7=idwt2(Imrec8,Ch7,Cv7,Cd7,'haar');
%Imrec7(end,:)=[];
Imrec7(end,:,:)=[];
Imrec6=idwt2(Imrec7,Ch6,Cv6,Cd6,'haar');
Imrec5=idwt2(Imrec6,Ch5,Cv5,Cd5,'haar');
%Imrec5(:,end)=[];
Imrec4=idwt2(Imrec5,Ch4,Cv4,Cd4,'haar');
%Imrec4(:,end)=[];
Imrec3=idwt2(Imrec4,Ch3,Cv3,Cd3,'haar');
%Imrec3(:,end)=[];
Imrec2=idwt2(Imrec3,Ch2,Cv2,Cd2,'haar');
Imrec=idwt2(Imrec2,Ch,Cv,Cd,'haar');
figure
imshow(Imrec)