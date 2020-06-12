%Load Data
load('oronsay.mat');
%Centeres the columns of particle size data on their means and normalizes
%to a standard deviation of 1.
mDataZ = zscore(mData);
%Calculates and displays in a plot a correlation matrix among the variables.
mcorrmatrix = corrcoef(mDataZ);
imagesc(mcorrmatrix), colormap(bone), caxis([-1,1])
title('Correlation Matrix')
axis square, colorbar, hold
xlabel({'Grain Size'},'HorizontalAlignment','right');
% Create ylabel
ylabel({'Grain Size'},'HorizontalAlignment','left');


%Calculate the pincipal components
[mPCS, mNewData, vVariances] = princomp(mDataZ);
%Percent varriation explained
vprecent_explained = 100*vVariances/sum(vVariances);

vMiddenEl = vBeachDune == 0;
vBeachEl = vBeachDune == 1;
vDuneEl = vBeachDune == 2;
vCCEl = vMidden ==1;
vCNGEl = vMidden ==2;

mMiddenData = mNewData(vMiddenEl,:);
mBeachDataCC = mNewData(vBeachEl & vCCEl,:);
mBeachDataCNG = mNewData(vBeachEl & vCNGEl,:);
mDuneDataCC = mNewData(vDuneEl & vCCEl, :);
mDuneDataCNG = mNewData(vDuneEl & vCNGEl, :);

figure
plot(mMiddenData(:,1), mMiddenData(:,2),'ro',...
    mBeachDataCC(:,1), mBeachDataCC(:,2),'bx',...
    mBeachDataCNG(:,1), mBeachDataCNG(:,2), 'kx',...
    mDuneDataCC(:,1), mDuneDataCC(:,2), 'bs',...
    mDuneDataCNG(:,1), mDuneDataCNG(:,2),'ks'); 
% Create xlabel
xlabel({'Principal Component 1'},'HorizontalAlignment','right');

% Create ylabel
ylabel({'Principal Component 2'},'HorizontalAlignment','left');

% Create legend
legend('Midden', 'Beach Data at CC', 'Beach Data at CNG', 'Dunes Data CC',...
    'Dune Data at CNG');

figure 
plot3 (mMiddenData(:,1), mMiddenData(:,2), mMiddenData(:,3),'ro',...
    mBeachDataCC(:,1), mBeachDataCC(:,2), mBeachDataCC(:,3), 'bx',...
    mBeachDataCNG(:,1), mBeachDataCNG(:,2), mBeachDataCNG(:,3), 'kx',...
    mDuneDataCC(:,1), mDuneDataCC(:,2), mDuneDataCC(:,3), 'bs',...
    mDuneDataCNG(:,1), mDuneDataCNG(:,2), mDuneDataCNG(:,3),'ks'); 
% Create xlabel
xlabel({'Principal Component 1'},'HorizontalAlignment','right');

% Create ylabel
ylabel({'Principal Component 2'},'HorizontalAlignment','left');

% Create zlabel
zlabel({'Principal Component 3'});

% Create legend
legend('Midden', 'Beach Data at CC', 'Beach Data at CNG', 'Dunes Data CC',...
    'Dune Data at CNG');
