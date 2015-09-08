function [trainX] = tf_idf(trainTF)
% TF-IDF weighting
% ([1+log(tf)]*log[N/df])
%% 剔除TF=0特征
% %抽取输入VSM向量空间模型的维数，即得到文档数和term数
% [n,m] = size(trainTF);  % the number of (training) documents and terms
% %统计训练数据VSM中Term的文档频次
% df = sum(trainTF>0);  % (training) document frequency
% %只抽取Term频次大于0的数据，即过滤训练文档中从未出现过的词
% d = sum(df>0); % the number of dimensions, i.e., terms occurred in (training) documents
% %对文档频次df进行列排序，得到排序后的结果dfY和序列号次序dfI
% [dfY, dfI] = sort(df, 2, 'descend');
% %从训练集的VSM中过滤掉未出现词
% trainTF = trainTF(:,dfI(1:d));
% %计算Term的idf向量
% idf = log(n./dfY(1:d));
% %生成IDF稀疏矩阵，用于后面的矩阵运算
% IDF = sparse(1:d,1:d,idf);
% %从训练集VSM中找出非零元素，分别为，行号，列号和元素值
% [trainI,trainJ,trainV] = find(trainTF);
% %计算了训练数据集TF-IDF前半段后，生成稀疏矩阵
% trainLogTF = sparse(trainI,trainJ,1+log(trainV),size(trainTF,1),size(trainTF,2));
% %生成完整的TF-IDF矩阵
% trainX = trainLogTF*IDF;

%% 不剔除TF=0特征
%抽取输入VSM向量空间模型的维数，即得到文档数和term数
[n,m] = size(trainTF);  % the number of (training) documents and terms
%统计训练数据VSM中Term的文档频次
df = sum(trainTF>0);  % (training) document frequency
% %只抽取Term频次大于0的数据，即过滤训练文档中从未出现过的词
% d = sum(df>0); % the number of dimensions, i.e., terms occurred in (training) documents
% %对文档频次df进行列排序，得到排序后的结果dfY和序列号次序dfI
% [dfY, dfI] = sort(df, 2, 'descend');
% %从训练集的VSM中过滤掉未出现词
% trainTF = trainTF(:,dfI(1:d));
%计算Term的idf向量
idf = log(n./df);
%生成IDF稀疏矩阵，用于后面的矩阵运算
IDF = sparse(1:m,1:m,idf);
%从训练集VSM中找出非零元素，分别为，行号，列号和元素值
[trainI,trainJ,trainV] = find(trainTF);
%计算了训练数据集TF-IDF前半段后，生成稀疏矩阵
trainLogTF = sparse(trainI,trainJ,1+log(trainV),size(trainTF,1),size(trainTF,2));
%生成完整的TF-IDF矩阵
trainX = trainLogTF*IDF;
end
