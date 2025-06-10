function [funz,deriv] = E(W)
global U; global V;
global nU; global nV; global N;
%
V_CAP = W'*U;
delta = V_CAP - V;
delta2 = delta.^2;
funz = sum(delta2(:));
%
deriv = zeros(nU,nV);
%----DERIVATIVE---%
%if 1
    for i = 1:nU
        for j = 1:nV
            temp1 = U(i,:) .* V(j,:);
            temp1 = -2*sum(temp1);
            temp2 = W(:,j) .* U;
            temp2 = sum(temp2);
            temp2 = 2.* U(i,:) .*temp2;
            temp2 = sum(temp2);
            deriv(i,j) = deriv(i,j) + temp1 + temp2;
        end
    end
%else
%    deriv = 0;
%end
end
