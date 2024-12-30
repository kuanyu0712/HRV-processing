## 可以讀取原始PSG edf檔中的ECG channel訊號, 並且進一步做HRV分析
### Step:
1. 執行 extract_ECG_from_edf.m  可以把原始edf檔轉換成mat檔並且萃取出第十個ECG channel
  * InputDir是放原始edf file
  * OutputDir是放轉換完的mat檔
  * NewOutputDir是放萃取出的ECG channel的mat檔
  * 注意: 目前ECG channel在第10個位置(可直接在terminal下edfread('檔名.edf');去看ECG在哪一個channel)
3. 執行 checkIsECG.m 畫圖確定是否為ECG訊號
--------------- 到目前為止ECG訊號已萃取完畢------------------------
4. 在terminal下指令: addpath(genpath('.'))
5. 執行multipleHRV.m 可同執行InputDir路徑 file裡的多個檔案
6. 會出現對應檔名的file 裡面的 0000_HRV_results_allwindows_XXX.csv就是所要的HRV分析檔案

Backup: 
* edfread.m跟PSG_chun_fft 是為了分解edf檔
* PhysioNet-HRV-Tool套件是從下列github下載
https://github.com/cliffordlab/PhysioNet-Cardiovascular-Signal-Toolbox
重要檔案包含:
Main_HRV_Analysis
InitializeHRVparams
startup
mutipleHRV
* 有原始資料在pre資料夾
* edf2mat.m可以單純把edf檔轉成mat檔, 需搭配edfread.m
