---
title: "ML two-sample test"
description: "a cool algorithm for detecting drift in data"
summary: "a cool algorithm for detecting drift in data"
date: 2023-01-14
showToc: true
searchHidden: false
showReadingTime: true
showShareButtons: false
draft: true
---

## why?

I want to talk about the ML two-sample test algorithm and why I find it so intersting.

My engineering team and I were assigned delivering a data monitoring feature into Azure ML. We were fortunate to be able to consult with Microsoft Research and an engineer who happened to study concept drift and related concepts. She embedded in our team for a few weeks during initial development and we later released the feature in preview in summer 2019, where it remains today -- more on that in the learnings. 

A general data monitoring solution for all ML scenarios is impossible. The breadth of ML scenarios is too wide. However, ML two-sample tests provide a clever trick that may work in most scenarios. We used it in Azure ML to calculate an overall measure of data drift between two datasets, while also computing complementary statistics about individual features. In early 2022, we open-sourced the algorithm (or started to, at least).

## what?

Machine learning models are only as good as the data they were trained on, with exceptions. Often models are retrained on newer data, with varying triggers and desire for event-driven automation based on data monitoring. It'd be ideal to know if, when, and why a model may be performing poorly because of "data drift" in any form.

Let's take a simple setup and imagine we have 3 species of flower we've trained a model on -- here's the first 5 rows of data:

| color | length | species |
|-------|--------|---------|
| red   | 1.2    | flowerA |
| blue  | 2.5    | flowerB |
| red   | 0.8    | flowerA |
| blue  | 2.6    | flowerB |
| red   | 1.0    | flowerA |

You can infer the model you trian on this data knows of two species, flowerA and flowerB. They are of color red and blue respectively. The lenght of flowerB is around 2.5 whatever, while flowerA is around 1. Now imagine you see this in your production data, where you don't have labelled data yet pending DNA analysis:

| color | length | species | species predicted |
|-------|--------|---------| ----------------- |
| green | 10.0   | NULL    | flowerB           |

Assuming all of your training data looked like the first table, you can be fairly confident this scoring data is not from the same distribution. You could easily craft some manual checks for this -- is the color in the distinct set in the training data? Is the length outside N standard deviations from the distribution of length in training data?

But what if your ML model was trained on dozens of features? Or 100s or 1000s? And is this just anomaly detection?

I think it depends -- what are you accomplishing with your ML system? If a single anomaly is critical, there are probably better ways to detect than a ML two-sample test. But if you're dealing with large data and non-critical ML applications, a ML two-sample test may be a good fit and provide useful insights into your model's performance, with another model.

### the algorithm

You've trained a machine learning model on dataA. You have deployed it and collected dataB from the deployment, with the same features as dataA but probably without labels yet. You want to know if dataB's distribution has meaningfully shifted from dataA's, explain why, and gain insights into how to proceed.

The logic behind the algorithm is that by using the same model architecture as your production machine learning model, you can train a binary classification model on dataA and dataB that will perform well if they are from different distributions and poorly if they are of the same distribution. Continuing the simple tables from earlier, consider:

| color | length | species | label |
|-------|--------|---------|-------|
| red   | 1.2    | flowerA | dataA |
| blue  | 2.5    | flowerB | dataA |
| red   | 0.8    | flowerA | dataA |
| blue  | 2.6    | flowerB | dataA |
| red   | 1.0    | flowerA | dataA |

and:

| color | length | species | species predicted | label |
|-------|--------|---------| ----------------- | ------|
| green | 10.0   | NULL    | flowerB           | dataB |

Now, train a tabular classification model on this data that predicts whether a given data point (with the same set of features as your production ML model) came from the training or scoring dataset. 

## how?

- pandas and lightgbm
mldrift: https://github.com/lostmygithubaccount/mldrift
    
## learnings

- solve the foundational problems first
- something about premature optimization

## comments

{{< comments >}}
