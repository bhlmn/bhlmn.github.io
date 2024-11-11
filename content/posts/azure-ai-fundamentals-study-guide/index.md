+++
title = "Azure AI Fundamentals Study Guide"
date = 2024-11-11T10:31:14-07:00
draft = false
+++

Below are questions to know the answer to pass the [Azure AI Fundamentals (AI-900)](https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-fundamentals/?practice-assessment-type=certification) exam.

## Resources

* Microsoft's [official study guide](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-900) for the exam.
* Microsoft's [official practice exam](https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-fundamentals/practice/assessment?assessment-type=practice&assessmentId=26&practice-assessment-type=certification), which has 50 practice questions. I'd recommend taking it more than once.

## AI Overview

<details>
<summary>What is artificial intelligence?</summary>

> Software that imitates human behaviors and capabilities.

</details>

<details>
<summary>What are the key ML workloads that Azure supports?</summary>

> Key ML workloads:
> - Custom machine learning
> - Computer vision APIs
> - Natural language processing
> - Document intelligence
> - Knowledge mining (search indexes)
> - Generative AI

</details>

<details>
<summary>What are challenges and risks specific to AI systems?</summary>

> AI systems have several unique challenges:
> - Biases present in training data will carry forward into the AI system.
> - Inference errors can do real world damage.
> - Sensitive data (such as PII and PHI) can be exposed.
> - Some AI systems are black boxes and hard to explain.
> - We don't have great frameworks for determining who is liable for AI-driven decisions.

</details>

<details>
<summary>What are the six responsible AI principles?</summary>

