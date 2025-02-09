+++
title = "Azure AI Engineer Study Guide"
date = 2024-12-16T12:22:00-07:00
draft = false
+++

Below are questions to know the answer to pass the [Azure AI Engineer (AI-102)](https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-engineer/) exam.

## Resources

* Microsoft Learn's [official course](https://learn.microsoft.com/en-us/training/courses/ai-102t00) to prepare for the exam.
* Microsoft's [official study guide](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-102) for the exam.
* Microsoft's [official practice exam](https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-engineer/practice/assessment?assessment-type=practice&assessmentId=61&practice-assessment-type=certification), which has 50 practice questions. I'd recommend taking it more than once.

## Azure AI Services

<details>
<summary>What are Azure AI services?</summary>

> A suite of cloud-based products that deliver AI capabilities.

</details>

<details>
<summary>What are the two types of Azure service resources, and when might you use each?</summary>

> - A **single-service resource** provides access to a single Azure service. This is a good strategy when you only need one Azure resource for a project or when you want to see cost information separately.
> - A **multi-service resource** provides access to many Azure services with a single key and endpoint. With this strategy all services are billed together. This is helpful when you need several Azure services or are exploring capabilities.

</details>

<details>
<summary>What are two reasons to provision separate resources for model training and model prediction?</summary>

> 1. This allows you to separate and monitor costs for training and inference separately.
> 2. This allows you to train on a service-specific resource, but host the model for predictions on a general AI-services resource.

</details>

<details>
<summary>What pieces of information are necessary to consume Azure AI services provisioned through a resource?</summary>

> Once you provision an Azure AI resource, it creates an endpoint to target to consume those resources. To do this you will need:
> 1. The endpount URI.
> 2. An API key for the endpoint (two are provisioned and can be refreshed at any time).
> 3. The resource location (e.g., us-west2).

</details>

<details>
<summary>Through which mechanisms can you consume Azure AI resources?</summary>

> * Via REST APIs
> * Using SDKs (e.g. Python or C#)
> * In many cases, via cloud-based Studios (e.g., Azure AI Studio, Azure Speech Studio)

</details>

### Securing Azure AI Services

<details>
<summary>What are three ways you can secure your Azure AI services?</summary>

> 1. By refreshing and managing subscription/API keys according to best practices.
> 2. By limiting access to applications and roles with the appropriate permissions.
> 3. By using network security to limit the range of IP addresses that can access the services.

</details>

<details>
<summary>What are best practices for keeping API/subscription keys secure?</summary>

> 1. Refresh subscription keys often.
> 2. Protect keys with Azure key vault.

</details>

<details>
<summary>What are best practices for using the two provided API keys?</summary>

> Use one for production and another for development. Refresh the development API key more often.

</details>

<details>
<summary>How can you refresh API keys without production service interruption?</summary>

> Since each resource provides two API keys, you can:
> 1. Switch production applications to reference API key 2.
> 2. Refresh API key 1.
> 3. Switch production applications back to using API key 1.
> 4. Refresh API key 2.

</details>

<details>
<summary>How does Azure Key Vault improve service security? How does it work?</summary>

> It allows you to consume Azure services without hardcoding the API key in an application's codebase.
> 
> Azure Key Vault admins provide access to a _security principal_, who can define a _managed identity_ for the application that needs access. During runtime, the application uses this managed identity to access the key vault and grab the API key, allowing it to consume the corresponding Azure AI Service.

</details>

<details>
<summary>What is token-based authentication? When is it required?</summary>

> Token-based authentication is when an API key is included in the initial request to use an Azure AI service. All subsequent requests are then authenticated for 10 minutes, after which authentication will need to happen again.
> 
> Token-based authentication is supported (and sometimes required) for REST API requests. Use of SDKs handles token authentication for you.

</details>

<details>
<summary>What is Microsoft Entra ID? How can you, and when is it appropriate to, use it for authentication?</summary>

> Microsoft Entra ID is a cloud-based identity and access management (IAM) service, which allows you to provision access to certain service principals and managed identities on Azure.
> 
> You can use it to assign permissions to a role, then add that role to users within your Azure subscription. It is good to use when designing applications meant for use within your organization.

</details>

<details>
<summary>What is Network Security?</summary>

> Network security is limiting the range of IP addresses that can access an Azure AI service.

</details>

<details>
<summary>By default, which IP addresses can consume Azure AI services?</summary>

> _All of them_! This is why network security is so important.

</details>

### Monitoring Azure AI Services

<details>
<summary>Why is monitoring Azure AI services so important?</summary>

> Like any cloud-based service, monitoring is essential to track costs, identify utilization trends, and detect potential issues.

</details>

<details>
<summary>How can you estimate the cost for your AI applications?</summary>

> You can view cost structures in service documentation, and you can use the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)!

</details>

<details>
<summary>How can you view costs for Azure AI services?</summary>

> In the Azure portal, you can view costs for your subscription with the _Cost Analysis_ tab. You can add a filter to only view costs for AI (i.e., _Cognitive_) services.

</details>

<details>
<summary>How does Azure support alerts?</summary>

> Alert rules can be implemented for each service. These rules are based on event or metric thresholds.

</details>

<details>
<summary>What are the five levels of alerts? How should each be monitored or used?</summary>

> 1. _Critical_ alerts mean there is an urgent problem that needs attention.
> 2. _Errors_ also indicate urgent problems that need immediate attention.
> 3. A _warning_ means something needs attention very soon.
> 4. _Informational_ alerts are useful to check once a week or so.
> 5. _Verbose_ alerts are only helpful when connected to a dashboard or something similar.

</details>

<details>
<summary>What pieces of information need specified when creating an alert rule?</summary>

> 1. The alert rule's _scope_ (the resource it is monitoring).
> 2. An alert condition, meaning the event it is looking for or the metric threshold that must be exceeded.
> 3. An action, like sending an email to notify someone of the alert.
> 4. Alert details, such as the name of the alert and the resource group that defines it.

</details>

<details>
<summary>What does Azure Monitor automatically track for AI services?</summary>

> * Endpoint requests
> * Data submitted
> * Data returned
> * Errors

</details>

<details>
<summary>By default where can you view metrics related to a resource?</summary>

> Metrics can be viewed for an individual resource on that resource's _Metrics_ page. You can create charts of different aggregation levels and add them to the _Metrics_ page.

</details>

<details>
<summary>How can you view metrics for multiple resources at once?</summary>

> Create a dashboard in the Azure portal. You can have up to 100 named dashboards, in which you can add metrics from multiple resources.

</details>

<details>
<summary>What service allows you to log information about your resources and applications? How can you view and analyze logged data?</summary>

> You can log information with diagnostic logging. Typically logs get sent to Azure Event Hub for storage, and then you can access and analyze these events in Azure Log Analytics. You can also send older log data to Azure Storage for archiving and occasional retrieval.

</details>

<details>
<summary>When setting up diagnostic logs, what attributes do you need to specify?</summary>

