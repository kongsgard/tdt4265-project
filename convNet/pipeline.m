% % -----CONVERTING THE DATA TO THE CORRECT FORMAT-----
% 
% loadFolder = 'C:\Users\Krist\Desktop\GTSRB\Final_Training\Images';
% saveFolder = 'C:\Users\Krist\Desktop\preprocessed\';
% wantedFolders = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; % Determines which classes we load.
% loadAndPreprocessData(saveFolder, loadFolder, wantedFolders);

% -----LOADING THE IMDS-----

loadFolder = 'C:\Users\Krist\Desktop\preprocessed\';
imds = setUpImds(loadFolder); % Husk � g� inn og endre p� categories.
[testSet, trainingSet] = splitEachLabel(imds, 0.3, 'randomize');

% -----LOADING ALEXNET, MODIFYING IT TO FIT THE DATA AND TRAIN IT-----

net = transferLearning(trainingSet);

% -----TEST THE ACCURACY OF THE NET-----

accuracy = checkAccuracy(testSet, net);

% -----DETECT IN IMAGE-----

img = imread('50grense.jpg');
activationMap = detectInImage(img, 70, 2, net);