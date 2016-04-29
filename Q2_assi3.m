% Comment on the observations: In all three cases we see a smoothening
% effect. Compared to the original image, the reconstructed image appears
% to have less sharp or less distinct differences between neighboring small
% blocks/squares. This is a consequence of lossy compression which is inherent in this method.

Q = [...
    16  11  10  16  24  40  51  61
    12  12  14  19  26  58  60  55
    14  13  16  24  40  57  69  56
    14  17  22  29  51  87  80  62
    18  22  37  56  68  109 103 77
    24  35  55  64  81  104 113 92
    49  64  78  87  103 121 120 101
    72  92  95  98  112 100 103 99];

im = imread('LAKE.TIF');
F = create_mat_dct(8);
w1 = im(420:420+7, 45:45+7);
subplot(3, 2, 1), imshow(w1);
w1_dct = myDCT(w1, F);
w1_dct_q = myDCT_quantization(w1_dct, Q, 2);
w1_dct_deq = myDCT_dequantization(w1_dct_q, Q, 2);
w1_rec = myIDCT(w1_dct_deq, F);
subplot(3, 2, 2), imshow(w1_rec);

w2 = im(427:427+7, 298:298+7);
subplot(3, 2, 3), imshow(w2);
w2_dct = myDCT(w2, F);
w2_dct_q = myDCT_quantization(w2_dct, Q, 2);
w2_dct_deq = myDCT_dequantization(w2_dct_q, Q, 2);
w2_rec = myIDCT(w2_dct_deq, F);
subplot(3, 2, 4), imshow(w2_rec);

w3 = im(30:30+7, 230:230+7);
subplot(3, 2, 5), imshow(w3);
w3_dct = myDCT(w3, F);
w3_dct_q = myDCT_quantization(w3_dct, Q, 2);
w3_dct_deq = myDCT_dequantization(w3_dct_q, Q, 2);
w3_rec = myIDCT(w3_dct_deq, F);
subplot(3, 2, 6), imshow(w3_rec);
