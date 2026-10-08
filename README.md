# <img height="18" width="18" src="https://cdn.simpleicons.org/python/00ccff99" /> Cluster X - Pipeline Name

## Goal

This repository demonstrates how to use the [statcodgen libary](https://github.com/AIML4OS/WP10_Cluster1_StatCodGen)

This work was carried out within Work Package 10 "Text-to-Code" (WP10) of the AIMLL4OS project, and more specifically within the Cluster 1.

WP10 aims to explore and apply AI/ML methodologies to enhance the accuracy and efficiency of classification and coding processes used by National Statistical Institutes (NSIs).

You can find more information about WP10 on  the [CROS website](https://cros.ec.europa.eu/book-page/aiml4os-wp10-text-code-experiences-and-potential-use-aiml-classifying-and-coding), its [GitHub Repository](https://github.com/AIML4OS/WP10) and its dedicated [GitHub Pages](https://aiml4os.github.io/WP10/). 

## Pipeline Overview
The library supports three main steps:

1) Generate synthetic training data using LLMs through a ZeroGen approach.
2) Train an NLP classification model.
3) Evaluate the model.

## Code Structure

This repository contains five notebooks. Four provide tutorials on individual StatCodGen components, while the fifth, pipeline_demo, demonstrates a complete workflow.

## Runnable Example

This repository follows the AIML4OS [template](https://aiml4os.github.io/training-material-starting-pack/) provided by the [Work Package 6](https://cros.ec.europa.eu/book-page/aiml4os-wp6-knowledge-repository-and-training-materials).

It demonstrates the work carried out within WP10 and its cluster through a runnable example, linked to an SSP-Cloud service with a toy dataset and all dependencies preconfigured.

This example use a Norwegian dataset, described [this documentation](https://github.com/AIML4OS/WP10/tree/main/NorwayTestData), together with the Spanish-language explanatory notes for NACE Rev. 2.1.

To run the example interactively, render pipeline_demo.qmd as a Jupyter notebook (.ipynb), open the generated notebook in VS Code on SSPCloud, and execute its cells in order.