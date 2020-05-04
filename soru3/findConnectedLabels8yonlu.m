%8-yönlü baðlý bileþen bulma fonksiyonu
function [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir,ic,m,n)

        a = bwcur(ir+1, ic);  % sað
        b = bwcur(ir-1, ic);  % sol
        c = bwcur(ir, ic+1);  % alt
        d = bwcur(ir, ic-1);  % üst
        e = bwcur(ir+1,ic+1); % sað-üst
        f = bwcur(ir-1,ic+1); % sol-üst
        g = bwcur(ir+1,ic-1); % sað-alt
        h = bwcur(ir-1,ic-1); % sol-alt
        
        %gezilmiþ matristeki pikseller
        aa = L(ir+1, ic); 
        bb = L(ir-1, ic);  
        cc = L(ir, ic+1); 
        dd = L(ir, ic-1);  
        ee = L(ir+1,ic+1);
        ff = L(ir-1,ic+1);
        gg = L(ir+1,ic-1);
        hh = L(ir-1,ic-1);
        
        if((a==1)&&(aa==0))
            L(ir+1, ic)=startLabel;
            [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir+1,ic,m,n);
        end
        
        if((b==1)&&(bb==0))
            L(ir-1, ic)=startLabel;
            [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir-1,ic,m,n);
        end
        
        if((c==1)&&(cc==0))
            L(ir, ic+1)=startLabel;
            [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir,ic+1,m,n);
        end
        
        if((d==1)&&(dd==0))
            L(ir, ic-1)=startLabel;
            [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir,ic-1,m,n);
        end
        
        if((e==1)&&(ee==0))
            L(ir+1, ic+1)=startLabel;
            [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir+1,ic+1,m,n);
        end
        
        if((f==1)&&(ff==0))
            L(ir-1, ic+1)=startLabel;
            [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir-1,ic+1,m,n);
        end
        
        if((g==1)&&(gg==0))
            L(ir+1, ic-1)=startLabel;
            [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir+1,ic-1,m,n);
        end
        
        if((h==1)&&(hh==0))
            L(ir-1, ic-1)=startLabel;
            [L]  = findConnectedLabels8yonlu(L,startLabel,bwcur,ir-1,ic-1,m,n);
        end
        
end