load handel.mat;


[y, Fs] = audioread('D:\Padhai\Matlab\test1.mp3');
 x =y + awgn(y,60);
audiowrite('noisy1.wav',x, Fs);
time=(1/44100)*length(y);
t=linspace(0,time,length(y));
y2=flipud(y);
%subplot(211)
%plot(t,y)

y3 = y;
y5 = [];
N = 30000;
z = length(y)
for n = N+1:length(y)
    y3(n) = y(n) + y(n-N);
end

y4 = y;
for n=2:length(y)
    y4(n,1)=0.1*y4(n-1,1)+y(n,1);
end

k=1;
for i = 1:z
    if (y(i)>0.007 || y(i)<-0.007)
        y5(k) = y(i);
        k=k+1;
    end
end
%subplot(212);
%stem(y5)


f = fft(y5);
subplot(211)
stem(y5)
f1=f;
c = length(y5)
for i = 1:c
    f1(i) = 0.01*f(i);
end

y6 = ifft(f1);
subplot(212)
stem(y6)
soundsc(y3,44100)
   
        
