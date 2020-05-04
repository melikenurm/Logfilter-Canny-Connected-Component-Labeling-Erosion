clear all;
grnt='semboller';
bw=imread(strcat('C:\Users\Melike Nur Mermer\Desktop\Bilgisayarla Görme\Odev1\',grnt,'.pgm'));
bw=im2bw(bw);
bw=imcomplement(bw);
imshow(bw);
[m,n]=size(bw);
bwnnew = [ zeros(1,n) ;  bw; zeros(1,n)];%zero-padding
bwnnew  = [ zeros(m+2,1) , bwnnew , zeros(m+2,1)];

L=zeros(size(bwnnew));

startLabel=1;
for ir=2:m+1
    for ic=2:n+1
        
        curdata=bwnnew(ir,ic);
        lc = L(ir,ic);
        
        if((curdata==1)&&(lc==0))
            L(ir,ic)=startLabel;
             L = findConnectedLabels8yonlu(L,startLabel,bwnnew,ir,ic,m,n);
             startLabel=startLabel+1;
        end
        
    end
end
startLabel=startLabel-1;
L = L(2:m+1,2:n+1);
% L=uint8(L);
imshow(L);
filename=strcat(grnt,'_8yonlu.pgm');
imwrite(L,filename);
