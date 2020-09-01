## ----setup, include=FALSE--------------------------------------
library(learnr)
knitr::opts_chunk$set(echo = FALSE)
library(palmerpenguins)
library(tidyverse)
library(likert)
data("gap")
data("penguins")


## --------------------------------------------------------------
penguins


## ----bill, exercise=TRUE---------------------------------------
penguins %>%
    select(contains("bill"))


## ----allof, exercise=TRUE--------------------------------------
selected_variables <- c("island", "year", "species", "blah")

penguins %>%
  select(all_of(selected_variables))


## ----allof2, exercise=TRUE-------------------------------------
selected_variables <- c("island", "year", "species")

penguins %>%
  select(all_of(selected_variables))


## ----any_of, exercise=TRUE-------------------------------------
selected_variables <- c("island", "year", "species", "blah")

penguins %>%
  select(any_of(selected_variables))


## ----where1, exercise=TRUE-------------------------------------
penguins %>%
  select(where(is.integer))


## ----where2, exercise=TRUE-------------------------------------
penguins %>%
  select(where(is.factor))


## ----both, exercise=TRUE---------------------------------------
penguins %>%
  tidyr::drop_na() %>%
  select(where(~ is.numeric(.x) && mean(.x) > 20))


## ----cc, exercise=TRUE-----------------------------------------
penguins %>%
  select(c(species, contains("bill")))


## ----cc2, exercise=TRUE----------------------------------------
penguins %>%
  select(-contains("bill"))


## ----mutaccwhere, exercise=TRUE--------------------------------
penguins %>%
   mutate(across(where(is.factor), as.character))


## ----mut_across, exercise=TRUE, exercise.lines=5---------------
penguins %>%
  mutate(across(where(is.character), as.factor))


## ----mut_across-solution---------------------------------------
penguins %>%
  mutate(across(where(is.integer), as.double))


## --------------------------------------------------------------
gap[1:10,]


## ----gap1, exercise=TRUE---------------------------------------
gap %>%
  mutate(StudentId = as.character(StudentId)) %>%
  mutate(across(is.integer, ordered))



## ----sum1, exercise=TRUE---------------------------------------
penguins %>%
  group_by(species) %>%
  summarize(across(contains("bill"), mean, na.rm=TRUE))


## ----sum2, exercise=TRUE---------------------------------------
penguins %>%
  group_by(species) %>%
  summarize(across(where(is.double), mean, na.rm=TRUE))


## ----pivlong, exercise=TRUE------------------------------------
penguins %>%
  pivot_longer(contains("bill"), names_to="metric", values_to="value")


## ----pivlong2, exercise=TRUE-----------------------------------
penguins %>%
  pivot_longer(where(is.numeric), names_to="metric",
               values_to="value")

