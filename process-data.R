library(xlsx)
library(dplyr)

df <- read.xlsx(file.path("Data", "raw", "Födelsedata SCB.xlsx"), sheetIndex = 1)

df[df == ".."] <- NA

numeric_from_factor <- function(x) {
  as.numeric(levels(x))[x]
}

df <- df %>% 
  mutate_at(
    vars(Dödfödda:Döda.under.första.levnadsdygnet.per.1.000.levande),
    funs(numeric_from_factor)
    )

write.csv(df, file.path('Data', 'processed', 'full-data.csv'))
