library(twitteR)
library(RMeCab)

# TWITTER API
consumerKey<-""
consumerSecret<-""
accessToken<-""
accessSecret<-""
options(httr_oauth_cache = TRUE)
setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessSecret)

tweets<-searchTwitter(" INPUT TEXT!  ",n = 2000) # APIにて取得
tweets<-twListToDF(tweets) # データフレーム化
tweets<-tweets$text #テキストに変換
write.table(tweets,"./tweets.txt") #テキストファイル化
