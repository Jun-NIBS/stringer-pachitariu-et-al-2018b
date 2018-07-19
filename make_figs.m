% where data is stored (that you download from figshare)
dataroot = '/media/carsen/DATA2/grive/10krecordings/imgResp/';        
% where processed data and results are saved
matroot  = '/media/carsen/DATA2/grive/10krecordings/stimResults/';

%% makes fig1
fig1(dataroot, matroot);

%% makes fig2
fig2(dataroot, matroot);

%% makes fig3
fig3(dataroot, matroot);

%% makes fig4 (relies on saved structure from fig3 (matroot/alphas.mat)!)
fig4(matroot);