> AI systems should be ([source](https://learn.microsoft.com/en-us/azure/machine-learning/concept-responsible-ai?view=azureml-api-2)):
> - Fair – "AI systems should treat everyone fairly and avoid affecting similarly situated groups of people in different ways."
> - Reliable and safe – "To build trust, it's critical that AI systems operate reliably, safely, and consistently. These systems should be able to operate as they were originally designed, respond safely to unanticipated conditions, and resist harmful manipulation."
> - Private and secure – AI systems must comply with data privacy laws, be transparent about how data are used and stored, and be resilient to attacks.
> - Inclusive – AI systems should empower and engage everyone equally.
> - Transparent (and understandable) – We need to be able to understand how AI systems arrive at their predictions.
> - Accountable – AI systems and those that build them should be accountable and answerable. They should be developed according to legal and organizational policies.

</details>

### Fundamentals of Machine Learning

<details>
<summary>What are the main types of machine learning problems?</summary>

> Supervised learning:
> - Regression
> - Classification
>   - Binary (two possible classes)
>   - Multi-class (many possible classes)
> 
> Unsupervised:
>   - Clustering
> 
> Time series analysis

</details>

<details>
<summary>What are common evaluation metrics for regression problems?</summary>

> Common metrics are:
> - Mean absolute error (MAE).
> - Mean squared error (MSE), which further penalizes larger errors.
> - Root mean square error (RMSE), which also greater penalizes larger errors, but maintains the same units as the label.
> - Coefficient of determination (R squared), which is the percentage of variance explained by the model.

</details>

<details>
<summary>What are common evaluation metrics for classification problems?</summary>

> Common classification metrics are:
> - Accuracy – the percentage of predictions the model got right. Optimize for this when classes are balanced and false negatives/positives are equally bad.
> - Recall (true positive rate, or TPR) – the percentage of positive predictions the model got right. Optimize for this when a false negative is worse than a false positive.
> - Precision – the percentage of predicted positives the model got right. Optimize for this when a false positive is _worse_ than a false negative.
> - F1 score is a combination of recall and precision.
> - Area under the curve (AUC) - compares the trupe positive rate and false positive rate for different classification thresholds (from 0 to 1). Values better than 0.5 (randomly guessing) indicate a good model.

</details>

<details>
<summary>How are clustering models evaluated?</summary>

> Since there is no right answer, clustering models tend to optimize for one of the following:
> - Average distance to cluster center – how close, on average, each point in the cluster is to the center of the cluster.
> - Average distance to other center
> - Maximum distance to cluster center
> - Silhouette – summarizes the ratio of distance between points in the same cluster and points in different clusters (closer to 1 the better).

</details>

<details>
<summary>Which Azure services enable ML projects?</summary>

> Services:
> - Azure Machine Learning
> - Azure Machine Learning Studio
> 
> With these services you can:
> - Import and explore data
> - Create and use compute resources
> - Do data science work in notebooks
> - Create training jobs and pipelines
> - Use AutoML to train models
> - View details of trained models (eval metrics, training parameters, responsible AI info)
> - Deploy trained models for live or batch inference
> - Import and manage models via a model catalog

</details>

### Fundamentals of Azure AI services

<details>
<summary>How do Azure AI services improve speed-to-market for AI solutions?</summary>

> - They are prebuilt models that are ready to use
> - They are accessed through APIs
> - They are available on Azure

</details>

<details>
<summary>How are Azure services provisioned?</summary>

> To provision an Azure service, you need to have:
> - An Azure subscription (account)
> - A resource group

</details>

<details>
<summary>What are the two types of Azure service resources, and when might you use each?</summary>

> - A **single-service resource** provides access to a single Azure service. This is a good strategy when you only need one Azure resource for a project or when you want to see cost information separately.
> - A **multi-service resource** provides access to many Azure services with a single key and endpoint. With this strategy all services are billed together. This is helpful when you need several Azure services or are exploring capabilities.

</details>

<details>
<summary>What are the different service studio interfaces, and what do they do?</summary>

> - Vision Studio let's you explore Azure Vision capabilities
> - Language Studio – Language services
> - Speech Studio – Speech to text and text to speech
> - Content Safety Studio – Content safety functionality
> - Azure AI Studio – Develop GenAI solutions and custom copilots
> - Azure ML Studio – ML lifecycle and autoML

</details>

## Computer Vision

<details>
<summary>What are the main computer vision tasks?</summary>

> Common computer vision tasks are:
> - Image classification (easy) – classifying images based on their contents
> - Object detection (harder) – classifying multiple objects in an image and identifying their location with a bounding box.
> - Semantic segmentation (hardest) – individual pixels are classified according to the object to which they belong.
> - Image analysis – generating a text caption for an image.
> - Facial detection and recognition – detecting and identifying faces in an image.
> – Optical character recognition (OCR) – detect and extract text in images.

</details>

<details>
<summary>What resource(s) need provisioned to work with Azure AI Vision service?</summary>

> Either Azure AI Vision or Azure AI Services.

</details>

<details>
<summary>What image analysis capabilities does Azure AI Vision offer?</summary>

> - Optical character recognition (OCR)
> - Generating image captions and descriptions
> - Object detection
> - Object tagging (multiple text keywords for the image)

</details>

<details>
<summary>When might you need to train your own custom vision models in Azure AI Vision?</summary>

> When the built-in models don't meet your needs out of the box. You can fine tune a custom model for the following use cases. Just bring your images!
> - Image classification
> - Object detection

</details>

### Facial Recognition

<details>
<summary>What Azure AI services help with facial detection and analysis?</summary>

> - Azure AI Face is the Azure service for facial detection, analysis, and recognition.
> - Azure AI Video Indexer enables facial detection and identification in videos.
> - Azure AI Vision offers face detection and basic face analysis.

</details>

<details>
<summary>What is the difference between face detection, face analysis, and facial recognition?</summary>

> - Facial detection is the process of identifying and locating faces in images or video. 
> - Facial analysis analyzes facial features. 
> - Facial recognition is a branch of face analysis that tries to identify known individuals based on their faces being present in images or video.

</details>

<details>
<summary>What facial attributes can be returned by Azure AI Face?</summary>

> - Whether the face has accessories such as headwear, glasses or a mask.
> - How blurred the face is.
> - The orientation of the face in 3D space (its pose)
> - The noise of the image
> - How occluded (blocked) the face is.
> - How good the image might be for facial recognition (high, medium, or low).

</details>

<details>
<summary>Which capabilities of Azure AI Face require customers to submit an intake form (because of potential security/ethical concerns)?</summary>

> - Face identification
> - Face verification – seeing if the face in an image is similar to a face in another image
> - Liveness detection – to determine if an image or video is fake

</details>

<details>
<summary>How can you use AI Face service in a no-code way?</summary>

> Play with the service in Azure Vision Studio!

</details>

<details>
<summary>Question</summary>

> Answer

</details>
