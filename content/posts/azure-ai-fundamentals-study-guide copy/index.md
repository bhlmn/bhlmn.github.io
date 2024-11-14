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

<details>
<summary>What is the Designer in Azure Machine Learning Studio?</summary>

> Designer is a drag-and-drop UI for building ML pipelines ([source](https://learn.microsoft.com/en-us/azure/machine-learning/concept-designer?view=azureml-api-2)). It is [primarily used by Data Scientists](https://learn.microsoft.com/en-us/azure/machine-learning/concept-ml-pipelines?view=azureml-api-2#which-azure-pipeline-technology-should-i-use), and allows you to use prebuit or custom components (letting you wrap your own code)

</details>

<details>
<summary>What are the steps, in order, for using Azure Machine Learning designer to train a machine learning model?</summary>

> 1. Create a dataset component
> 2. Process the data with custom or prebuilt components
> 3. Train the model
> 4. Output the data into a sink

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
<summary>What are the various Azure AI services, and what do they do?</summary>

> From [Microsoft's documentation](https://learn.microsoft.com/en-us/azure/ai-services/?view=doc-intel-3.1.0):
> - Azure OpenAI lets you perform a variety of NLP tasks using generative AI.
> - Azure AI Search helps bring search and knowledge mining capabilities to applications.
> - Azure AI Content Safety detects unwanted content.
> - Azure AI Speech provides speech to text, text to speech, speech translation, and speaker recognition capabilities.
> - Azure AI Document Intelligence helps with extracting text from and analyzing documents (PDFs)
> - Azure AI Vision helps with analyzing content in images and vidoes
> - Azure AI Custom Vision allows users to create custom image classification and object detection models
> - Azure AI Face lets you detect and identify people and emotions from images
> - Azure AI Translator helps with translation from text to text
> - Azure AI Language is useful for NLP
> - Azure AI Video Indexer analyzes videos
> - Azure AI Immersive Reader helps people read and comprehend text

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
> - Optical character recognition (OCR) – detect and extract text in images.

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

<details>
<summary>What domain-specific analysis does Azure AI Vision support?</summary>

> Custom domain models are curated image classification models that help identify celebrities or landmarks ([source](https://learn.microsoft.com/en-us/azure/ai-services/computer-vision/concept-detecting-domain-content)).

</details>

<details>
<summary>What is Azure AI Custom Vision? How does it differ from Azure AI Vision?</summary>

> [Azure AI Custom Vision](https://learn.microsoft.com/en-us/azure/ai-services/custom-vision-service/overview) is an extension of Azure AI Vision. It "is an image recognition service that lets you build, deploy, and improve your own image identifier models." It supports image classification and object detection use cases. Azure AI Vision contains pre-built models for computer vision tasks. If you need to build your own custom image classification or object detection models, you would use Custom Vision.

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

### Optical Character Recognition (OCR)

<details>
<summary>Which service(s) is used for OCR tasks?</summary>

> Azure AI Vision and Vision Studio.

</details>

<details>
<summary>What text details are extracted from images with the Read API?</summary>

> - One object for each page of text, including page size and orientation.
> - The lines of text on a page and their contents (including the bounding polygon)
> - Each word in each line (including the bounding polygon)

</details>

<details>
<summary>Can you use Vision Studio for OCR in production applications?</summary>

> No. Vision Studio is a playground for OCR use cases and experimentation. To build an app you will need to use the Azure AI Vision SDK or REST API.

</details>

## Natural Language Processing (NLP)

### Text Analysis

<details>
<summary>What is text analysis?</summary>

> Text analysis is extracting information from unstructured text.

</details>

<details>
<summary>What Azure service helps with analyzing text? What features does it support?</summary>

> Azure AI Language. It supports sentiment analysis, key phrase identification, text summarization, machine translation, and language understanding.

</details>

<details>
<summary>In what ways can text be cleaned before being input into NLP models?</summary>

> - It can be **normalized**, where punctuation is removed and all words are made lower case.
> - Stop words (the, a, it) can be removed.
> - Sentences can be split into *bi-grams* (2 word combinations) or *tri-grams* (3 word combinations) before analysis.
> - Words can be *stemmed*, where words with similar roots (e.g., *power*, *powerful*) are considered the same token.

</details>

<details>
<summary>What is frequency analysis and when is it useful?</summary>

> Frequency analysis counts the most frequently occurring tokens (single words or n-grams) in a text to extract its sentiment and meaning.

</details>

<details>
<summary>Why is removing stop words the first task in NLP statistical analysis?</summary>

> Stop words appear in natural language quite often. Removing them before analysis ensures that such analysis is more likely to uncover insights into the content of the passage.

</details>

<details>
<summary>What NLP tasks can be presented as classification problems?</summary>

> Determining the sentiment of text or mining an opinion.

</details>

<details>
<summary>How do language models use embeddings?</summary>

> Embeddings represent tokens as vectors with many dimensions. Language models are trained with these embeddings to predict the next token in a text, which helps them understand word relationships.

</details>

<details>
<summary>What text analysis features does Azure AI Language support?</summary>

> - Named entity recognition (NER), which identifies people, places, events, etc. in text.
> - Entity linking is like the above but links to Wikipedia!
> - PII and PHI detection
> - Language detection (e.g., *english* or *spanish*)
> - Sentiment analysis
> - Opinion mining
> - Text summarization
> - Key phrase extraction, which grabs the main concepts from unstructured text.

</details>

<details>
<summary>What does Azure AI Language return for language detection tasks? What if it can't determine the language?</summary>

> It returns the language name (e.g., english), the ISO 6391 code (e.g., en), and a score from 0 to 1 reflecting its confidence. If it doesn't know the language, it will return unknown and the confidence will be NaN.

</details>

<details>
<summary>What does Azure AI Language return for sentiment analysis tasks?</summary>

> It returns a softmax output with three potential classes: positive score, neutral score, and negative score. The sum of these scores will be 1.

</details>

<details>
<summary>What is a use case for key phrase extraction?</summary>

> Grabbing the key terms from a body as text to suggest tags to make the document searchable!

</details>

<details>
<summary>What is the difference between key phrase extraction, named entity recognition (NER), and entity linking?</summary>

> Key phrase extraction extracts the main concepts found in a body of text. NER identifies and categorizes entities (such as people, places, organizations, etc.) present in unstructured text. Entity linking is similar to NER, but it identifies entities and then provides links to relevant wikipedia articles.

</details>

<details>
<summary>How can you play with Azure AI Language capabilities?</summary>

> With Language studio! To build production applications you should use the RestAPI or SDK.

</details>

### Question Answering

<details>
<summary>For question answering tasks is it better to use the SDK/RestAPI or Language Studio?</summary>

> Chatbots can be managed solely in Language Studio, so if you need a low-code solution it is a great way to develop your chatbot!

</details>

<details>
<summary>How are question answering projects put together with Azure AI Language service?</summary>

> You setup a knowledge base–a list of questions and their answers–and Language Studio will take care of the rest. Behind the scenes an AI will process the question/answer pairs, and then you can test the project.

</details>

<details>
<summary>What is the easiest way to setup a question answering knowledge base?</summary>

> Most companies already have an FAQ. Such documents can be directly imported into the Q&A knowledge base.

</details>

### Conversational Language Understanding

<details>
<summary>What does a CLU application consist of?</summary>

> Intents (verbs) and entities (nouns). They are trained on utterances. CLU models are trained to predict intents and entities from incoming utterances, even if the user input doesn't exactly match what is in the training data.

</details>

<details>
<summary>What is the None intent?</summary>

> The none intent is a fallback. When the CLU application doesn't understand the goal of an utterance, it should respond with a generic response.

</details>

<details>
<summary>How do you author a CLU application in Azure?</summary>

> Using the Azure AI Language and Language Studio you can define (give examples of) entities, intents, and utterances. Azure will take care of the rest. The Azure AI Language CLU feature includes pre-defined intents and entities for many common domains to help you get started.

</details>

<details>
<summary>How can you test and deploy a CLU application?</summary>

> By submitting test utterances (those the model hasn't seen before) to a trained model and reviewing the predicted intents. When you are satisfied with the results you can deploy the model to an endpoint and begin consuming the resource.

</details>

### Speech Analysis

<details>
<summary>What is speech recognition?</summary>

> Speech recognition takes spoken language and transcribes it into text so it can be further analyzed and processed.

</details>

<details>
<summary>What models are typically involved in speech recognition?</summary>

> An acoustic model to convert the audio into phonemes (specific sounds), and a language model that maps phonemes to words.

</details>

<details>
<summary>What features/capabilities does Azure AI Speech support?</summary>

> - Speech to text
> - Text to speech (including creating custom voices)
> - Speech translation
> - Speech recognition (identifying different speakers)

</details>

<details>
<summary>What is the difference between real-time and batch transcription?</summary>

> Real-time transcription occurs on live audio streams. Batch transcription takes place on stored audio recordings that happened in the past.

</details>

<details>
<summary>Which types of voices does the text to speech API support?</summary>

> There are multiple pre-built voices from which you can select. You can also develop your own custom voices.

</details>

<details>
<summary>How can you interact with Azure AI Speech?</summary>

> With Speech Studio, Azure AI Studio, the CLI, SDK, or Rest API.

</details>

### Translation

<details>
<summary>What is the difference between literal and semantic translation? What are the challenges of each?</summary>

> A literal translation attempts to translate each word into the corresponding word in the target language. Literal translations can fail when there isn't an equivalent word in the target language, or when a literal translation fails to capture the meaning of a phrase.
> 
> Semantic translation focuses on the context and meaning of words or sentences. A combined approach of literal and semantic translation is best.

</details>

<details>
<summary>Compare text and speech translation.</summary>

> Text translation is for written text and documents, while speech translation takes audio input (speech) and translates it either to audio in another language (speech-to-speech translation) or to text (speech-to-text translation).

</details>

<details>
<summary>Which Azure AI services support translation?</summary>

> The Azure AI Translator supports text-to-text translation. Azure AI Speech supports speech to text and speech-to-speech translation.

</details>

<details>
<summary>How many languages does Azure AI Translator support?</summary>

> Azure AI Translator supports more than 130 languages. It will translate text from one language to another or many languages at once.

</details>

<details>
<summary>How many languages does Azure AI Speech support?</summary>

> Azure AI Speech supports more than 90 languages. It will translate speech from one language to another or many languages at once.

</details>

<details>
<summary>What useful configuration options does Azure AI Translator support?</summary>

> - Profanity filtering. By default profanity isn't filtered, but you can specify so that it is!
> - Selective translation. You can specify brand names, words, or phrases that should not be translated.

</details>

<details>
<summary>What does Custom Translator offer in Azure AI Translator?</summary>

> Custom Translator enables building customized neural machine translation systems. Custom translation models can be built in a no-code manner. These are helpful for domain-specific use cases where the out of the box translation models don't meet your needs. They do require a lot of data ... about 10,000 translated sentences with your domain-specific language.

</details>

## Document Intelligence

<details>
<summary>What is the difference between document intelligence and optical character recognition (OCR)?</summary>

> OCR identifies text in images and outputs data in text format. Document intelligence automates the extracting, understanding, and saving of data within text.

</details>

<details>
<summary>What is document analysis?</summary>

> Document analysis is the process of extracting the text, layout, and key-value pairs from a document. It provides bounding box locations on a page.

</details>

<details>
<summary>What types of models are available in Azure AI Document Intelligence?</summary>

> There are prebuilt models that have been trained to process common document types like business cards, invoices, ID documents, receipts, etc. You can also train custom models.

</details>

<details>
<summary>What types of fields are recognized by pretrained document intelligence models?</summary>

> - Name, address and phone number
> - Data and time
> - Name, quantity, and price of purchased items
> - Totals, subtotals, and tax values

</details>

<details>
<summary>What are the different types of documents for which there are prebuild document intelligence models?</summary>

> - Business cards
> - Contracts
> - Health Insurance Cards
> - ID Cards
> - Invoices
> - Checks
> - Bank Statements
> - Invoices
> - Receipts
> - Tax Documents
> - Mortgage Documents
> - Marriage Certificates
> - Credit Cards

</details>

## Knowledge Mining

<details>
<summary>What are some key features of Azure AI Search?</summary>

> - Source data – AI Search accepts JSON data from any source, and can turn data in many Azure storage services into searchable JSON.
> - Supports vector search, full text (keyword) search, and hybrid search.
> - Easily integrates with other Azure AI services to analyze and enrich raw text.
> - Offers analysis for 56 languages.
> - Supports a query syntax that can handle vector queries, text search, hybrid queries, fuzzy search, autocomplete, and geo-search.
> - Scales to meet user needs without having to manage any infrastructure.

</details>

<details>
<summary>What are the key elements of an indexing pipeline?</summary>

> 1. Select a data source.
> 2. The indexer ingests source data and outputs serialized JSON.
> 3. The indexer opens files and extracts content (a process called document cracking).
> 4. Enrich data via Azure AI services.
> 5. Populate the search index

</details>

<details>
<summary>How does one interact with an Azure AI Search index?</summary>

> Via an HTTP or REST API request. The response will come back as JSON.

</details>

<details>
<summary>What query syntax does Azure AI Search use?</summary>

> Apache Lucene query syntax. Documentation for the query syntax can be found [here](https://learn.microsoft.com/en-us/azure/search/query-odata-filter-orderby-syntax).

</details>

## Generative AI

<details>
<summary>What different types of outputs can generative AI models support?</summary>

> Text, images, videos, audio, and code.

</details>

<details>
<summary>What is the basic architecture of a transformer model?</summary>

> An encoder block:
> - creates semantic representations of the training data/vocabulary. 
> - determines relationships between tokens/words.
> 
> The decoder block generates new language sequences.

</details>

<details>
<summary>What does the attention layer do in a transformer model?</summary>

> Attention examines a sequence of tokens to quantify the strength of the relationships between them. Self attention considers how other tokens around one particular token influences that token's meaning.
> 
> In an encoder block, the attention layer will examine each token in context. A single token might have multiple vector embeddings if it has different contexts. (E.g., the word *tie* can mean many different things).
> 
> In a decoder block, attention layers help predict the next token in a sequence. It keeps track the sequence of tokens up to the current point and considers which tokens are most influential when considering what the next token should be.

</details>

<details>
<summary>What is multi-head attention?</summary>

> Multi-head attention uses different elements in the embeddings to determine multiple possible next tokens.

</details>

<details>
<summary>What is the advantage of using an existing foundation model (like ChatGPT) instead of training your own LLM from scratch?</summary>

> Training foundation models requires an enormous amount of training data and compute resources, making it unfeasible for many organizations. Also, foundation models are already quite capable for a variety of tasks.

</details>

<details>
<summary>What are the core differences between LLMs and SLMs (small language models)?</summary>

> - LLMs are typically trained on larger, more general text datasets.
> - LLMs have many billions of parameters and require more memory.
> - SLMs typically have a more focused vocabulary and use cases.
> - SLMs are easier to deploy at the edge/locally.
> - SLMs have quicker inference times.
> - LLMs take longer and more compute power to fine-tune.

</details>

<details>
<summary>What are copilots?</summary>

> Digital generative AI assistants that are integrated into applications. They provide contextualized support for commons tasks in those applications.

</details>

<details>
<summary>What are the three levels of leveraging copilots?</summary>

> - Off-the-shelf copilots, such as Microsoft Copilot for Microsoft 365, can be used to help Microsoft users.
> - Microsoft Copilot can be extended with proprietary data to support custom business processes or tasks.
> - You can build completely custom copilots!

</details>

<details>
<summary>What are five aspects of prompting to improve a copilot's responses?</summary>

> 1. Give a specific goal for what we want the copilot to do
> 2. Provide a data source to ground the response
> 3. Add context
> 4. Set clear expectations for the output
> 5. Iterate and experiment!

</details>

<details>
<summary>What is the difference between Azure AI Studio and Copilot Studio?</summary>

> Copilot Studio is a low-code development environment for business users to create copilots. Deployed copilots will be hosted in Microsoft 365. Azure AI Studio is for professional developers to define prompt flows, do prompt engineering, and integrate proprietary data in to generative AI applications and custom copilots to be used in proprietary apps.

</details>

### Responsible Generative AI

<details>
<summary>What are the four recommended actions to ensure generative AI applications follow best practices for responsible AI?</summary>

> 1. Identify potential harms.
> 2. Measure the presence of these harms in the application's outputs.
> 3. Mitigate these harms at *every possible layer*. Transparently communicate potential risks to end users.
> 4. Develop and follow a deployment and operational readiness plan.

</details>

<details>
<summary>What potential harms are relevant to generative AI applications?</summary>

> Generative AI applications can generate content that:
> - is offensive and discriminatory
> - is factually inaccurate
> - encourages illegal/unethical behavior 

</details>

<details>
<summary>What are four steps in the harm identification process?</summary>

> 1. Specifically identify potential harms that can be output
> 2. Prioritize measurement for the highest priority harms
> 3. Test and verify the presence of these harms in model output
> 4. Document and share detail of these harms with internal stakeholders. Update the list of prioritized harms as needed.

</details>

<details>
<summary>How can you measure the presence of potential harms in model output at scale?</summary>

> With the help of additional models! You can have a model classify output as harmful before it is displayed to the end user. You can define addition categories (e.g., toxicity). You should manually spot check content as well.

</details>

<details>
<summary>What are some layers in an AI system where harm can be mitigated?</summary>

> 1. At the model layer ... selecting the appropriate model for the task at hand will help mitigate harm. You can also fine tune the model to keep its generated content more relevant to the task at hand.
> 2. By using a safety system. For example, Azure OpenAI has built-in content filters that can flag content that is hateful, sexual, violent, or self-harming.
> 3. The prompt layer. You can add context (e.g., with RAG) to the prompt to ground the model's response. You can also give the model explicit instructions on what to do with given inputs or what type of information it can output.
> 4. The UX layer. We can validated user input/output in the web application itself.

</details>

<details>
<summary>What are components of a proper release and deployment plan?</summary>

> - It should include a phased delivery where it is first release to a restricted group of users for testing and feedback.
> - Have an incident response plan and rollback plan if there are issues.
> - Implement the capability to immediately block harmful content if it is discovered.
> - Implement the capability to immediately block specific users/IP addresses if they are misusing the application.
> - Allow users to provide feedback and flag harmful or inappropriate content.
> - Track user satisfaction.

</details>

<details>
<summary>What features does Azure AI content filters provide?</summary>

> - Prompt shields scans for user input attacks.
> - Groundedness detection ensures model output is grounded in source content
> - Protected material detection looks for copyrighted content
> - And you can define custom categories!

</details>

### Azure AI Studio

<details>
<summary>What are some key features of Azure AI Studio?</summary>

> - The model catalog
> - Prompt flow development
> - Azure OpenAI service for generative AI model testing and deployment
> - Integration with other Azure AI services for speech, vision, language, and document intelligence
> - Build RAG applications
> - Chat playground
> - Scalable compute

</details>

<details>
<summary>In what use cases or scenarios should you use Azure AI Studio?</summary>

> When you need to:
> - Create and manage AI projects!
> - Develop generative AI applications
> - Explore available AI models
> - Build RAG applications
> - Monitor and evaluate AI models

</details>
