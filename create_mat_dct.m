function [ans] = create_mat_dct(N)

ans = zeros(N, N);

r1 = sqrt(1/N);
r2 = sqrt(2/N);

for i = 0:N-1
    if i == 0
        r = r1;
    else
        r = r2;
    end
    for j = 0:N-1
        ans(i+1, j+1) = r*cos((pi*(2*j+1)*i)/(2*N));
    end
end
end
    

