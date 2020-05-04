clear all;
%    Nx1, Nx2 => x ekseni yönünde uygulanacak filtrenin boyutlarý
%    Sigma1, sigma2 azaldýkça daha ince kenarlar
     Nx1=10;Sigmax1=0.5;Nx2=10;Sigmax2=0.5;Theta1=pi/2;
%    Ny1, Ny2 => y ekseni yönünde uygulanacak filtrenin boyutlarý
     Ny1=10;Sigmay1=0.5;Ny2=10;Sigmay2=0.5;Theta2=0;
     alfa=0.1;%threshold parametresi
     
w=imread('C:\Users\Melike Nur Mermer\Desktop\Bilgisayarla Görme\Odev1\regions.pgm');               
w=im2double(w);
% x ekseni yönünde kenarlarý bulma
filterx=d2dgauss(Nx1,Sigmax1,Nx2,Sigmax2,Theta1);
Ix=imfilter(w,filterx);

% y ekseni yönünde kenarlarý bulma
filtery=d2dgauss(Ny1,Sigmay1,Ny2,Sigmay2,Theta2);
Iy=imfilter(w,filtery); 

% x ve y yönündeki türevleri birleþtirme
NVI=sqrt(Ix.*Ix+Iy.*Iy);

% eþik seviyesi min ve max piksel arasýnda alfa deðerine göre bulunur
I_max=max(max(NVI));
I_min=min(min(NVI));
level=alfa*(I_max-I_min)+I_min;%eþik seviyesi
Ibw=max(NVI,level.*ones(size(NVI)));%görüntüde eþik deðerinde olan pikselleri al
imshow(Ibw);