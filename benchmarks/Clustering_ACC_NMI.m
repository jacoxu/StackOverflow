clear; clc;
dataset='StackOverflow';
dataStr=['./../matlab_format/',dataset,'.mat'];
load(dataStr);
randinit4KMeans=0;
repeatNum=1;
nbcluster=20;
disp('step 1 random the dataset with 0.8 as training texts and 0.2 as test texts ...')
fea=tf_idf(fea);
fea = normalize(fea);
index_sub = 1;
tic
for i=1:repeatNum
    rand('state',randinit4KMeans)
    randn('state',randinit4KMeans)
    disp(['state randinit4KMeans:',num2str(randinit4KMeans)]);
    randinit4KMeans = randinit4KMeans+1;
    res = kmeans(fea, nbcluster);
    res = bestMap(gnd,res);
    %=============  evaluate AC: accuracy ==============
    AC = length(find(gnd == res))/length(gnd)*100
    %=============  evaluate MIhat: nomalized mutual information =================
    MIhat = MutualInfo(gnd,res)*100
    evaluteScore(index_sub,1)=AC;
    evaluteScore(index_sub,2)=MIhat;
    index_sub=index_sub+1;
end
toc
disp(['Accuracy is ',num2str(sum(evaluteScore(:,1))/(index_sub-1))])
disp(['NMI is ',num2str(sum(evaluteScore(:,2))/(index_sub-1))])