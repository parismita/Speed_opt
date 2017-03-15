# Constrained Hierarchical Agglomerative Clustering

## Easy test 
The implemented and the given dataset both clusters are obtained using rioja, It had been seen that for non-euclidian dataset it doesn't give expected outcome.

The code can be found inside folder rioja_easy. 
The pdf stating all details can be found here:

## Medium test 
Function chaclust takes similarity matrix, ncol and width as input and a boolean(f=0) to give hclust object as output. For f = 0 it gives HeapHop function's output converted to hclust object, for f= 1 it give adjClustBand_heap function's output.
The comparision is being made of rioja chclust and HeapHop functions outcome. 

The Similarity Matrix formation, the Function and comparision with rioja can be found inside folder HeapHop. 
The pdf stating all details can be found here:

## Hard test 
The function HeapHop in the package adjclust is modified from ward's criterion to single linkage criterion giving single linkage clustering of time complexity O(N^2)

The function descriptions and the edited files are inside the folder cpp_code. 
The pdf stating all details can be found here: 