> * A name for the settings.
> * The categories of event data that you want to capture.
> * Retention policy for the logged data.
> * Details of the destinations for the data.

</details>

<details>
<summary>For setting up diagnostic logging, where can I find more details?</summary>

> At the [Azure diagnostic logging](https://learn.microsoft.com/en-us/azure/ai-services/diagnostic-logging) page.

</details>

<details>
<summary>How long does it take after logging setup before data can be viewed and queried in Azure Log Analytics?</summary>

> About one hour.

</details>

### Containerizing Azure AI Services

<details>
<summary>Why might you want to deploy an Azure AI service on prem?</summary>

> * To keep sensitive data on the same network without sending it to the cloud.
> * To reduce latency between the AI service and the local data.

</details>

<details>
<summary>What is a container? Why are they useful?</summary>

> A container comprises an application and the runtime components needed to run it. Containers are great because they are portable across hosts, meaning they can be run on many different types of operating systems or hardware. Also, a single host can support running multiple containers at once.

</details>

<details>
<summary>What are commong ways of deploying a container?</summary>

> Deploy it locally or on a private network that is running a Docker server.
> Deploying on an Azure Container Instance.
> Deploying on an Azure Kubernetes Cluster.

</details>

<details>
<summary>What is the process of hosting an AI Service container locally? How is does Azure take care of billing?</summary>

> 1. Find and download the container image for the service you need from Microsoft Container Registry.
> 2. Run the container (it will host endpoints) and use it as you would use the service on the cloud.
> 3. Periodically utilization metrics will be sent to Azure AI Services for billing purposes.

</details>

<details>
<summary>What details must be passed when deploying an Azure AI Service container?</summary>

> 1. An API Key for billing purposes.
> 2. The URI endpoint (for billing).
> 3. A value of "Accept" for the EULA.

</details>

### Azure AI Content Safety

<details>
<summary>What is Azure AI Content Safety?</summary>

> An Azure AI service designed to make it easy to include advanced content safety capabilities into applications.

</details>

<details>
<summary>What are four drivers of the need for online content safety?</summary>

> 1. Human- and AI-generated content continues to exponentiall increase online, including harmful content.
> 2. There is growing regulatory pressure to regulate online content.
> 3. Users need transparency in content moderation standards and enforcement.
> 4. Content is increasingly more complex (i.e. multi-modal).

</details>

<details>
<summary>How can you easily play with Content Safety features?</summary>

> In Azure AI Foundry! Content Safety is a tab in the application.

</details>

<details>
<summary>What are some features of Content Safety?</summary>

> With Content Safety you can:
> * moderate text content
> * detect hallucinated content from LLMs
> * identify protected (i.e. copyrighted) material in LLM output
> * implement prompt shields (guard against jailbreak and indirect attacks)
> * moderate image content
> * customize your own content filtering

</details>

<details>
<summary>In what four categories does Content Safety classify content?</summary>

> It can classify content as including hate, sexual, self-harm, or violent.

</details>

<details>
<summary>What are the severity levels for each category?</summary>

> For text moderation, each class is given an integer from 0 (no risk) to 6 (high, urgent risk). For image moderation each class is given a score of safe, low, or high.

</details>

<details>
<summary>What do specified thresholds accomplish for content moderation tasks?</summary>

> The threshold level determines what content is automatically allowed in an application. For example, if an image content moderation threshold is set at "medium", and someone submits an image that has a "high" rating on any of the four categories, that image won't be allowed.

</details>

<details>
<summary>What are limitations of content safety?</summary>

> Content safety depends on AI algorithms, and they aren't perfect. To ensure they are working as good as possible, the algorithms should be evaluated (using classification metrics such as precision, recall, and F1 score). We might want to prioritize recall to avoid false negatives!

</details>

<details>
<summary>Even though content safety isn't perfect, what is a main advantage of using it?</summary>

> A primary advantage is its scale. It can check all incoming content and flag content that needs further moderation from humans.

</details>

## Azure AI Vision

### Image Analysis

<details>
<summary>What is image analysis?</summary>

> Image analysis is all about extracting information from images.

</details>

<details>
<summary>What different image analysis tasks can you accomplish with Azure AI Vision?</summary>

> * DenseCaptions – Developing a caption for an image
> * Tags – Identifying tags that are fitting for an image
> * Detecting people and objects in images
> * Determining the format and size of an image
> * Classifying an image, and determining if it contains known celebrities and/or landmarks
> * Detecting and removing the background of an image.
> * Image moderation ... determining if an image contains adult or violent content.
> * Optical character recognition (OCR)
> * Smart thumbnail generation, which looks at what part of an image would be best for a thumbnail, then generates a thumbnail from that image.

</details>

<details>
<summary>Generally how does the AI Vision API or SDK work?</summary>

> You make a call to Azure AI Vision, including the image to analyze and the visual features to include in the analysis (one or many of the tasks AI Vision can handle).

</details>

### Azure AI Custom Vision

<details>
<summary>What three types of custom Azure AI Vision models are there?</summary>

> * Image classification models (multi-class or multi-label)
> * Object detection models
> * Product recognition models (object detection, but specifically trained for product labels and brand names)

</details>

<details>
<summary>What are the core components/steps of a custom vision project?</summary>

> * Create a blob storage container and upload the training images.
> * Create a dataset, specifying what type of custom vision project it is.
> * Label the data, which creates a COCO file.
> * Connect the COCO file to the images in the dataset.
> * Training the model (specify model type and training budget)
> * Evaluate performance and make predictions!

</details>

<details>
<summary>What is a COCO file and what are its key attributes?</summary>

> A COCO file is a JSON file with a specific format:
> * the _images_ attribute defines the location of images in blob storage and has the file name, width, height, etc.
> * the _annotations_ attribute defines the classifications (or objects) for the image and the bounding box/area for the classification (in the case of object detection)
> * the _categories_ attribute defines the classification categories

</details>

<details>
<summary>What Azure service allows you to label training images?</summary>

> Azure Machine Learning studio! You can use it to create a _Data Labeling project_

</details>

<details>
<summary>What is the training budget?</summary>

> An upper bound of time for how long the training will run.

</details>

<details>
<summary>How many images per class do you need to train a custom image classification model?</summary>

> At least 3-5 per class/label, but the more the better!

</details>

<details>
<summary>How can you access your custom image model after it has been trained?</summary>

> Through APIs or in Vision Studio.

</details>

<details>
<summary>What resources need provisioned to train and serve a Custom Vision model?</summary>

> * An Azure AI multi-service resource will take care of both training and prediction, or ...
> * An Azure AI Custom Vision training resource and a ...
> * Azure AI Custom Vision prediction resource

</details>

### Object detection

<details>
<summary>What are the two core components in object detection prediction?</summary>

> 1. The class label of each object in the image.
> 2. The location of each object in the image, represented as coordinates of a bounding box that encloses the object.

</details>

<details>
<summary>What services can you use for labeling images for object detection?</summary>

> * The Azure AI Custom Vision portal
> * Azure Machine Learning Studio Data Labeler
> * Microsoft Visual Object Tagging Tool (VOTT)

</details>

<details>
<summary>How are the bounding box values expressed?</summary>

> They are expressed by four values, each represents a proportional value relative to the image size
> * _left_ – the left coordinate of the bounding box
> * _top_ – the top coordinate of the bounding box
> * _width_ – the percentage of the image that the object's width takes
> * _height_ – the percentage of the image that the object's height takes

</details>

<details>
<summary>If you want to use the smart labeler, what do you have to do first?</summary>

> Tag some images with objects of each class and train an initial object detection model.

</details>

### Facial analysis, detection, and recognition

<details>
<summary>What are common tasks when it comes to facial detection?</summary>

> * Detect when a person is present
> * Identify a person's facial location
> * Recognize individuals

</details>

<details>
<summary>What two services provide facial detection capabilities?</summary>

> * Azure AI Vision can detect people in an image and will return a bounding box for the location of a face.
> * The Face service is best suited for the task and offers comprehensive facial analysis capabilities.

</details>

<details>
<summary>What are key considerations for facial analysis software when it comes to responsible AI?</summary>

> * Data privacy and security – facially data is PII!
> * Transparency – need to make sure users know how their facial data is used and who will be able to access it.
> * Fair and inclusive – need to ensure the AI system isn't used in a manner that is prejudiced or unfairly targets individuals.

</details>

<details>
<summary>If a person is detected using the Analyze Image function of the Azure AI Vision service, what attributes will be returned in the API response?</summary>

> There is a `peopleResult` attribute returned by the API. It will return a list of bounding boxes for each person detected and how confident it is about its prediction.

</details>

<details>
<summary>What capabilities does the Face service provide?</summary>

> * Face detection
> * Face attribute analysis (head pose, glasses, blur, exposure, noise, occlusion, face accessories, quality for recognition)
> * Facial landmark location (eye corners, pupils, tips of nose, etc.)
> * Face comparison (compare faces across many images for similarity)
> * Face verification (see if a face in one image is the same one in another)
> * Facial recognition (identify specific individuals)
> * Facial liveness (determine if a video stream is real or fake)

</details>

<details>
<summary>Which Face service features require approval through a Limited Access policy? Why?</summary>

> Facial recognition, comparison, and verification since those services are rich with PII.

</details>

<details>
<summary>How does facial comparison/verification work? Do these features preserve anonymity?</summary>

> When a face is detected, a GUID is assigned to the face and retained (cached) for 24 hours. Subsequent images can be compared to the cached data to determine if they are similar (comparison) or the same person (verification).
> 
> The way this works allows for comparison/verification anonymously, since the identity of the person doesn't actually need to be known.

</details>

<details>
<summary>How is facial recognition implemented?</summary>

> In facial recognition, you create a person group (e.g., employees, or family members, etc.), you add examples of each person to this group (ideally in multiple poses), and identify/label each person. Then you train. The identities of these individuals persist.

</details>

<details>
<summary>What can you do with a trained facial recognition model?</summary>

> A trained facial recognition model is stored in a Face/Azure AI service resource. It can be used to:
> * Identify individuals in images
> * Verify the identity of a detected face
> * Analyze images to find faces that are similar to known faces.

</details>

### Optical Character Recognition

<details>
<summary>What two Azure services are helpful for extracting text from images and documents?</summary>

> * Image Analysis (OCR) in Azure AI VIsion is great for extracting text from images and handwritten notes.
> * Document Intelligence extracts text from PDFs and documents that are more orderly (e.g., receipts, invoices)

</details>

<details>
<summary>What visual feature needs to be specified when calling Image Analysis for an OCR task? What is returned?</summary>

> You need to pass `VisualFeatures.READ`. In the response you will get an object for each line of text in the provided image. Within each object will be the text it found, the bounding polygon (x/y coordinates), and the confidence of the word extracted.

</details>

### Analyzing Video

<details>
<summary>What are features of Azure Video Indexer?</summary>

> Video Indexer is your one-stop-shop for extracting information from videos. It can do:
> * Facial recognition for people in the video
> * OCR for text in the video
> * Speech transcription for the video's audio
> * Topics – identify key topics for the video
> * Sentiment analysis on themes in the video
> * Labels – identify tags for the video
> * Moderate adult, harmful, or violent themes in the video
> * Segment the video into individual themes

</details>

<details>
<summary>What custom models can you train to extend Video Indexer's capabilities?</summary>

> * You can train the model to recognize certain people in the video, such as employees!
> * Domain specific language models can be trained to detect and transcribe this niche language.
> * Detect specific brands, products, companies, etc.

</details>

<details>
<summary>What are the two ways you can integrate Video Indexer into applications?</summary>

> * You can embed a Video Indexer widget onto your website!
> * You can use the Video Indexer API

</details>

<details>
<summary>Before you analyze a video with Video Indexer, what do you need to do first?</summary>

> You need to ulpoad the video to Azure Video Indexer and index it!

</details>

## Natural Language Processing

### Azure AI Language

<details>
<summary>What features does Azure AI Language provide?</summary>

> * Language detection for a passage of text
> * Key phrase extraction – pulling out important words and phrases from text
> * Sentiment analysis
> * Named entity recognition (NER) – detecting references to people, locations, time periods, organizations, etc.
> * Entity linking – identify specific entities and the link to appropriate Wikipedia articles

</details>

<details>
<summary>When making a call to Azure AI Language for language detection, what do you provide in the request and what is the response?</summary>

> You provide a list of passages of text (documents) and an identifier for each passage. The service responds with an object that provides an identified language for each passage and a confidence score from 0 to 1.

</details>

<details>
<summary>What will Azure AI Language do if submit a single passage that contains multiple languages?</summary>

> It will try and detect the dominant language in the passage. It only returns one language classification per passage.

</details>

<details>
<summary>If Azure AI Language can't determine the language of a passage, what classification is returned?</summary>

> It will return `(Unknown)` and a confidence score of 0.0.

</details>

<details>
<summary>When making a call to Azure AI Language for key phrase extraction, what do you provide in the request and what is the response?</summary>

> The request includes a list of passages and their language. In the response there will be a `keyPhrases` object, which is a list of strings, one entry per key phrase.

</details>

<details>
<summary>How does the sentiment analysis feature respond to an API call?</summary>

> It responds with the sentiment (negative, neutral, or positive) for each sentence in the passage. It also gives confidence scores for each classification for each sentence. It also provides an overall sentiment and confidence scores for the entire passage based on the scores of the individual sentences.

</details>

<details>
<summary>How does the entity recognition feature respond?</summary>

> For each passage provided, it will give a list of entities. For each entity it returns an object that specifies the entity name, category, location, and confidence score for its classification.

</details>

<details>
<summary>What is returned by the entity linking feature?</summary>

> For each passage it gives the name of the entity, its location within the text, a confidence score for the entity identification, and the wikipedia URL for the matched entity.

</details>

<details>
<summary>How does entity linking handle ambiguous entities? For example, people with the same name as cities?</summary>

> The entity linking service can handle ambiguous entities automatically.

</details>

### Question Answering systems

<details>
<summary>How does question answering differ from a conversational language understanding task?</summary>

> In question answering, a user submits a question and an answer is returned. NLP is used to help accomplish the task. In conversational language understanding, a user submits an utterance (can be a question), but they expect an action to be performed (e.g., Hey Siri, play Imagine Dragons on Spotify)

</details>

<details>
<summary>What are data sources that can be used to populate a QA knowledge base?</summary>

> * An FAQ document or a URL that contains an FAQ.
> * Files containing text from which questions and answers can be extracted.
> * QA chat sessoins that include common questions and answers.

</details>

<details>
<summary>What are multi-turn responses, and how can you implement them in the question answering feature of AI Language?</summary>

> A multi-turn response is one in which follow-up questions might be need in order to provide the correct answer. When setting up your knowledge based you can specify follow up prompts.

</details>

<details>
<summary>What attributes are sent in a request to the knowledge base API?</summary>

> * The `question` that needs answered.
> * `top`, the number of answers to be returned
> * A `scoreThreshold` for the answers that can be returned.
> * `strictFilters` to limit the response to answers that contain certain metadata.

</details>

<details>
<summary>What is returned in the knowledge base API's response?</summary>

> * A score for the percieved quality of the answer.
> * The answer
> * The question in the knowledge base that is associated with the answer.
> * Metadata attached to the answer.

</details>

<details>
<summary>How can you improve question answering performance?</summary>

> Through active learning and defining synonyms.
> * Active learning, enabled by default, suggests related phrasing for the questions you have in your QA database. Including these related phrases can improve the odds of a good answer match.
> * Defining synonyms means providing synonyms to keywords in your questions and answers to improve the likelihood of a good match.

</details>

### Conversational Language Understanding

<details>
<summary>What is a common design pattern for a natural language understanding solution?</summary>

> 1. A user inputs natural language into an application.
> 2. A language model determines the user's intent.
> 3. The app performs an appropriate action

</details>

<details>
<summary>What is the difference between pre-built and learned features of Azure AI Language? What are the examples of learned features?</summary>

> Pre-built features require no custom data, but learned features do and enable you to train your own custom models.
> 
> Azure AI Language learned features are:
> * Conversational language understanding
> * Custom named entity recognition
> * Custom text classification
> * Question answering

</details>

<details>
<summary>When providing a training set of utterances, what guidelines will help improve performance?</summary>

> * Provide a lot of alternative ways of saying the same thing.
> * Vary the length of utterances (short, medium, and long examples)
> * Vary where the noun or subject of the utterance is in the sentance (beginning, middle, and end).
> * Give examples with correct and incorrect grammar.
> * Give a lot of examples for each intent.

</details>

<details>
<summary>When labeling data for CLU applications, what are three key factors to improve performance?</summary>

> * Be precise in your labeling. Label each entity to its right type, and only include what you want extracted.
> * Be consistent in your labeling across examples.
> * Label completely – label all the instance of an entity in all the utterances.

</details>

<details>
<summary>What is the role of entities in CLU tasks? What key types of entities are there?</summary>

> Entities add context to user intents. For example, "turn the fan on" and "turn the light on" share the same intent, but only the entity differs.
> 
> The three key types of entities are:
> * A learned entity is most common, which is when you define a component and associate words and phrases with it in training data.
> * List entities include a specific set of possible values (think days of the week).
> * Prebuilt entities include numbers, datetimes, and names.

</details>

<details>
<summary>What prebuilt entities does Azure AI Language support out of the box?</summary>

> Age
> Number
> Percentage
> Dimensions
> Temperature
> Currency
> Number ranges
> Datetimes
> Names
> Email addresses
> Phone numbers
> URLs
> Companies and corporations
> Locations (cities, states, countries)
> IP addresses

</details>

<details>
<summary>What four step process can you iterate through to build a CLU model?</summary>

> 1. Train a model to learn intents and entities from example utterances.
> 2. Test the model interactively or useing a test dataset.
> 3. Deploy the model for use.
> 4. Review the performance of your model so you can include more training data and improve it.

</details>

### Text Classification

<details>
<summary>What types of text classification projects are there?</summary>

> There is single class classification (assigning one label to a body of text) or multi-class classification (assigning one or more labels to a body of text).

</details>

<details>
<summary>Why is improving multi-class classifiaction model performance more difficult than single-class?</summary>

> When performance is poor that means you need more training data specific to the classes your model is having a hard time predicting. For multi-label projects finding quality data is hard due to the different combinations of labels that can be assigned.

</details>

### Custom NER

<details>
<summary>When might you build a custom NER solution?</summary>

> If the entities you want to extract aren't part of the built-in service _or_ if you only want to extract specific entities.

</details>

<details>
<summary>What considerations should you make to boost performance of a custom NER solution?</summary>

> It's all about the data! Get training data that is:
> * Representative of what the model will see in the real world.
> * Use as diverse data as you can (including document types) that matches the distribution it will see in the wild.
> * Keep your entities as distinct as possible (not always easy or practical).

</details>

<details>
<summary>How many entity types can you define for the model to recognize?</summary>

> Up to 200 entity types!

</details>

<details>
<summary>What is the best way to label NER training data?</summary>

> Using Azure Language Studio!

</details>

### Translation

<details>
<summary>Azure AI Translator supports translation between how many supported languages?</summary>

> 90!

</details>

<details>
<summary>What translation tasks can you use Azure AI Translation for?</summary>

> * Language detection
> * One-to-one translation
> * One-to-many translation
> * Transliteration, which is the process of converting written text from one writing system (script) to another.

</details>

<details>
<summary>What kinds of resource must be provisioned to use Azure AI Translator?</summary>

> Either a single-service Azure AI Translator resource, or the Text Analytics API in a multi-service AI Service resource.

</details>

<details>
<summary>When hitting the `detect` function of the translator API, what is returned?</summary>

> * The detected language for the input text.
> * The confidence score for the detection.
> * Whether translation is supported.
> * Whether transliteration is supported.

</details>

<details>
<summary>When hitting the `translate` endpoint, what must you provide?</summary>

> * The text to translate.
> * The language to translate _from_.
> * The language (s) to translate to.

</details>

<details>
<summary>When using the `transliterate` endpoint, what must you provide?</summary>

> * The text to transliterate.
> * The input script.
> * The desired output script.

</details>

<details>
<summary>What does the word alignment parameter do in the `translate` endpoint when set to true?</summary>

> It will provide a numerical mapping of how the characters in the input text relate to the characters in the output text. For example, "Good morning" to "Buenos diás" would show 0:3-0:5 5:11-7:10 to show that "good" maps to "buenos" and "morning" maps to "diás".

</details>

<details>
<summary>What does `includeSentenceLength` in the `translate` endpoint do when set to true?</summary>

> In the translation response it will include the character length of the input and translated texts. This can be helpful when determining how to display the translated text.

</details>

<details>
<summary>What profanity filtering options are there in the translation service?</summary>

> There is a `profanityAction` parameter, which can be set to the following:
> * `NoAction` will translate profanity along with the rest of the text.
> * `Deleted` will remove profanities from the translation.
> * `Marked` replace translated profanities with asterisks.

</details>

<details>
<summary>When might you need to train a custom translation model? What do you need to include as your training data?</summary>

> When the default translation model doesn't cut it. This might happen if you are in an industry with a very specific vocabulary. Your training data will be parallel documents, where one document (the target) is a translation of the other (the source).

</details>

<details>
<summary>How many training examples are recommended for training a custom model?</summary>

> Azure recommends 10,000 parallel words to train a model.

</details>

<details>
<summary>When you train a custom translation model, how can you use it to make translations?</summary>

> You can use the `translate` endpoint. When the model is trained it will be assigned a unique `categoryId`, which you will include in the request to the translation service.

</details>

### Speech Recognition (speech to text)

<details>
<summary>What are the various APIs that Azure AI Speech provides for various speech-related tasks?</summary>

> * Speech to text
> * Text to speech
> * Speech translation
> * Speaker recognition (determine which individual is talking based on their voice)
> * Intent recognition (determine the semantic meaning of spoken input)

</details>

<details>
<summary>What type of resource must be provisioned to use Azure AI Speech capabilities?</summary>

> Either an Azure AI Speech resource or a multi-service Azure AI Services resource.

</details>

<details>
<summary>When using the speech-to-text SDK, what objects will you have to set up?</summary>

> * A `SpeechConfig` object will contain info to authenticate with Azure (the API key).
> * An `AudioConfig` object will house details on the input audio. It will default to the microphone, but can be changed to a third party microphone or an audio file.
> * A `SpeechRecognizer` object is a proxy client for the API.
> * The speech recognizer object has functions you can call like `RecognizeOnceAsync()` which will trasncribe a single utterance.

</details>

<details>
<summary>What attributes are returned by the `RecognizeOnceAsync()` function?</summary>

> * The `duration` of the recognized speech.
> * The `reason` for the result, either `RecognizedSpeech` (yay!), `NoMatch`, meaning no speech was recognized in the audio, or `Cancelled`, meaning an error occurred.
> * The transcribed `text` if the transcription was successful.

</details>

<details>
<summary>What two APIs support speech recognition (speech to text)?</summary>

> The speech to text API, which is meant for live inference, and the speech to text short audio API, which supports audio less than 60 seconds. You can use the speech to text API for live and batch operations.

</details>

### Speech Synthesis (text to speech)

<details>
<summary>What two APIs support speech synthesis (text to speech)?</summary>

> The _text to speech_ API, and the _batch synthesis_ API, which is optimized for batch operations.

</details>

<details>
<summary>What type of object will handle speech synthesis in the Azure AI Speech SDK?</summary>

> You must instantiate a `SpeechSynthesizer` object, which is a proxy client for text to speech API.

</details>

<details>
<summary>What will be returned by the speech synthesizer's `SpeakTextAsync()` method?</summary>

> * `AudioData` is the output for the speech. This will be the device's speaker or a file based on the configs.
> * The `Reason` will be either `Cancelled` (error) or `SynthesizingAudioCompleted` if successful.

</details>

<details>
<summary>What options can be specified in the SpeechConfig object for a speech synthesis task?</summary>

> You can specify:
> * The audio format, such as the file type and sample rate.
> * The voice to use in the spoken speech. These can be synthetic or more natural sounding.

</details>

<details>
<summary>What is Speech Synthesis Markup Language (SSML) and when/why might you use it?</summary>

> SSML is an XML-based syntax that offers greater control over how the spoken output sounds. It is helpful if you want to specify the following options for your spoken output: a speaking style (e.g., _cheerful_), inserting pauses, certain phonemes, or inserting recorded speech or audio.

</details>

<details>
<summary>How can you change the voice used in speech synthesis?</summary>

> You need to set the `SpeechSynthesisVoiceName` property of the `SpeechConfig` object to the desired voice name.

</details>

### Speech Translation

<details>
<summary>When using Azure AI Speech SDK for speech translation, what does the SpeechTranslationConfig object specify?</summary>

> * The location and key for you Azure AI Speech resource.
> * The speech recognition language
> * The target language(s) into which the speech should be translated

</details>

<details>
<summary>What object acts as a proxy client for the Azure AI Speech translation API, and what helpful function will translate a single spoken utterance?</summary>

> The `TranslationRecognizer` object, and it's helpful function is `RecognizeOnceAsync()`!

</details>

<details>
<summary>What attributes will be in the response from Azure AI Speech for a speech translation task?</summary>

> * The `Duration` of the recognized speech.
> * The `Text` of the recognized speech.
> * The `Translations` of the recognized speech in the specified target languages.
> * The `Reason` for the result. `RecognizedSpeech` if successful, `NoMatch` if no spoken word was detected, or `Cancelled` if there was an error.

</details>

<details>
<summary>If you want to synthesize the translated transcription (i.e., speech-to-speech translation), how can you accomplish this?</summary>

> For 1:1 translation, you can specify the desired voice for the translated speech in the `TranslationConfig` object. Then create an event handler using `TranslationRecognizer.Synthesizing` events. In the event handler result, `GetAudio()` will retrieve the byte stream of translated audio.
> 
> For one-to-many translations you need to synthesize the speech manually, meaning you'll have to take the translated text and pass it through a `SpeechSynthesizer` object. 

</details>

## Knowledge Mining with Azure AI Search

<details>
<summary>What are the pricing tiers for Azure AI Search resources, and what do they offer?</summary>

> * The free tier (F) is great for trying out the product.
> * The basic tier (B) supports up to 15 indexes and 5 GB of indexed data.
> * The standard tier (S) is for enterprise-scale solutions. There are multiple variants in this tier for larger index sizes and quantity.

</details>

<details>
<summary>In the context of search services, what are replicas and partitions?</summary>

> Replicas are the number of nodes in a cluster. Increasing the number of replicas increase the number of concurrent queries the service can handle.
> Partitions divide an index into multiple storage locations, allowing queries and index rebuilds to be distributed.

</details>

<details>
<summary>What are the components of an Azure AI Search solution?</summary>

> * A data source, which is JSON data. But this can be data in Azure blob storage, Azure SQL tables, or Cosmos DB documents.
> * AI skills to enrich data with additional insights.
> * An indexer, which can run at regular intervals or on demand.
> * An index (the product of an indexer)

</details>

<details>
<summary>What are some examples of AI skills that you might use in an AI Search solution?</summary>

> * Detecting the language of text.
> * Extracting key phrases from text.
> * Determining the sentiment of text.
> * Identify entities in the text.
> * Generate descriptions of images or extract text from images.
> * Custom skills.

</details>

<details>
<summary>What attributes can be configured for the fields in an index?</summary>

> * `key` - fields that define a unique key
> * whether the field should be `searchable`
> * wether the field should be `filterable`
> * wether the field should be `sortable`
> * wether the field should be `facetable`, which gives the user the ability to drill-down/filter results based on values.
> * wether the field should be `retrievable`, or included in results

</details>

<details>
<summary>What are common parameters included in a full text search in Azure AI Search? (Lucene query syntax)</summary>

> * The `search` term
> * Whether the query is using the simple or full query syntax (`queryType`)
> * `searchFields` are the fields to be searched
> * Secify the fields to return in the result with `select`
> * For multi-word search terms, `searchMode` will allow you to specify if you want to match documents according to _Any_ or _All_ of the terms.

</details>

<details>
<summary>What are the four stages for how a query is processed?</summary>

> 1. The search term is evaluated and reconstructed as multiple subqueries.
> 2. Query terms are refined and normalized (e.g., converted to lowercase, stopwords are removed, words are trimmed down to their root, etc.). This is called _lexical analysis_.
> 3. Terms are matched against the indexed documents, and matching documents are identified.
> 4. Matching documents are scored, sorted, and returned.

</details>

<details>
<summary>How can you present facet options to a user?</summary>

> You can search for all documents (*) and facet by the appropriate field. This is best done on fields with a smallish number of discrete values. When the user selects one of these facets, include that in the filter parameter of the next search.

</details>

<details>
<summary>What syntax would you use if you wanted to filter an AI Search index to include books printed in 2024 and sort them by the latest print date?</summary>

```
$filter=print_year eq '2024'
$orderby=print_date desc
```

</details>

<details>
<summary>What functionality is provided when you add a suggester to an index?</summary>

> * _Suggestions_ allow you to get a list of suggested results as the user types in the search box (without submitting the search query)
> * Or you can `autocomplete` partially typed search terms based on the vales in indexed fields.

</details>

<details>
<summary>What is custom scoring?</summary>

> The default relevance scoring algorithm is [term-frequency/inverse-document-frequency](https://en.wikipedia.org/wiki/Tf%E2%80%93idf#:~:text=In%20information%20retrieval%2C%20tf%E2%80%93idf,the%20rest%20of%20the%20corpus.) (TF/IDF). But you can customize how the score is calculated!
> 
> You can also _boost_ results as you need. For example, you can increase the relevancy score for more recent documents.

</details>

<details>
<summary>How can you appropriately handle synonyms in a search index?</summary>

> You can define synonym maps to link related terms together.

</details>

### Custom Skills

<details>
<summary>What are some use cases where a custom skill could be helpful for enriching an AI Search index?</summary>

> * You need to use document inelligence to extract data from forms.
> * Using an Azure Machine Learning model to get predicted values into an index.
> * Perform text classification!

</details>

<details>
<summary>How do you define a custom skill, and what must be included?</summary>

> Custom skills are defined in JSON. They must include:
> * The endpoint and parameters for calling the inference service.
> * Specify at which point in the document hierarchy the skill should be called. This is called the _context_.
> * Assign input values (fields from the data sources)
> * Specify which fields to store the outputs.

</details>

<details>
<summary>What are the different hierarchy levels of skill context, and when are they appropriate?</summary>

> * The default is `document`, which means the skill will be applied across the entire document.
> * Another common one is `document/pages/*`, which will be applied to each chunk of text on each page individually. This is great for sentiment use cases.
> * Another common context is `document/normalized_images/*`, which will be applied for each image. This is great for image analysis use cases.

</details>

<details>
<summary>What do the timeout and degreeOfParallelism settings do when creating an ML skill?</summary>

> Timeout sets the number of seconds before a skill will move on to the next document. Degree of parallelism controls how many documents are processed by the skill at once. Best practice is to begin at "one" and scale up as necessary (and as resources allow).

</details>

<details>
<summary>To use an Azure ML model as a skill, how must it be deployed?</summary>

> At current it has to be deployed as a web service endpoint and the endpoint has to be an Azure Kubernetes Service cluster. ML Studio can create and manage the cluster for you.

</details>

<details>
<summary>Once you have an ML model to use as a custom skill, how do you add the output of that skill to an index?</summary>

> 1. Add a field to your index where you will store the output from the model.
> 2. Update the index skillset and add the `#Microsoft.Skills.Custom.AmlSkill`.
> 3. Change the indexer to map the output from the custom skill to the field you just created.
> 4. Rerun the indexer!

</details>

<details>
<summary>What built-in skills are available?</summary>

> There are [lots of them](https://learn.microsoft.com/en-us/azure/search/cognitive-search-predefined-skills)! In general, the following types of skills are built in:
> * Text analysis/NLP
> * Image analysis
> * Translation
> * Document intelligence
> * OpenAI Embedding

</details>

### Knowledge Stores

<details>
<summary>What is a knowledge store?</summary>

> A knowledge store is a table-like output for a skill-enriched search index.

</details>

<details>
<summary>What is a projection? What is best practice for defining a projection's schema?</summary>

> Projections define the schema for tables, objects, and files in a knowledge store. Since the schema for individual documents can vary bases on the skills applied, the output schema can vary. To help with this, there is a _Shaper_ skill which allows you to map skill output to a well-structured schema for use in a knowledge store.

</details>

<details>
<summary>How do you create a knowledge store?</summary>

> Create a `knowledgeStore` object in the skillset that defines the projections (tables) and specifies storage account information. Projections can be tables, files, and objects. Each type needs to be defined separately.

</details>

### Advanced AI Search Features

<details>
<summary>What is term boosting, and how is it implemented?</summary>

> Term boosting gives higher relevancy scores to certain terms in the index. You can specify the fields in which these terms should reside. This is implemented with the Lucene query syntax carat (`^`) (e.g., `Category:luxury^3` to triple the score for items with "luxury" in the category field).

</details>

<details>
<summary>What are scoring profiles and how can you apply them?</summary>

> A scoring profile allows you to customize how the final scoring of terms is implemented. You can set a custom scoring profile as a default, or you can specify a scoring profile using the Lucene query syntax.

</details>

<details>
<summary>What are functions that you can use in a scoring profile?</summary>

> * `distance` to boost search results that are nearer to the search location
> * `freshness` to boost newer or older results
> * `magnitude` to boost results based on the value in a numeric field
> * `tag` to boost results based on tags that are in the data

</details>

<details>
<summary>What is an analyzer in AI Search, and what options do you have if you don't want to use the default?</summary>

> An Analyzer is what breaks the data in the index into more useful terms, such as normalizing text and removing stopwords. By default the Lucene analyzer is used, which is best for most use cases. You can also choose:
> * A language analyzer, which includes capabilities such as lemmatization, word compounding, and entity recognition for 50 languages.
> * Specialized analyzers for fields like zip codes and product identifiers.
> * You can also define and test your own!

</details>

<details>
<summary>How can you augment and index to include multiple languages?</summary>

> 1. Identify the fields that need translation.
> 2. Duplicate those fields for each language you want to support.
> 3. Use Azure AI Services to translate the text and store the output in the created fields.
> 4. During search, limit the fields that you will search to the appropriate language.

</details>

<details>
<summary>What geospatial functions does AI Search include and how do you use them?</summary>

> The two functions are:
> * `geo.distance`, which returns the distance (in km) in a straight line between the input point and search results.
> * `geo.intersects`, which returns `true` if the location of a search result is within an input polygon.
> 
> To use these, there should be a _location_ field in the index with type `Edm.GeographyPoint`. You can use these functions in a filter, in a sort, or in a search term.

</details>

### External Data Sources

<details>
<summary>How can you get data from sources outside of Azure into an AI Search Index?</summary>

> * Bring those sources into Azure using Azure Data Factory! You can specify a Search Index as a sink in a Data Factory pipeline.
> * Add data directly to an index using the AI Search REST API.
> * Use an SDK like C#!

</details>

<details>
<summary>What are limitations of directly sinking ADF data into an AI Search Index?</summary>

> Complex data types such as arrays, objects, and other complex types aren't supported.

</details>

### AI Search Monitoring, Security, and Maintenance

<details>
<summary>What data are encrypted whne using AI Search?</summary>

> Data are encrypted in transit and at rest. This includes indexes, data sources, skillsets, and indexers.

</details>

<details>
<summary>What three areas of focus should be considered when thinking about solution security?</summary>

> 1. Incoming search requests
> 2. Outbound requests from the search solution to the user
> 3. Restricting access at the document level to certain searchers

</details>

<details>
<summary>How can you restrict inbound access to the search service?</summary>

> * Implement a free firewall to restrict who can access the service. This can be done even if the serice is used in a public-facing application or website.
> * Require authentication using admin or query keys

</details>

<details>
<summary>How can you determine who can search which documents?</summary>

> You need to update each document with a role or group that specifies permissions. When this is done, you can use these roles/groups in the filter of the search syntax. This requires the user to be authenticated.

</details>

<details>
<summary>How do you enable diagnostic logging for a search service?</summary>

> * In the Azure portal, under _Diagnostic settings_, select **+ Add diagnostic settings**.
> * Select **allLogs**, **AllMetrics**, and **Send to Log Analytics workspace**

</details>

<details>
<summary>How will you know if the search service is being throttled?</summary>

> If user searches are being throttled it will be captured in Log Analytics as a 503 response. If the indexes are being throttled they will show up as 207 responses.

</details>

<details>
<summary>How can you check the performance of individual queries?</summary>

> The best way is with a client request tool like Postman.

</details>

<details>
<summary>What typically makes searches take longer?</summary>

> Searches take longer for indexes that are larger (more fields, more records) and complex (more fields searchable, facetable, etc.). To reduce search time, reduce the number of records and/or the complexity.

</details>

<details>
<summary>What are ways to improve query performance?</summary>

> * Only specify the fields that you need to be searchable.
> * Only return the fields that are absolutely necessary.
> * Avoid prefix searches or regular expression since they are more computationally expensive.
> * Avoid high skip values.
> * Limit facetable and filterable fields to those with a small number of discrete values.
> * Use search functions instead of individual values in filter criteria.

</details>

<details>
<summary>Which perform better, a smaller tier service with more partitions or a bigger tier service with fewer paritions, even if they cost the same?</summary>

> The larger tier service will have more powerful compute resources, memory, and provides opportunities to scale for future growth. Go with that one!

</details>

<details>
<summary>When estimating costs for an AI Search solution, what are all the different components that can contribute to costs?</summary>

> * The search service itself.
> * Data storage costs (e.g., Blob Storage or Azure SQL)
> * Skills.

</details>

<details>
<summary>What SLAs are guaranteed for search solutions?</summary>

> If you have two replicas there is a 99.9% availability guarantee for queries. Three replicas or more gives 99.9% guarantee for queries and indexing.

</details>

<details>
<summary>What is the best way to manage service costs?</summary>

> Monitor and set budget alerts for search resources.

</details>

<details>
<summary>Which three metrics can be viewed in graphs without any other configuration?</summary>

> Search latency, queries per second, and percentage of throttled queries.

</details>

### Semantic Ranking

<details>
<summary>What is semantic reranking?</summary>

> Semantic reranking leverages natural language understanding to re-rank the results after the initial BM25 ranking function.

</details>

<details>
<summary>What are semantic captions and answers?</summary>

> Semantic captions extract summary sentences from the the document and highlight the most relevant text in summary sentences.
> 
> If the search query appears to be a question, and the search results contain text that appears to be the answer, a semantic answer will be created and returned.

</details>

<details>
<summary>How does semantic ranking work?</summary>

> The top 50 results from the BM25 ranking are grabbed. These results are converted into strings, trimmed to 256 tokens, then passed to an ML model to determine the semantic caption/answer. Then the results are ranked based on the relevance of the caption/answer and returned in descending order of relevance.

</details>

<details>
<summary>Will semantic ranking result in returning results not originally grabbed by the BM25 algorithm?</summary>

> No.

</details>


<details>
<summary>How many semantic ranking queries per month do you get for free?</summary>

> One thousand! Any more and you should choose standard pricing.

</details>

<details>
<summary>How do you add semantic ranking to an index?</summary>

> In the Azure portal, select the index of interest and select the **Semantic configurations** tab. Then go from there!

</details>

### Vector Search and Retrieval

<details>
<summary>What is vector search?</summary>

> Vector search is the capability to index, store, and retrieve vector embeddings from a search index.

</details>

<details>
<summary>What types of data can benefit from vector searches?</summary>

> Whatever you can make embeddings out of! This includes text, video, images, and audio data sources.

</details>

## Misc questions based on the practice exams

<details>
<summary>You use Azure AI services on an app that is deployed to an Azure VM. Firewall rules are enabled. What should you do to ensure the app can access the AI service through a service endpoint?</summary>

> There are two potential routes. One is adding an IP range to the firewall rules to include the virtual machine. The better answer is allowing access to a virtual network, which is where the virtual machine resides.

</details>

<details>
<summary>When making a request to Azure OpenAI, what pieces of information need to be included in the header?</summary>

> * The OpenAI resource name, 
> * the API version, and 
> * the deployment ID.

</details>

<details>
<summary>When making a request to Azure OpenAI, what is the only body attribute that is required?</summary>

> The prompt!

</details>

<details>
<summary>What does a "mismatch" mean when using an API key for an Azure AI Services container application?</summary>

> It means the API key is valid, but it is for the wrong type of resource!

</details>

<details>
<summary>With conversational language understanding do you need to train different models to support multilingual use cases?</summary>

> Why no! CLU models are multilingual by default!

</details>

<details>
<summary>If you have an Azure App Services web application, and you want to authenticate the AI services it uses via Microsoft Entra ID, what should you do?</summary>

> Enable a managed identity from the application and assign role-based access control (RBAC) permissions to Azure AI Services.

</details>

<details>
<summary>What are two prerequisites to enabling diagnostic logging on an Azure AI Services resource?</summary>

> 1. A Log Analytics workspace.
> 2. An Azure Storage account.

</details>

<details>
<summary>Can an API key be invalid if it is for the correct type of resource, but for the wrong region?</summary>

> Yes!

</details>

<details>
<summary>When will Azure OpenAI automatically update a model version even if auto-update is disabled?</summary>

> This can happen when the model version reaches its retirement date.

</details>

<details>
<summary>In the DALL-E model's response, how does it provide images and thumbnails, and in what response object?</summary>

> These will be found in the `result` element, and it will contain a collection of URLs that link to the PNG image(s) generated from the prompt.

</details>

<details>
<summary>What are valid attributes to include in the body of a call to the DALL-E 3 Azure OpenAI model?</summary>

> * The user's prompt
> * The quality of the generated images
> * The style of the generated images
> * There are a ton of them.

</details>

<details>
<summary>What is Azure OpenAI's "User your data" feature?</summary>

> It is a REST API/SDK that helps with RAG use cases. You can upload files to Azure OpenAI studio, and data will be cracked, chunked, and embedded. Then you can develop and deploy an Azure OpenAI model for prompting. 

</details>

<details>
<summary>What are helpful parameters with Azure OpenAI on your data?</summary>

> * You can limit responses to only include those relevant to the data you provided. For example, if the user asks about the weather, the model won't respond.
> * You can specify the number of documents to retrieve (3, 5, 10, or 20).
> * You can specify how strict (`strcitness`) the model is in filtering out search documents based on their similarity scores.

</details>

<details>
<summary>What are three best practices for prompt engineering strategies?</summary>

> 1. Be Descriptive – the more details the better!
> 2. Be Specific – tell the model exactly what to expect and what you want it to do.
> 3. Order Matters – the order in which you present information will affect the output!

</details>

<details>
<summary>When running an Azure AI Search indexer for the first time, what exact steps are occuring behind the scenes?</summary>

> * Document cracking (opening files and extracting content)
> * Field mapping
> * Skillset execution
> * Output field mapping
> * Pushing to an index

</details>

<details>
<summary>When defining a skillset for Azure AI Search, what are the minimum sections that need to be included in the definition?</summary>

> The `name`, `description`, and `skills`. If you are sending skill output to a knowledge store then you must include the `knowledgeStore` parameter. If you are using some billable skills then you need to include `cognitiveServices`.

</details>

<details>
<summary>What three document formats does the Azure AI Document Intelligence pre-built read model support?</summary>

> * Excel
> * Word
> * PDFs

</details>

<details>
<summary>In a text analysis-based app you are performing sentiment analysis. What attributes can you include in the API requests the app makes and what do those attributes do?</summary>

> * `opinionMining` will make sentiment very granular (i.e., identifying both positive and negative sentiments in a single sentence)
> * `loggingOptOut` will opt out of logging

</details>

<details>
<summary>What are different types of PII that the PII detection feature will detect automatically?</summary>

> * `Person` – names
> * `Age` – people's ages
> * `DateTime` – dates and time values
> * `PhoneNumber` – phone numbers
> * `PersonType` – job types/roles
> * `Organization` – companies, political groups, bands, sports teams, etc.
> * `Email`
> * `URL`
> * `IPAddress`

</details>

<details>
<summary>What are common errors with speech-to-text, and how do you resolve them?</summary>

> * A _substitution error_ is when a word is different in the text than in the speech. This typically happens when domain-specific terms aren't in the corpus and you need to provide examples of these terms.
> * An _insertion error_ occurs when words are added to the text that aren't in the speech. These can happen in noisy environments and words from other conversations are included in the text.
> * A _deletion error_ occurs when words in the speech aren't in the text. This typically means weak audio signal strength, and you should get the microphone closer to the source.

</details>

<details>
<summary>In speech-to-text tasks, what is the word error rate (WER), and how is it calculated?</summary>

> It is the number of insertions, deletions, and substitions divided by the total number of words.

</details>

<details>
<summary>What is a good WER in speech-to-text tasks?</summary>

> 5% to 10% is considered good quality and ready to use.

</details>

<details>
<summary>Does the base speech-to-text model support noisy environments?</summary>

> Not really. If you have a lot of ambient noise in your data you might want to train a custom speech-to-text model.

</details>

<details>
<summary>What is pattern matching in CLU?</summary>

> Pattern matching uses the Speech SDK and is helpful when you are only interested in matching strictly what the user said.

</details>

<details>
<summary>What is the Bilingual Evaluation Understudy (BLEU) score, what does it do, and what is its scale?</summary>

> BLEU is an algorithm for evaluating machine translation. It ranges from 0 to 100, with 100 being perfect. A score between 40 and 60 indicates a high-quality translation.

</details>

<details>
<summary>Which colors can the Image Analysis API detect as the dominant background color of an image?</summary>

> black, blue, brown, gray, green, orange, pink, purple, red, teal, white, and yellow.

</details>

<details>
<summary>What two types of CLU models are there?</summary>

> Standard and advanced. Standard is the default and works for English language only. It is provided free of charge. Advanced training leverages the latest in ML technology, will result in higher scores, and will enable multilingual capabilities. It is more expensive to do it this way.

</details>

<details>
<summary>What is the orchestration workflow feature in Azure AI Language?</summary>

> Orchestration workflows allow you to connect CLU, Q&U, and language understanding applications. They can be developed in Language Studio.

</details>

<details>
<summary>If a multilingual CLU app is performing poorly, what can you do?</summary>

> Provide more utterances in languages that are performing poorly. Reminder ... CLU applications are multilingual by default.

</details>

<details>
<summary>What is active learning in the context of a Q&A app?</summary>

> Active learning will automatically generate suggestions of data based on user queries that don't have great answers. It takes at least 30 minutes for these suggestions to start showing up once it has been enabled (it is enabled by default for custom QA models).

</details>

<details>
<summary>What influences the price of a QA service?</summary>

> Pricing depends on the throughput (utilization), the size of the knokwledge base, and the number of knowledge bases.

</details>

<details>
<summary>For the Azure AI Face service, what are the different detection models, and what are their strengths?</summary>

> * `detection_01` is the default model that works best overall.
> * `detection_02` improves accuracy on small, side-view and blurry faces. It doesn't return face landmarks.
> * `detection_03` has even further improved accuracy, can detect masks, but not other accessories.

</details>

<details>
<summary>What does the spatial analysis feature of Azure AI Vision do?</summary>

> It detects the presence of people in a video feed.

</details>

<details>
<summary>If users of a Document Intelligence app note that they can't process some documents, what could be the problem?</summary>

> For an S0 instance of the app it can handle 500mb documents with 2k pages (i.e. most documents), so the likely issue is password-protected files.

</details>
