run('startup.m')
dataPath = 'post_mat_channel10/02670973-EDF.mat';
fs = 200;

HRVparams = InitializeHRVparams('BSPHRV', '02670973-EDF');
HRVparams.Fs = fs;


ecg = load(dataPath);
ecg = ecg.channel10;
t = (1: length(ecg)) / fs;

[result, resFilename] = Main_HRV_Analysis(ecg, [],'ECGWaveform', HRVparams);