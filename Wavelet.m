clc;
clear all;
close all;

wav=["haar","coif1","fk4","dmey","bior1.1","rbio1.1"];
P=["IMG/P.jpg","IMG/P1.jpg","IMG/P2.jpg","IMG/P3.jpg","IMG/P4.jpg","IMG/P5.jpg"];
M=["IMG/M.jpg","IMG/M1.jpg","IMG/M2.jpg","IMG/M3.jpg","IMG/M4.jpg","IMG/M5.jpg"];

for i=1:6
    %Abrir imagenes
    Por=imread(P(i));
    Men=imread(M(i));

    %Escala de grises
    Por=rgb2gray(Por);
    Men=rgb2gray(Men);

    figure('Name','Imagenes')
    imshowpair(Por,Men,"montage")
    title('Portadora         Mensaje')

    %Iteraciones
    [Ca,Ch,Cv,Cd]=dwt2(Por,wav(i));
    [Ca2,Ch2,Cv2,Cd2]=dwt2(Cd,wav(i));
    [Ca3,Ch3,Cv3,Cd3]=dwt2(Cd2,wav(i));
    [Ca4,Ch4,Cv4,Cd4]=dwt2(Cd3,wav(i));
    [Ca5,Ch5,Cv5,Cd5]=dwt2(Cd4,wav(i));

    figure('Name','Wavelet')
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
    Men=imresize(Men,[f c]);
    Imrec5=idwt2(Ca5,Ch5,Cv5,Men,wav(i));
    Imrec5=imresize(Imrec5,size(Cd4));
    Imrec4=idwt2(Ca4,Ch4,Cv4,Imrec5,wav(i));
    Imrec4=imresize(Imrec4,size(Cd3));
    Imrec3=idwt2(Ca3,Ch3,Cv3,Imrec4,wav(i));
    Imrec3=imresize(Imrec3,size(Cd2));
    Imrec2=idwt2(Ca2,Ch2,Cv2,Imrec3,wav(i));
    Imrec2=imresize(Imrec2,size(Cd));
    Imrec=idwt2(Ca,Ch,Cv,Imrec2,wav(i));
    Imrec=uint8(Imrec);
    figure('Name','Resultado')
    imshow(Imrec)
    title('Imagenes en una')
end
%https://la.mathworks.com/help/wavelet/ref/wfilters.html 