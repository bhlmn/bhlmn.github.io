+++
title = "Azure AI Engineer Study Guide"
date = 2024-11-14T12:22:00-07:00
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

<details>
<summary>Placeholder question</summary>

> Answer

</details>
