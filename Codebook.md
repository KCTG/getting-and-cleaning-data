# CODEBOOK

## Analysis File

Variables:

| Variable Name        | Description        |
| -------------------- |:------------------ | 
| subjtrain            | subject train data |
| subjtest             | subject test data  |
| xtest                | X_test data        |
| xtrain               | X_train data       |
| ytest                | Y_test data        |
| ytrain               | Y_train data       |
| feat                 | X test data column names |
| testD                | merged (`cbind`) test (subjtest, xtest, ytest) data |
| trainD               | merged (`cbind`) train (subjtrain, xtrain, ytrain) data |
| mergeD               | merged (`rbind`) test and train data |
| mdata                | reshaped data, by Subject and Activity |
| meanstd              | extracted only measures (mean) on means and standard deviation (std) |
| subact_means         | reshaped data, Averaged by Subject and Activity |
| ndata                | data generated from subact_means with descriptive activity names - walking, laying, sitting, standing, walking downstairs, walking upstairs | 
