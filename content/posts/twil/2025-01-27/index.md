+++
title = "TWIL – Week of January 27, 2025"
date = 2025-01-31T17:13:00-08:00
draft = false
tags = ['TWIL', 'AI Privacy', 'LLMs', 'AI Tools', 'Vector DBs', 'Python']
+++

This week, I delved into advancements in AI privacy and tools, notably Private AI's solutions for data anonymization. I explored innovative AI tools like Browser Use's web-ui for browser-accessible LLMs, the screenshot-to-code tool, and pandas-ai for engaging with dataframes conversationally. 

In the LLM realm, I discovered Anthropic's support for RAG citations, Ollama's local LLM serving, and frameworks like AutoMetaRAG and MAIN-RAG for enhancing data retrieval. I also learned about Amazon Bedrock's metadata filtering enhancements and Azure AI Search's new capabilities, including query rewriting and document summarization. Lastly, I looked into uv, a promising new Python package manager highlighted for its speed and efficiency.

## AI Privacy

- [Private AI](https://private-ai.com/) is a company that helps detect, anonymize, and replace PII/PHI in data. ([TWIMLAI #716](https://twimlai.com/podcast/twimlai/ensuring-privacy-for-any-llm/))

## AI Tools

- Browser Use's [web-ui](https://github.com/browser-use/web-ui) package enables using LLMs to [create agents that have access to a browser](https://www.youtube.com/watch?v=PRbCFgSvaco).
- [screenshot-to-code](https://github.com/abi/screenshot-to-code) is an open source tool that will turn screengrabs/videos into HTML/CSS
- [Lovable](https://lovable.dev/) is an AI full stack engineer (similar to [bolt.new](https://bolt.new/))
- [pandas-ai](https://github.com/Sinaptik-AI/pandas-ai) allows you to chat with your pandas dataframes!


## LLMs

- Anthropic [supports citations](https://docs.anthropic.com/en/docs/build-with-claude/citations) for RAG out of the box!
- [Ollama](https://ollama.com/) is a service that allows easy and quick serving of LLMs locally.
- [AutoMetaRAG](https://github.com/darshil3011/AutoMetaRAG/) gives an LLM a description of the data and probable questions and the LLM gives a proposed metadata to use in the vector store. The metadata options are given to an inference LLM at runtime, which will select metadata for pre-filtering retrieval.
- [MAIN-RAG](https://arxiv.org/abs/2501.00332) is a framework for using a multi-agent system to filter out irrelevant documents and appropriately sort relevant ones from a RAG retriever.
- Amazon Bedrock [implements intelligent metadata filtering](https://aws.amazon.com/blogs/machine-learning/streamline-rag-applications-with-intelligent-metadata-filtering-using-amazon-bedrock/) using Pydantic data models and function calling.

## Vector Databases

- Azure AI Search now [supports query rewriting](https://techcommunity.microsoft.com/blog/azure-ai-services-blog/raising-the-bar-for-rag-excellence-query-rewriting-and-new-semantic-ranker/4302729) with the click of a button!
- You can use Azure OpenAI service for [model distillation and fine-tuning](https://techcommunity.microsoft.com/blog/azure-ai-services-blog/introducing-enhanced-azure-openai-distillation-and-fine-tuning-capabilities/4372173).
- You can use an SLM with a custom [skill in Azure AI Search](https://techcommunity.microsoft.com/blog/azure-ai-services-blog/demo-enriching-data-in-azure-ai-search-indexing-pipeline-using-azure-ai-llmsslms/4358494) to summarize documents and store them in the vector DB.

## Python

- [uv](https://github.com/astral-sh/uv) is an *extremely fast* Python package/project manager. ML Engineer Larry Du [wrote in June 2024](https://dublog.net/blog/so-many-python-package-managers/) that `uv` was the most promising up-and-coming python package managers.