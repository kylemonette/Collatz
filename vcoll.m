function [v] = vcoll(n)
idx = 1;
while n ~= 1
   if (mod(n,2) ~= 0)
       n = 3*n +1;
   else
       n = n/2;
   end
   v(idx) = n;
   idx = idx +1;
end
end

