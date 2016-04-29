function [ans] = myDCT(im, F)
N = 8;
im = double(im)/256.0;
ans = zeros(N, N);
for i = 0:N-1
    for j = 0:N-1
        for v = 0:N-1
            for u = 0:N-1
                ans(i+1, j+1) = ans(i+1, j+1) + F(i+1, v+1)*F(j+1, u+1)*im(v+1, u+1);
            end
        end
        ans(i+1, j+1) = ans(i+1, j+1)*256;
    end
end
end