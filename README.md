# script to install all missing dependencies for mlr

```#script to install all missing dependencies for mlr
library(mlr)

#list all learners
learners <- listLearners()

#install uninstalled learners
un.learners <- subset(learners, installed=="FALSE")
un.learners <- unique(un.learners$package)

install.packages(un.learners)
```

# caretml_varimp_plot
Chart variable importance for a model using caret

![CaretVarImpImage](https://github.com/ericbrownaustin/images/blob/master/caret_var_imp.PNG)

```#bar chart of important features from a caret ml model

library(caret)
library(ggplot2)

#insert model for feature importance
vi <- varImp(model)

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
