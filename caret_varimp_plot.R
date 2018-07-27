library(caret)
library(ggplot2)

#insert model for feature importance
vi <- varImp(bam.mets)

#transform and order data frame
vi2 <- data.frame(vi$importance)

vi2 <- cbind(vars = as.character(row.names(vi2)), data.frame(vi2, row.names = NULL))

vi2 <- data.frame(vi2[order(-vi2$Overall),])


#Top 20 variables
ggplot(head(vi2,20), aes(x = reorder(vars, Overall), y=Overall)) + 
  geom_bar(stat = 'identity') +
  coord_flip()
  
#all variables
ggplot(vi2, aes(x = reorder(vars, Overall), y=Overall)) + 
  geom_bar(stat = 'identity') +
  coord_flip()
       
