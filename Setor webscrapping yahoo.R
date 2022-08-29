install.packages("rvest")
library(rvest)

dados_ibov <- read_excel("C:/Users/pedro.poliseli/Downloads/IBOVDia.xlsx",
                         skip = 1)[,c(1,5)]
colnames(dados_ibov)<- c("Codigo", "Peso")

dados_ibov$`Codigo com SA`<- paste0(dados_ibov$Codigo, ".SA")



getSector.Ind <- function(x)
  {
  Sys.sleep(2)
  url = paste0("https://finance.yahoo.com/quote/",x,"/profile?p=",x)
  a <- suppressWarnings(read_html(url))
  industry <- a %>% html_nodes("div p span") %>% .[4] %>% html_text()
  sector <-a %>% html_nodes("div p span") %>% .[2] %>% html_text()
  industry <- as.data.frame(industry)
  sector <- as.data.frame(sector)
  tic <- as.data.frame(x)
  colnames("Ticker")
  cbind(tic, sector, industry)
}


tickers <- dados_ibov$`Codigo com SA`



ALL <- lapply(as.list(tickers), function(x)
{
  tmp <- try(getSector.Ind(x))
  if(!inherits(tmp, "try-error"))
    tmp
})

ALL <- ALL[lapply(ALL, length)>0]

ALL <- do.call(rbind, ALL)

View(ALL)

write.xlsx()


