
```yaml
---
title: "Auto Plot"
author: "Omid"
date: "2025-11-12"
runtime: shiny
output:
  github_document: default
---
```



## Auto Ploter

This is a R program for everyone who want extract plots, and in the world of statistics we have a lots of plots.
It is boring if you setup one by one to show what it is and how it looks for your data, so you run **Auto plot** program and see the result.
After seeing the result on your dataset, choose what you like and go for setup.

### Example

We say your dataset is **iris** dataset and we run auto ploter on it.

By default you summary your data and think what plot is good for your data.


``` r
summary(iris)
```

```
##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
##  Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500
```

You can see some data in here.


```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
```

or setup plots one by one like this:


``` r
data(iris)
counts = table(iris$Species)
counts = counts[is.finite(counts)]

pie(counts,
    main = "Distribution of Iris Species",
    col = c("red", "blue", "green"))
```

![plot of chunk show-plot](figure/show-plot-1.png)

But with this program you just say:


``` r
auto_plot(iris)
```

and here your result:

![tested image on iris dataset](./Autoplot_example.png)

````
