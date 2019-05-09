airQuality <- airquality
T_in_C <- (airquality$Temp - 32) * 5/9
t_ann <- mean(T_in_C)
t_jul <- T_in_C[airquality$Month==7]
t_may <- T_in_C[airquality$Month==5]
# conduct two-sided t-test for the difference of t_jul and t_may
# H_0: t_jul = t_may, H_1: t_jul  != t_may
t.test(t_may, t_jul, alternative=c("two.sided"))