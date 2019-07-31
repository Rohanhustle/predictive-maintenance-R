df <- read.csv("Predictive maintenance.csv")
library(caTools)
library(plotly)
set.seed(101)
sample <- sample.split(df,SplitRatio = 0.7)
train <- subset(df,sample==TRUE)
test <- subset(df,sample==FALSE)
model <- lm(Vibrational.Parameters ~ .-FlowP-PressureP-FlowAP-PressureAP,singular.ok =TRUE,data=train)
print(summary(model))
library(ggplot2)
library(ggthemes)
pl2 <- ggplot(df,aes(VibAP,Vibrational.Parameters))+geom_point(aes(color=factor(Days)),alpha=0.4,size=4)+geom_smooth(aes(group=1),method ='lm',formula = y~x,se=FALSE,color='red')+theme_calc()
pl3 <- ggplotly(pl2)
print(pl3)
res <- residuals(model)
res <- as.data.frame(res)
#pl <- ggplot(res,aes(res)) + geom_histogram(fill ='blue',alpha=0.5,bins=10)
#print(pl)
NH.predictions <- predict(model,test)
results <- cbind(NH.predictions,test$Vibrational.Parameters)
colnames(results) <- c('predicted','Actual')
results <- as.data.frame(results)
print(head(results))

to_zero <- function(x){
  if(x<0){
    return(0)
  }else{
    return(x)
  }
}
results$predicted <- sapply(results$predicted,to_zero)

gl <- predict(object = model,newdata = subset(df,Days >20))
gl <- cbind(gl)
colnames(gl) <- c(' New Days Predicted values')
print(gl)

##Mean squared error
#mse <- mean((results$actual- results$predicted)^2)
#print('Mean Squared Error')
#print(mse)

#RMSE
#print('Root Mean square Error')
#print(mse^0.5)

#SSE - Sum of Squared errors
#SSE <- sum ( ( results$predicted - results$actual)^2)
#SST <- sum( ( mean(df$Vibrational.Parameters)- results$actual)^2)

#R2 <- 1 - SSE/SST
#print('R2')
#print(R2)
