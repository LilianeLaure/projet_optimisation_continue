function [ y ] = obj( c, x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(c);
y = 0;
for i=1:m
    for j=1:n
        y = y + c(i,j)*x(i,j);
    end
end
end

