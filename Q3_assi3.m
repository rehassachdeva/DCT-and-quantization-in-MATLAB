% Comment: The image is mostly black. As quantization makes most entries of
% 8X8 block become zero. In compression we prefer to have as many zeros as possible so that it is easy to store. With increasing value of c, the image becomes even
% more black. 

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
        res = myDCT_quantization(myDCT(temp, F), Q, c);
        for k = 1:8
            for l = 1:8
                rec_img(i+k, j+l) = res(k, l);
            end
        end     
    end
end
imshow(rec_img);
