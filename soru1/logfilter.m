clear all;
sigma=5;%sigma 1,5,10 için filtre büyüdükçe iç kenarlarý gösteremiyor 
x=-3*sigma:3*sigma;
y=-3*sigma:3*sigma;
[a, boyut]=size(x);
for i=1:boyut %2 boyutlu gauss filtreyi oluþtur
    for j=1:boyut
        B(i,j)=(-1)*((x(i)^2+y(j)^2-2*(sigma^2))/sigma^4)*exp(((-1)*(x(i)^2+y(j)^2))/(2*(sigma^2)));
    end
end
toplam=sum(B(:));
B=B/toplam;%filtrenin içindeki katsayýlarýn toplamý 1 olsun
f=imread('C:\Users\Melike Nur Mermer\Desktop\Bilgisayarla Görme\Odev1\regions.pgm');
g=imfilter(f,B);
[g,t]=edge(g,'zerocross');
imshow(f);
figure
imshow(g);
%mesh(B);