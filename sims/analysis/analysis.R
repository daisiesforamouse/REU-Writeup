library(tidyverse)

ests <- tibble(read.csv("./sims/analysis/output.csv")) %>% group_by(H)
oldests <- tibble(read.csv("./sims/analysis/oldoutput.csv")) %>% group_by(H)
newests <- tibble(read.csv("./sims/analysis/newoutput.csv")) %>% group_by(H)

outcome_names <- names(ests)[startsWith(names(ests), "est")]

ests_mean <- ests %>% summarize_at(outcome_names, mean, na.rm = TRUE)
ests_sd <- ests %>% summarize_at(outcome_names, sd, na.rm = TRUE)

oldests_mean <- oldests %>% summarize_at(outcome_names, mean, na.rm = TRUE)
oldests_sd <- oldests %>% summarize_at(outcome_names, sd, na.rm = TRUE)

newests_mean <- newests %>% summarize_at(outcome_names, mean, na.rm = TRUE)
newests_sd <- newests %>% summarize_at(outcome_names, sd, na.rm = TRUE)

## ests$est_H_adapted_power_error <- ests$est_H_adapted_power - ests$H
## ests.est_H_adapted_power_summary <- data_summary(ests, "est_H_adapted_power_error", c("H"))
## ggplot(ests, aes(x = H, y = est_H_adapted_power_error)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-0.6, 0.6)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_H_adapted_power.png")
## write.table(ests.est_H_adapted_power_summary, file = summary_file)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_H_adapted_triangle_error <- ests$est_H_adapted_triangle - ests$H
## ests.est_H_adapted_triangle_summary <- data_summary(ests, "est_H_adapted_triangle_error", c("H"))
## ggplot(ests, aes(x = H, y = est_H_adapted_triangle_error)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-0.6, 0.6)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_H_adapted_triangle.png")
## write.table(ests.est_H_adapted_triangle_summary, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_rho_adapted_power_error <- ests$est_rho_adapted_power - ests$rho
## ests.est_rho_adapted_power_summary <- data_summary(ests, "est_rho_adapted_power_error", c("H"))
## ggplot(ests, aes(x = H, y = est_rho_adapted_power_error)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-0.6, 0.6)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_rho_adapted_power.png")
## write.table(ests.est_rho_adapted_power_summary, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_rho_adapted_triangle_error <- ests$est_rho_adapted_triangle - ests$rho
## ests.est_rho_adapted_triangle_summary <- data_summary(ests, "est_rho_adapted_triangle_error", c("H"))
## ggplot(ests, aes(x = H, y = est_rho_adapted_triangle_error)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-0.6, 0.6)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_rho_adapted_triangle.png")
## write.table(ests.est_rho_adapted_triangle_summary, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_sigma_adapted_power_error <- ests$est_sigma_adapted_power - ests$sigma
## ests.est_sigma_adapted_power_summary <- data_summary(ests, "est_sigma_adapted_power_error", c("H"))
## ggplot(ests, aes(x = H, y = est_sigma_adapted_power_error)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-2, 2)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_sigma_adapted_power.png")
## write.table(ests.est_sigma_adapted_power_summary, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_sigma_adapted_triangle_error <- ests$est_sigma_adapted_triangle - ests$sigma
## ests.est_sigma_adapted_triangle_summary <- data_summary(ests, "est_sigma_adapted_triangle_error", c("H"))
## ggplot(ests, aes(x = H, y = est_sigma_adapted_triangle_error)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-2, 2)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_sigma_adapted_triangle.png")
## write.table(ests.est_sigma_adapted_triangle_summary, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)


## ests$est_H_adapted_power_error_optimal_k <- ests$est_H_adapted_power_optimal_k - ests$H
## ests.est_H_adapted_power_summary_optimal_k <- data_summary(ests, "est_H_adapted_power_error_optimal_k", c("H"))
## ggplot(ests, aes(x = H, y = est_H_adapted_power_error_optimal_k)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-0.6, 0.6)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_H_adapted_power_optimal_k.png")
## write.table(ests.est_H_adapted_power_summary_optimal_k, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_H_adapted_triangle_error_optimal_k <- ests$est_H_adapted_triangle_optimal_k - ests$H
## ests.est_H_adapted_triangle_summary_optimal_k <- data_summary(ests, "est_H_adapted_triangle_error_optimal_k", c("H"))
## ggplot(ests, aes(x = H, y = est_H_adapted_triangle_error_optimal_k)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-0.6, 0.6)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_H_adapted_triangle_optimal_k.png")
## write.table(ests.est_H_adapted_triangle_summary_optimal_k, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_rho_adapted_power_error_optimal_k <- ests$est_rho_adapted_power_optimal_k - ests$rho
## ests.est_rho_adapted_power_summary_optimal_k <- data_summary(ests, "est_rho_adapted_power_error_optimal_k", c("H"))
## ggplot(ests, aes(x = H, y = est_rho_adapted_power_error_optimal_k)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-0.6, 0.6)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_rho_adapted_power_optimal_k.png")
## write.table(ests.est_rho_adapted_power_summary_optimal_k, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_rho_adapted_triangle_error_optimal_k <- ests$est_rho_adapted_triangle_optimal_k - ests$rho
## ests.est_rho_adapted_triangle_summary_optimal_k <- data_summary(ests, "est_rho_adapted_triangle_error_optimal_k", c("H"))
## ggplot(ests, aes(x = H, y = est_rho_adapted_triangle_error_optimal_k)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-0.6, 0.6)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_rho_adapted_triangle_optimal_k.png")
## write.table(ests.est_rho_adapted_triangle_summary_optimal_k, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_sigma_adapted_power_error_optimal_k <- ests$est_sigma_adapted_power_optimal_k - ests$sigma
## ests.est_sigma_adapted_power_summary_optimal_k <- data_summary(ests, "est_sigma_adapted_power_error_optimal_k", c("H"))
## ggplot(ests, aes(x = H, y = est_sigma_adapted_power_error_optimal_k)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-2, 2)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_sigma_adapted_power_optimal_k.png")
## write.table(ests.est_sigma_adapted_power_summary_optimal_k, file = summary_file, append = TRUE)

## cat("\n------------------------------\n\n", file = summary_file, append = TRUE)

## ests$est_sigma_adapted_triangle_error_optimal_k <- ests$est_sigma_adapted_triangle_optimal_k - ests$sigma
## ests.est_sigma_adapted_triangle_summary_optimal_k <- data_summary(ests, "est_sigma_adapted_triangle_error_optimal_k", c("H"))
## ggplot(ests, aes(x = H, y = est_sigma_adapted_triangle_error_optimal_k)) +
##   geom_point() +
##   scale_x_continuous(breaks = seq(0.1, 0.9, 0.1)) +
##   scale_y_continuous(limits = c(-2, 2)) +
##   stat_summary(fun = "mean", color = blue) +
##   stat_summary(fun.data = "mean_sdl", color = blue, geom = "errorbar")
## ggsave("est_sigma_adapted_triangle_optimal_k.png")
## write.table(ests.est_sigma_adapted_triangle_summary_optimal_k, file = summary_file, append = TRUE)
