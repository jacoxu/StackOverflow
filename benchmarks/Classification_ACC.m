clear; clc;
dataset='StackOverflow';
dataStr=['./../matlab_format/',dataset,'.mat'];
load(dataStr);
parameters.testRate=0.2;
rand('state',0)
randn('state',0)
permut = randperm(size(fea,1));
testSize = ceil(length(permut)*parameters.testRate);
disp('step 1 random the dataset with 0.8 as training texts and 0.2 as test texts ...')
fea=tf_idf(fea);
test = fea(permut(1:testSize),:);
train = fea;
train(permut(1:testSize),:) = [];

testGnd = gnd(permut(1:testSize));
trainGnd = gnd;
trainGnd(permut(1:testSize)) = [];
disp('step 2 train model ...')
model = svmtrain(trainGnd, train, '-t 0');
disp('step 3 predict test data ...')
[predict_label, accuracy, prob_estimates] = svmpredict(testGnd, test, model);
AC = length(find(predict_label == testGnd))/length(testGnd)*100;
disp(['Accuracy is ',num2str(accuracy(1))])
disp(['Accuracy is ',num2str(AC)])