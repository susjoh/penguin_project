#
# Palmer Penguins Analysis
# Susan Johnston
# September 2023

# Load the tidyverse library.

library(tidyverse)   # if it doesn't exist, run install.packages("tidyverse").
# You only need to do this once.

# Read in the data.

penguins <- read_table("data/penguin_data.txt")
glimpse(penguins)

# Run a linear regression.

model1 <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(model1)

model1a <- lm(body_mass_g ~ flipper_length_mm + species, data = penguins)
summary(model1a)

model1b <- lm(body_mass_g ~ flipper_length_mm + species + island, data = penguins)
summary(model1b)

# Create a nice plot in ggplot2.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  stat_smooth(method = "lm")

# Save the plot in your /figs folder.

ggsave("figs/1_flipper_bodymass_regression.png")

# Subset the data to only analyses females.

penguins_female <- subset(penguins, sex == "female")

# Save the edited dataset.

write_tsv(penguins_female, "results/1_penguin_female_only.txt")

# Adding a little comment to the end to illustrate git.
# Adding a second comment to the end to illustrate git.
