% Comment. Higher the c, higher the distortions perceptible. For c = 4,
% distortions in the form of large continuous blocks of same color, in many
% parts of the image, are clearly visible. For c = 3, the distortions are
% just perceptible. For 1 < c < 3, distortions are hardly perceptible (< 1
% percent). For c = 1, no distortion is perceptible. 
% For c = 5, entropy = 6.7441, RMSE = 5.9443
% For c = 4, entropy = 6.9665, RMSE = 5.6049
% For c = 3, entropy = 7.1912, RMSE = 5.2511
% For c = 2, entropy = 7.3681, RMSE = 4.8371
% For c = 1, entropy = 7.4585, RMSE = 4.1054
% For c = 10, entropy = 5.8670, RMSE = 6.9533
% For c = 10, image is almost completely distorted.
% We observe that with increasing value of c, entropy decreases and RMSE
% increases like it should be, as greater distortion is there so greater
% RMSE, and lesser entropy.

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
c = 2;
F = create_mat_dct(8);
h = size(im, 1);
w = size(im, 2);
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
imshow(rec_img);
My_entropy(rec_img)
RMSE(im, rec_img)
