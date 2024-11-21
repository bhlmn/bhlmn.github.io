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
<summary>Placeholder question</summary>

> Answer

</details>
