clc
clear all
close all
% 4 point DFT using DIT-FFT method
x=input('Enter the sequence to compute 4-point DFT using DIT method:');
x=[x(1) x(3) x(2) x(4)];
N=length(x);
% Stage 1
for n= 1:2:3
f(n)= x(n)+x(n+1);
f(n+1)= x(n)-x(n+1);
end
f
% Stage 2
for n= 1:4:3
g(n)=f(n)+f(n+2);
g(n+1)=f(n+1)+f(n+3)*(-i);
g(n+2)= f(n)-f(n+2);
g(n+3) = f(n+1)-f(n+3)*(-i);
end
g
X=g;
X
%Magnitude Spectrum
m=abs(X);
k=0:N-1;
stem(k,m)
xlabel('Frequency Samples');
ylabel('Magnitude');
title('Magnitude Spectrum');
%Stability
%Since the Sum of sample is 10 which is finite, therefore the system is stable.
S=x(1)+x(2)+x(3)+x(4);
S
if(S>0)
disp('Since the Sum of sample is which is finite, therefore the system is stable.')
elseif(S<0)
disp('Since the Sum of sample is which is finite, therefore the system is stable.')
else
disp('THE SYSTEM IS UNSTABLE.')
end
%IDFT
for n=0:N-1
s=0;
for k=0:N-1
s=s+X(k+1)*exp(i*2*pi*k*n/N);
end
x(n+1)=s/N;
end
disp('h(n) after IDFT of H(k) is')
disp(x);
disp('HENCE H(k)=h(n)');