library(mxnet)

tweets = read.csv(file = "C:/Users/param/Desktop/ADS/finalProject/sparseInput.csv", sep = ",")[2:3501,2:4580]

labels = read.csv(file = "C:/Users/param/Desktop/ADS/finalProject/sparseInput.csv", sep = ",")[2:3501,4582]

train.x = data.matrix(tweets[2:3000,])
train.y = labels[2:3000]
test.x = data.matrix(tweets[3001:3501,])
test.y = labels[3001:3501]

data <- mx.symbol.Variable("data")
fc1 <- mx.symbol.FullyConnected(data, num_hidden=1)
lro <- mx.symbol.LinearRegressionOutput(fc1)

mx.model.FeedForward.create:
  
mx.set.seed(0)
model <- mx.model.FeedForward.create(lro, X=train.x, y=train.y,
                                     ctx=mx.cpu(), num.round=50, array.batch.size=20,
                                     learning.rate=2e-6, momentum=0.9, eval.metric=mx.metric.rmse)

preds = predict(model, test.x)
pred.label = round(preds*10,3)-0.125
pred.label[pred.label==0]=0
pred.label[pred.label>0]=1
pred.label[pred.label<0]=-1
table(pred.label, test.y)
