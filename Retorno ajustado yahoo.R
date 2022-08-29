library(quantmod)
library(rugarch)
library(dplyr)
library(TTR)


fun_get.adj.return <- function(tickers, date.initial, date.final){
  library(quantmod)
  library(xts)
  library(TTR)
  rm(preco_ativos, preco_ativo)
  preco_ativos <- xts()
  for (i in 1:length(tickers)){
    preco_ativo <- getSymbols(tickers[i], auto.assign = F, from = date.initial, to = date.final)[,6]
    preco_ativos <- merge(preco_ativo, preco_ativos)
  }
  retornos <- ROC(preco_ativos)
  return(retornos)
}




retornos <- fun_get.adj.price(ticker, "2020-01-01", "2022-08-26")



