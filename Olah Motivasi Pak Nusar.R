# P-CFA OLAH MOTIVASI
# Load Package
library(readxl)
library(confreq)

# IMPORT DATA
setwd("C:/Users/Keysha Jauzi/Documents/Olah Motivasi")
data <- read_excel("Olah Motivasi 2.xlsx", sheet = "Olahan")
View(data)

# VARIABEL PENELITIAN
data_pcfa <- data[, c("Usia", "Pend", "Satdik", "SDI")]

# TABEL KONTINGENSI
config_table <- xtabs(
  ~ Usia +
    Pend +
    Satdik +
    SDI,
  data = data_pcfa
)
config_table
ftable(config_table)
data_frek <- as.data.frame(config_table)
class(data_frek) <- c("data.frame", "Pfreq")

# PCFA
# base model complete independence
hasil_indep <- CFA(data_frek)
summary(hasil_indep)

# base model bersyarat
hasil_pcfa <- CFA(data_frek, form = "~ Usia*Pend*Satdik + SDI")
summary(hasil_pcfa, type = "ex.bin.test", alpha = 0.05)
