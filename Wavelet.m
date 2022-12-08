clc;
clear all;
close all;

%Abrir imagenes
P=imread("IMG\P.jpg");
M=imread("IMG\M.jpg");

wav=["haar","coif1","fk4","dmey","bior1.1","rbio1.1"];

%Escala de grises
P=rgb2gray(P);
M=rgb2gray(M);

figure('Name','Imagenes')
imshowpair(P,M,"montage")
title('Portadora         Mensaje')

for i=1:6
    %Iteraciones
    [Ca,Ch,Cv,Cd]=dwt2(P,wav(i));
    [Ca2,Ch2,Cv2,Cd2]=dwt2(Cd,wav(i));
    [Ca3,Ch3,Cv3,Cd3]=dwt2(Cd2,wav(i));
    [Ca4,Ch4,Cv4,Cd4]=dwt2(Cd3,wav(i));
    [Ca5,Ch5,Cv5,Cd5]=dwt2(Cd4,wav(i));

    figure
    sgtitle(wav(i))
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
    Imrec5=idwt2(Ca5,Ch5,Cv5,M,wav(i));
    if size(Imrec5)~= size(Cd4)
        Imrec5=imresize(Imrec5,size(Cd4));
    end
    Imrec4=idwt2(Ca4,Ch4,Cv4,Imrec5,wav(i));
    if size(Imrec4)~= size(Cd3)
        Imrec4=imresize(Imrec4,size(Cd3));
    end
    Imrec3=idwt2(Ca3,Ch3,Cv3,Imrec4,wav(i));
    if size(Imrec3)~= size(Cd2)
        Imrec3=imresize(Imrec3,size(Cd2));
    end
    Imrec2=idwt2(Ca2,Ch2,Cv2,Imrec3,wav(i));
    if size(Imrec2)~= size(Cd)
        Imrec2=imresize(Imrec2,size(Cd));
    end
    Imrec=idwt2(Ca,Ch,Cv,Imrec2,wav(i));
    Imrec=uint8(Imrec);
    figure
    imshow(Imrec)
    title('Imagenes en una')
end
%https://la.mathworks.com/help/wavelet/ref/wfilters.html 