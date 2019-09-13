

close all; clear all;

% read sound 
[data, fs] = audioread('bellybreathing.m4a');
% normalize data
data = data / abs(max(data));
% do framing
f_d = 0.025;
f_size = round(f_d * fs);
n = length(data);
n_f = floor(n/f_size);  %no. of frames
temp = 0;
t = linspace(0,60,length(data));
[b,a]=butter(3,[500,4000]/(fs),'bandpass');
filtsig=filter(b,a,data);
figure(5);
plot(t,data)
title('Original Signal')
figure(1);
plot(t,filtsig)
title('Signal after Band pass filter');
for i = 1 : n_f
    
   frames(i,:) = filtsig(temp + 1 : temp + f_size);
   temp = temp + f_size;
end
m_amp = abs(max(frames,[],2)); % find maximum of each frame
id = find(m_amp > 0.001); % finding ID of frames with max amp > 0.03
fr_ws = frames(id,:); % frames without silence

% reconstruct signal
data_r = reshape(fr_ws',1,[]);
t = linspace(0,60,length(data_r));
figure(2);
plot(t,data_r); 
title('Silence removed signal')
 param_small = {'Color',[0.9 0.4 0.1],'Linewidth',2};
param_large = {'Color',[0 0.4 0],'Linewidth',2};
figure(3);
fl1=70000;xaa
t4 = linspace(0,60,length(data_r));
[up4,lo4] = envelope(data_r,fl1,'rms');
p4 = plot(t4,up4,param_large{:});

plot(t4,up4,param_small{:});
title('RMS envelope');
a=findpeaks(up4,'MinPeakDistance',140000 )
a=find(a>0.02)
figure(4);
findpeaks(up4,'MinPeakDistance',130000 )
title('Counting Peak')
F = fft(data); 
power = F.*conj(F);

