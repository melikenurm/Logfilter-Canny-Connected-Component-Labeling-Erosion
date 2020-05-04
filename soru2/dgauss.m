% 1-boyutlu gauss fonksiyonun birinci türevi
function y = dgauss(x,std)
y = -x * gauss(x,std) / std^2;