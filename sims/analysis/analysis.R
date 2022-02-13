library(ggplot2)
library(plyr)
library(Hmisc)

ests <- read.csv("../output.csv")
lightblue <- "#56B4E9"

summary_file <- "summary.txt"

data_summary <- function(data, varname, groupnames){
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
 return(data_sum)
}

ests$est_H_adapted_power_error <- ests$est_H_adapted_power - ests$H
ests.est_H_adapted_power_summary <- data_summary(ests, "est_H_adapted_power_error", c("H"))
ggplot(ests, aes(x=H,y=est_H_adapted_power_error)) + geom_point() +
  scale_x_continuous(breaks=seq(0.1,0.9,0.1)) + scale_y_continuous(limits=c(-0.6,0.6)) +
  stat_summary(fun="mean",color=lightblue) +
  stat_summary(fun.data="mean_sdl",color=lightblue,geom="errorbar")
ggsave("est_H_adapted_power.png")
write.table(ests.est_H_adapted_power_summary,file=summary_file)

cat("\n------------------------------\n\n", file=summary_file, append=TRUE)

ests$est_H_adapted_triangle_error <- ests$est_H_adapted_triangle - ests$H
ests.est_H_adapted_triangle_summary <- data_summary(ests, "est_H_adapted_triangle_error", c("H"))
ggplot(ests, aes(x=H,y=est_H_adapted_triangle_error)) + geom_point() +
  scale_x_continuous(breaks=seq(0.1,0.9,0.1)) + scale_y_continuous(limits=c(-0.6,0.6)) +
  stat_summary(fun="mean",color=lightblue) +
  stat_summary(fun.data="mean_sdl",color=lightblue,geom="errorbar")
ggsave("est_H_adapted_triangle.png")
write.table(ests.est_H_adapted_triangle_summary, file=summary_file, append=TRUE)

cat("\n------------------------------\n\n", file=summary_file, append=TRUE)

ests$est_rho_adapted_power_error <- ests$est_rho_adapted_power - ests$rho
ests.est_rho_adapted_power_summary <- data_summary(ests, "est_rho_adapted_power_error", c("H"))
ggplot(ests, aes(x=H,y=est_rho_adapted_power_error)) + geom_point() +
  scale_x_continuous(breaks=seq(0.1,0.9,0.1)) + scale_y_continuous(limits=c(-0.6,0.6)) +
  stat_summary(fun="mean",color=lightblue) +
  stat_summary(fun.data="mean_sdl",color=lightblue,geom="errorbar")
ggsave("est_rho_adapted_power.png")
write.table(ests.est_rho_adapted_power_summary, file=summary_file, append=TRUE)

cat("\n------------------------------\n\n", file=summary_file, append=TRUE)

ests$est_rho_adapted_triangle_error <- ests$est_rho_adapted_triangle - ests$rho
ests.est_rho_adapted_triangle_summary <- data_summary(ests, "est_rho_adapted_triangle_error", c("H"))
ggplot(ests, aes(x=H,y=est_rho_adapted_triangle_error)) + geom_point() +
  scale_x_continuous(breaks=seq(0.1,0.9,0.1)) + scale_y_continuous(limits=c(-0.6,0.6)) +
  stat_summary(fun="mean",color=lightblue) +
  stat_summary(fun.data="mean_sdl",color=lightblue,geom="errorbar")
ggsave("est_rho_adapted_triangle.png")
write.table(ests.est_rho_adapted_triangle_summary, file=summary_file, append=TRUE)

cat("\n------------------------------\n\n", file=summary_file, append=TRUE)

ests$est_sigma_adapted_power_error <- ests$est_sigma_adapted_power - ests$sigma
ests.est_sigma_adapted_power_summary <- data_summary(ests, "est_sigma_adapted_power_error", c("H"))
ggplot(ests, aes(x=H,y=est_sigma_adapted_power_error)) + geom_point() +
  scale_x_continuous(breaks=seq(0.1,0.9,0.1)) + scale_y_continuous(limits=c(-2,2)) +
  stat_summary(fun="mean",color=lightblue) +
  stat_summary(fun.data="mean_sdl",color=lightblue,geom="errorbar")
ggsave("est_sigma_adapted_power.png")
write.table(ests.est_sigma_adapted_power_summary, file=summary_file, append=TRUE)

cat("\n------------------------------\n\n", file=summary_file, append=TRUE)

ests$est_sigma_adapted_triangle_error <- ests$est_sigma_adapted_triangle - ests$sigma
ests.est_sigma_adapted_triangle_summary <- data_summary(ests, "est_sigma_adapted_triangle_error", c("H"))
ggplot(ests, aes(x=H,y=est_sigma_adapted_triangle_error)) + geom_point() +
  scale_x_continuous(breaks=seq(0.1,0.9,0.1)) + scale_y_continuous(limits=c(-2,2)) +
  stat_summary(fun="mean",color=lightblue) +
  stat_summary(fun.data="mean_sdl",color=lightblue,geom="errorbar")
ggsave("est_sigma_adapted_triangle.png")
write.table(ests.est_sigma_adapted_triangle_summary, file=summary_file, append=TRUE)