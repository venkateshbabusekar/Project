require(mlbench)
require(mxnet)

tweets = read.csv(file = "C:/Users/param/Desktop/ADS/finalProject/sparseInput.csv", sep = ",")[2:3501,2:4580]

labels = read.csv(file = "C:/Users/param/Desktop/ADS/finalProject/sparseInput.csv", sep = ",")[2:3501,4582]

train.x = data.matrix(tweets[2:3000,])
train.y = labels[2:3000]
test.x = data.matrix(tweets[3001:3501,])
test.y = labels[3001:3501]

mx.set.seed(0)
model <- mx.mlp(train.x, train.y, hidden_node=25, out_node=2, out_activation="softmax",
                num.round=20, array.batch.size=50, learning.rate=2e-6, momentum=0.9, 
                eval.metric=mx.metric.rmse)

preds = predict(model, test.x)
pred.label = round(t(preds[1,])+t(preds[2,]),7)
pred.label[pred.label==1]=1
pred.label[pred.label==1.0000001]=0
pred.label[pred.label==0.9999999]=-1
table(pred.label, test.y)
