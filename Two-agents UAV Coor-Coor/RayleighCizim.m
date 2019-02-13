samplingDuration=1; % Seconds
samplingRate=20*10^3; % Sampling Rate
numberofSamples=round(samplingRate*samplingDuration);
uavSpeed = 1.38889; % meters / second
CarrierFrequency=900*10^6; % 900 MHz - Not BW!
speedofLight=3*10^8; % in m/s
maxDopplerShift = uavSpeed*CarrierFrequency/speedofLight; % Maximum Doppler Shift
c = rayleighchan(1/samplingRate,maxDopplerShift); % Generate Channel
sig = 1i*ones(numberofSamples,1);  % Generate signal
RC   = (20*log10(abs(filter(c,sig))));
subplot(3,1,1);
plot(linspace(0,samplingDuration,numberofSamples),RC)
ylim([-40 20]);
xlabel('Time (s) [UAV Speed: 5 kmh]')

numberofSamples=round(samplingRate*samplingDuration);
uavSpeed = 1.38889*2; % meters / second
CarrierFrequency=900*10^6; % 900 MHz - Not BW!
speedofLight=3*10^8; % in m/s
maxDopplerShift = uavSpeed*CarrierFrequency/speedofLight; % Maximum Doppler Shift
c = rayleighchan(1/samplingRate,maxDopplerShift); % Generate Channel
sig = 1i*ones(numberofSamples,1);  % Generate signal
RC   = (20*log10(abs(filter(c,sig))));
subplot(3,1,2);
plot(linspace(0,samplingDuration,numberofSamples),RC)
ylim([-40 20]);
xlabel('Time (s) [UAV Speed: 10 kmh]')
ylabel('Variation on  RSS due to Rayleigh Fading (dB)')

numberofSamples=round(samplingRate*samplingDuration);
uavSpeed = 1.38889*3; % meters / second
CarrierFrequency=900*10^6; % 900 MHz - Not BW!
speedofLight=3*10^8; % in m/s
maxDopplerShift = uavSpeed*CarrierFrequency/speedofLight; % Maximum Doppler Shift
c = rayleighchan(1/samplingRate,maxDopplerShift); % Generate Channel
sig = 1i*ones(numberofSamples,1);  % Generate signal
RC   = (20*log10(abs(filter(c,sig))));
subplot(3,1,3);
plot(linspace(0,samplingDuration,numberofSamples),RC)
ylim([-40 20]);
xlabel('Time (s) [UAV Speed: 15 kmh]')
