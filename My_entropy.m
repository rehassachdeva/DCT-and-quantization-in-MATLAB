function [ans] = My_entropy(im)
p = imhist(im);
q = prod(size(im));
p = p/q;
ans = -sum(p.*log2(p+1e-08));
end
