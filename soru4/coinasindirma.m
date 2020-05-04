clear all;
f=imread('C:\Users\Melike Nur Mermer\Desktop\Bilgisayarla G�rme\Odev1\coins.pgm');
imshow(f);
f=im2bw(f);
%4 piksel �apl� diskle coinlerin say�s� bulunur, 1 piksel �apl� disk ile
%boundary detection i�lemi yap�l�r.
se = strel('disk',4);%11 olunca t�m coinler a��n�yor
f1=imerode(f,se);
imshow(f);
figure
% f1=uint8(f1);
imshow(f1);

[m,n]=size(f1);
bwnnew = [ zeros(1,n);  f1; zeros(1,n)];%zero-padding
bwnnew  = [ zeros(m+2,1) , bwnnew , zeros(m+2,1)];

L=zeros(size(bwnnew));

startLabel=1;
for ir=2:m+1
    for ic=2:n+1
        
        curdata=bwnnew(ir,ic);
        lc = L(ir,ic);
        
        if((curdata==1)&&(lc==0))%piksel dolu ve o piksele  v�u�ranmam��
            L(ir,ic)=startLabel;
             L = findConnectedLabels(L,startLabel,bwnnew,ir,ic,m,n);
             startLabel=startLabel+1;
        end
        
    end
end
startLabel=startLabel-1;
L = L(2:m+1,2:n+1);

f2=f-f1;%kenar bulma i�in ilk g�r�nt�den a��nd�r�lm�� g�r�nt� ��kart�l�r
figure
imshow(f2);