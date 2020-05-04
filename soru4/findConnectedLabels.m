%4-y�nl� ba�l� bile�en bulma fonksiyonu
function [L]  = findConnectedLabels(L,startLabel,bwcur,ir,ic,m,n)
        
        a = bwcur(ir+1, ic);  % sa�daki piksel
        b = bwcur(ir-1, ic);  % sol
        c = bwcur(ir, ic+1);  % alt
        d = bwcur(ir, ic-1);  % �st
        
        %gezilmi� matristeki pikseller
        aa = L(ir+1, ic);
        bb = L(ir-1, ic);    
        cc = L(ir, ic+1);  
        dd = L(ir, ic-1);  
        
        if((a==1)&&(aa==0))
            L(ir+1, ic)=startLabel;
            [L]  = findConnectedLabels(L,startLabel,bwcur,ir+1,ic,m,n);
        end
        
        if((b==1)&&(bb==0))
            L(ir-1, ic)=startLabel;
            [L]  = findConnectedLabels(L,startLabel,bwcur,ir-1,ic,m,n);
        end
        
        if((c==1)&&(cc==0))
            L(ir, ic+1)=startLabel;
            [L]  = findConnectedLabels(L,startLabel,bwcur,ir,ic+1,m,n);
        end
        
        if((d==1)&&(dd==0))
            L(ir, ic-1)=startLabel;
            [L]  = findConnectedLabels(L,startLabel,bwcur,ir,ic-1,m,n);
        end

end