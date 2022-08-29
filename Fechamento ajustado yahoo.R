library(quantmod)
library(rugarch)
library(dplyr)



fun_get.adj.price <- function(tickers, date.initial, date.final){
  library(quantmod)
  library(xts)
  rm(preco_ativos, preco_ativo)
  preco_ativos <- xts()
  for (i in 1:length(tickers)){
    preco_ativo <- getSymbols(tickers[i], auto.assign = F, from = date.initial, to = date.final)[,6]
    preco_ativos <- merge(preco_ativo, preco_ativos)
  }
  return(preco_ativos)
  
}




fun_get.adj.price(ticker, "2020-01-01", "2022-08-26")



