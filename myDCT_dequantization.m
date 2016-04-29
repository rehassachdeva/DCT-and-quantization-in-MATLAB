function [ans] = myDCT_dequantization(imqDCT,qm,c)
ans = (imqDCT.*qm)*c;
end