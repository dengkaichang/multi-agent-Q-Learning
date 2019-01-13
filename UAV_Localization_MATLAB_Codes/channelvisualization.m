
sampleTime = 1/10000; % Sample time (s)
maxDopplerShift = 35; % Maximum Doppler shift of diffuse components (Hz)
delayVector = 1.0e-004 * [0 0.0400 0.0800 0.1200]; % Discrete delays of
 % four-path channel (s)
gainVector = [0 -3 -6 -9]; % Average path gains (dB)
specDopplerShift = 100; % Doppler shift of specular component (Hz)
KFactor = 100; % Linear ratio of specular power to diffuse power
% Create Rayleigh channel object
rayChanObj = rayleighchan(sampleTime, maxDopplerShift, delayVector,...
 gainVector) ;
rayChanObj.StoreHistory = 1; % Store channel state information as signal is
 % processed for later visualization
% Create Rician channel object
ricChanObj = ricianchan(sampleTime, maxDopplerShift, KFactor, ...
 delayVector, gainVector, specDopplerShift);
ricChanObj.StoreHistory = 1; % Store channel state information as signal is
 % processed for later visualization
hMod = comm.QPSKModulator('BitInput', true, 'PhaseOffset',pi/4);
% Number of bits transmitted per frame is set to be 1000. For QPSK
% modulation, this corresponds to 500 symbols per frame.
bitsPerFrame = sampleTime*10^7;
msg = randi([0 1],bitsPerFrame,1);
% Modulate data for transmission over channel
modSignal = step(hMod, msg);
% Apply channel object on the modulated data using the FILTER function
filter(rayChanObj,modSignal);
filter(ricChanObj, modSignal);
channel_vis(rayChanObj, 'Visualization', 'ir'); % View Impulse Response
channel_vis(rayChanObj, 'Animation', 'medium'); % Set animation speed
channel_vis(rayChanObj, 'SampleIndex', 1); % Set animation start point
% Note: In this plot, the gains do not equal the average path gains because
% the Doppler effect causes the gains to fluctuate around their average
% values over time
