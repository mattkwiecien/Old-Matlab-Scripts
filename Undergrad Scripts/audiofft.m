function [  ] = audiofft( filename, in_rate )
% time bounds of file input
s1=66;
s2=70;

%reading in audio data
[y, rate]=audioread(filename, [s1 s2]*44100 + 1 );
f_y = fft(y);

[N, ~]= size(f_y);
filt_fy=zeros(N,2);
v_k = [-20e3:(1/44100):20e3]

for i=1:1:N
    if f_y(i,1) > in_rate
        filt_fy(i,1)=0;
    else
        filt_fy(i,1)=f_y(i,1);
    end
    
    if f_y(i,2) > in_rate
        filt_fy(i,2) = 0;
    else
        filt_fy(i,2) = f_y(i,2);
    end
end

new_y = ifft(filt_fy);

%plotting the fft of the audio file
hz_arr = linspace(-20e3,20e3,length(f_y));
plot( hz_arr , fftshift(abs(f_y).^2))
figure
plot( hz_arr, fftshift(abs(filt_fy).^2))
% figure
% plot( hz_arr, real(y),'r')
% ylim([-1 1])
% figure
% plot( hz_arr, real(new_y), 'b')
% ylim([-1 1])
sound(real(new_y),44100)



end

