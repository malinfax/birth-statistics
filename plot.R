library(ggplot2)

theme_set(theme_minimal())

df <- read.csv(file.path("Data", "processed", "full-data.csv"))

#Levande födda per år, uppdelat på kön
p1 <- ggplot(df, aes(x = år, y = Levande.födda, col = kön))
p1 <- p1 + geom_line(alpha = 0.5)
p1

#Döda under första levnadsåret per år, per kön
p2 <- ggplot(df, aes(x = år, y = Döda.under.första.levnadsåret, col = kön))
p2 <- p2 + geom_line(alpha = 0.5)
p2

p3 <- ggplot(df, aes(x = år, y = Döda.under.första.levnadsåret, col = kön, size = Levande.födda))
p3 <- p3 + geom_point(alpha = 0.4)
p3

p4 <- ggplot(df, aes(x = år, y = Levande.födda, col = kön, size = Döda.under.första.levnadsåret.per.1.000.levande.födda))
p4 <- p4 + geom_point(alpha = 0.6)
p4 <- p4 + geom_line(alpha = 0.2)
p4 <- p4 + scale_y_continuous(name = "Levande födda", limits = c(0, 150000), breaks = seq(0, 200000, by=20000), labels = scales::comma)
p4 <- p4 + scale_x_continuous(name = "År", breaks = seq(1750, 2015, by=25))
p4 <- p4 + theme(legend.position = "top")
p4 <- p4 + labs(col = "Kön", size = "Döda under första levnadsåret per 1000 levande födda")
p4

library(gganimate)
library(scales)
p5 <- ggplot(df2, aes(x = Levande.fodda, y = Doda.under.forsta.levnadsaret, col = kon, frame = ar)) 
p5 <- p5 + geom_path(aes(group = kon, cumulative = TRUE), alpha = 0.5)
p5 <- p5 + geom_point()
p5 <- p5 + scale_x_continuous(name = "Levande födda", limits = c(0, 150000), breaks = seq(0, 200000, by = 20000), labels = scales::comma) 
p5 <- p5 + scale_y_continuous(name = "Döda under första levnadsåret", breaks = seq(0, 25000, by = 5000), labels = scales::comma)
p5 <- p5 + labs(title = "Statistik över levande födslar och dödsfall under första levnadsåret i Sverige, 1751 -- 2016 \n")
p5 <- p5 + scale_color_manual(name = "Kön", labels = c("Totalt", "Flickor", "Pojkar"), values = c("purple", "red", "blue"))
gganimate(p5, ani.width = 800, ani.height = 800, interval = 0.2)

p6 <- ggplot(df2, aes(x = Levande.fodda, y = Doda.under.forsta.levnadsaret, col = kon, frame = ar)) 
p6 <- p6 + geom_path(aes(group = kon, cumulative = TRUE), alpha = 0.5)
p6 <- p6 + geom_point()
#p6 <- p6 + scale_x_continuous(name = "Levande födda", limits = c(0, 150000), breaks = seq(0, 200000, by = 20000), labels = scales::comma) 
#p6 <- p6 + scale_y_continuous(name = "Döda under första levnadsåret", breaks = seq(0, 25000, by = 5000), labels = scales::comma)
#p6 <- p6 + labs(title = "Statistik över levande födslar och dödsfall under första levnadsåret i Sverige, 1751 -- 2016 \n")
p6 <- p6 + scale_color_manual(name = "Kön", labels = c("Totalt", "Flickor", "Pojkar"), values = c("purple", "red", "blue"))
p6 <- p6 + facet_grid(~kon)
gganimate(p6)
