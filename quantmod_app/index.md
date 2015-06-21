---
title       : Quantmod App
subtitle    : Quantmod App
author      : R V
job         : IT
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## Quantmod App

Quantmod means "Quantitative Financial Modelling & Trading Framework for R"

The quantmod package for R is designed to assist the quantitative trader in the development, 
testing, and deployment of statistically based trading models.

This is a simple app showing the basic data handling functions you can do with the 
quantmod data.

Link of the app:

--- 

## Input and Output

The app requires the following inputs -- 

1. Choose source: Yahoo, Google, FRED, oanda. 
2. Input ticker/symbol. 
3. Choose if you want to show the bargraph of the closing price. 
For example: "GOOG" from yahoo

It will give you the following - 

1. as of Date of the data being shown
2. OHLC Data : Open, Series High, Series Low, Close, Volume 
3. Graph of the Close data



--- 

## Code


```r
sym <- getSymbols("GOOG", src = "yahoo", auto.assign = FALSE)
```



```r
out_date <- index(last(sym))
out_Op <- coredata(last(Op(sym)))[1]
out_Hi <- coredata(last(Hi(sym)))[1]
out_Lo <- coredata(last(Lo(sym)))[1]
out_Cl <- coredata(last(Cl(sym)))[1]
out_Vo <- coredata(last(Vo(sym)))[1]
```

--- 

## Output

as of Date

```
## [1] "2015-06-19"
```
Open

```
## [1] 537.21
```
High

```
## [1] 538.25
```
Low

```
## [1] 533.01
```
Close

```
## [1] 536.69
```
Volume

```
## [1] 1885700
```

--- 

## Caveat: Errors and Further Improvement

1. The app gives an error when the symbol entered is not a valid symbol. 

