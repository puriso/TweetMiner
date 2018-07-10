library(RMeCab)
library(ggplot2)

# 解析
mecabed<-RMeCabFreq("./tweets.txt")

# 動詞と頻度が2つ以上のデータを抽出
#http://www.ic.daito.ac.jp/~mizutani/mining/rmecabfreq.html
doushi <- mecabed[mecabed[,2]=="副詞" & mecabed[,4] > 1,]

# 昇順にして逆にする(降順)
doushi[rev(order(doushi$Freq)),]

doushiData <- data.frame(word=as.character(doushi[,1]), freq=doushi[,4])
doushiData <- subset(doushiData, rank(-freq)<50)

# グラフ化
ggplot(doushiData, aes(x=reorder(word,freq), y=freq)) +
  geom_bar(stat = "identity", fill="grey") +
  theme_bw(base_size = 10, base_family = "HiraKakuProN-W3") +
  coord_flip()

str(doushiData)

