Short text dataset for classification and clustering extracted from StackOverflow  
=================================  
Note that:  
---------------------------------
1. If you use this short text dataset, please cite our paper:  
**[1]. 2015NAACL [VSM-NLP workshop](http://naacl15vs.github.io/index.html)-"Short Text Clustering via Convolutional Neural Networks"**  
and acknowledge Kaggle for making the datasets available.  
2. We do not remove any stop words or symbols in the text;  
3. If you run the Classification ACC.m, please run it on 64-bit machine;  
4. Classification is fast, while Clustering is very slow via KMeans on so high-dimensionality text features, about 2 hours once. If you want to run clustering via KMeans, please have a little patience, and we strongly suggest that you directly refer the KMeans results in our paper [1] which reports the average results by running KMeans 500 times;  
5. Please feel free to send me emails (*jacoxu@msn.com*) if you have any problems in using this package.

./rawText: Raw text, 20,000 titles as short texts  
　　-- label_StackOverflow.txt: Each title plus a tag/label at the end;  
　　-- title_StackOverflow.txt: Each title on each line;  
　　-- vocab_emb_Word2vec_48.vec: Word2vec trained from a large corpus of StackOverflow dataset;  
　　-- vocab_emb_Word2vec_48_index.dic: Word2vec index list corresponds with vocab_withIdx.dic;  
　　-- vocab_withIdx.dic: Vocabulary index.  


./matlab_format: Matlab format of rawText  
　　-- StackOverflow.mat: fea is vsm model, and gnd is the label index.  
  
./benchmarks: Contains some benchmarks, such as classfication and clustering  
　　-- Classification_ACC.m: Test the classification performance with TF-IDF+SVM, and the ACC is 81.55%  
　　-- predict.mexw64: LibSVM libraries;  
　　-- svmpredict.mexw64  
　　-- svmtrain.mexw64  
　　-- train.mexw64  
　　-- tf_idf.m: Compute TF-IDF;  
　　-- Clustering_ACC_NMI.m: Test the clustering performance with TF-IDF+KMeans, and the ACC is 20.31% and NMI is 15.64% by 500 runs;  
　　-- normalize.m: normalize the feature vectors;  
　　-- bestMap.m: Permutation mapping function maps each cluster label to the equivalent label from the text data;  
　　-- MutualInfo.m: Compute normalized mutual information metric;  
  
20 different labels:  
　　1	wordpress  
　　2	oracle  
　　3	svn  
　　4	apache  
　　5	excel  
　　6	matlab  
　　7	visual-studio    
　　8	cocoa  
　　9 osx  
　　10	bash  
　　11	spring  
　　12	hibernate  
　　13	scala  
　　14	sharepoint  
　　15	ajax  
　　16	qt  
　　17	drupal  
　　18	linq  
　　19	haskell  
　　20	magento