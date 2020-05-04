clear all;
sigma=5;%sigma 1,5,10 i�in filtre b�y�d�k�e i� kenarlar� g�steremiyor 
x=-3*sigma:3*sigma;
y=-3*sigma:3*sigma;
[a, boyut]=size(x);
for i=1:boyut %2 boyutlu gauss filtreyi olu�tur
    for j=1:boyut
        B(i,j)=(-1)*((x(i)^2+y(j)^2-2*(sigma^2))/sigma^4)*exp(((-1)*(x(i)^2+y(j)^2))/(2*(sigma^2)));
    end
end
toplam=sum(B(:));
B=B/toplam;%filtrenin i�indeki katsay�lar�n toplam� 1 olsun
f=imread('C:\Users\Melike Nur Mermer\Desktop\Bilgisayarla G�rme\Odev1\regions.pgm');
g=imfilter(f,B);
[g,t]=edge(g,'zerocross');
imshow(f);
figure
imshow(g);
%mesh(B);