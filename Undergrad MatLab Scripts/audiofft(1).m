function [  ] = audiofft( filename, in_rate )
% time bounds of file input
s1=66;
s2=70;

%reading in audio data
[y, rate]=audioread(filename, [s1 s2]*44100 + 1 );
f_y = fft(y);
f_y(f_y>in_rate)=0;
if_y = ifft(f_y);
f_if_y = fft(if_y);

%plotting the fft of the audio file
hz_arr = linspace(-20e3,20e3,length(f_y));
%plot( hz_arr , abs(fftshift(f_y)).^2)
figure
plot( hz_arr, real(y),'r')
ylim([-1 1])
figure
plot( hz_arr, real(if_y), 'b')
ylim([-1 1])
sound(real(if_y),44100)



end

