% Entropy on y axis, rmse on x axis. Entropy and rmse follow inverse
% relationship.
im = imread('LAKE.TIF');
Q = [...
    16  11  10  16  24  40  51  61
    12  12  14  19  26  58  60  55
    14  13  16  24  40  57  69  56
    14  17  22  29  51  87  80  62
    18  22  37  56  68  109 103 77
    24  35  55  64  81  104 113 92
    49  64  78  87  103 121 120 101
    72  92  95  98  112 100 103 99];
F = create_mat_dct(8);
h = size(im, 1);
w = size(im, 2);
n = 10;
entropies = zeros(1, n);
rmses = zeros(1, n);
for c = 1:n
    rec_img = uint8(zeros(h, w));
    for i = 1:8:h
        for j = 1:8:w
            temp = im(i:i+7, j:j+7);
            res = myIDCT(myDCT_dequantization(myDCT_quantization(myDCT(temp, F), Q, c), Q, c), F);
            for k = 1:8
                for l = 1:8
                    rec_img(i+k-1, j+l-1) = res(k, l);
                end
            end
        end
    end
    entropies(c) = My_entropy(rec_img);
    rmses(c) = RMSE(im, rec_img);
end
plot(entropies, rmses);
