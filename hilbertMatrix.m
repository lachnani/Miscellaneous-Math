function [a,b] = hilbertMatrix(n)
%HILBERTMATRIX creates a Hilbert matrix of order n
%   outputs matrix, b vector
a = zeros(n,n);

for i = 1:n
    for j = 1:n
        a(i,j) = 1/(i+j-1);
    end
end
b = sum(a,2);

end

