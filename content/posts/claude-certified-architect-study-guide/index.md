+++
title = "Claude Certified Architect Study Guide"
date = 2026-05-26T10:49:00-07:00
draft = false
+++

Below are questions to know the answer to pass the [Azure AI Engineer (AI-102)](https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-engineer/) exam.

## Resources

* [Anthropic Academy courses](https://www.anthropic.com/learn).
* [Claude Certifications website](https://claudecertifications.com/claude-certified-architect).
* CertSafari's [practice questions for the exam](https://www.certsafari.com/anthropic/claude-certified-architect). It has 626 questions!
* Jacob Bushong's [Claude Certified Architect exam prep](https://www.udemy.com/course/certified-claude-architect-masterclass-2026/) course.

## Agent Skills

<details>
<summary>How does Claude decide whether to use a skill?</summary>

> All skills include a name and a description in their frontmatter. Claude loads the names and descriptions of all skills at the start of each session. When you ask it to do something, it will use the description to determine if a skill needs loaded into context. If it deems a skill relevant, then (and only then) will it read the contents of the full skill.

</details>

<details>
<summary>How to you distinguish personal and project skills?</summary>

> Personal skills go in `~/.claude/skills` (your home directory). These skills will be used across all of your projects. Skills saved in a project/repo root (.claude/skills) will be shared with anyone who clones the repo.

</details>

<details>
<summary>How do you decide what goes in a skill and what goes in CLAUDE.md?</summary>

> Put information in CLAUDE.md _that you want Claude to always have in context_. If there are details you want it to know/use that are task-specific, that's what a skill is for.

</details>

<details>
<summary>If you update a skill, what do you need to do to get those updates applied?</summary>

> Claude loads skill descriptions at the start of each session, so simply restart Claude.

</details>

<details>
<summary>If Claude is confusing when to choose between two similar skills, what should you do?</summary>

> Avoid conflicts by changing the skill names and descriptions so they are unique.

</details>

<details>
<summary>What is the hierarchy for skill scope preference?</summary>

> If two skills share the same name, enterprise skills will be used first, then personal skills, then project skills, then plugins.

</details>

<details>
<summary>What available metadata fields are in the Agent Skills open standard?</summary>

> You can find out more on the [open standard spec](https://agentskills.io/specification#skill-md-format). Name and description are the only two required. Additional fields include:
> * `license` to reference a bundled license for the skill
> * `compatibility` can indicate intended product, required system packages, etc.
> * `metadata` accepts key-value pairs to store additional properties not in the spec
> * `allowed_tools` (still experimental) defines tools that are pre-approved to run.

</details>

<details>
<summary>What is the best practice for skill file length? If you want to cram more details in a skill that is already large, how do you do so?</summary>

> Skills should be 500 lines or less. This helps keep the needed context window small. The goal is to have the skill act as a table of contents, not the entire book. If you need to put more information in, use script, reference, or asset files that Claude can load in if necessary:
> * Put executable code in `scripts/`
> * Add documentation to `references/`
> * Put images, templates, and other data files in `assets/`

</details>

<details>
<summary>How are scripts best used?</summary>

> Files in your `scripts/` directory should be actual executable code. In your SKILL.md file, if you tell Claude to _run_ a script (not read it), then it will run the script and only the output will get loaded into context.

</details>

<details>
<summary>What are guidelines for good descriptions?</summary>

> The goal is for Claude to load a skill _when you want it to_. A good description describes what a skill does and tells Claude when to use it. If it isn't being loaded when you expect it to, add keywords you typically use in prompts to the description.

</details>

<details>
<summary>Can subagents use skills?</summary>

> The default Claude subagents _NEVER_ use custom skills. By default custom subagents you define _WON'T EITHER_. To give a subagent access to a skill, explicitly list the skill in the frontmatter of the subagent's .md file. This skill will be loaded into context _EVERY TIME_ the subagent is used.

</details>

<details>
<summary>How can skills be shared?</summary>

> Project-specific skills can be version controlled in the repository. You can also defiine plugins that can be shared in a marketplace.

</details>

<details>
<summary>If a skill isn't working as desired, what are common issues and troubleshooting steps?</summary>

> 1. Try the agent skills verifier command (`skills-ref`) to ensure the skill is valid.
> 2. If it doesn't trigger, update the description so it overlaps with how you phrase your requests.
> 3. If skills aren't loading, they need to be in the right structure and in the right location.
> 4. Run Claude in debug mode `claude --debug` and try loading the skill.
> 5. If scripts can't be run, make sure `chmod +x` is applied to all scripts.

</details>

## Building with the Claude API

<details>
<summary>What is the five step process for using the Anthropic API in a web or mobile app?</summary>

> 1. Make a request to a server we own/maintain. The client _should not_ access the Antrhopic API directly as it would reveal the API key.
> 2. Request to the Anthropic API from the server using the Anthropic SDK.
> 3. The Anthropic model does the things.
> 4. The Anthropic API responds to the server.
> 5. Your server responds to the client.

</details>

<details>
<summary>What are necessary inputs to the messages.create function?</summary>

> 1. The name of the model to use to generate text.
> 2. The maximum number of tokens allowed.
> 3. The input messages to the model.

</details>

<details>
<summary>Does the max tokens argument instruct Claude to keep a response to around that length?</summary>

> No. Instead it acts as a safety net. If Claude is generating a lengthy response, the response will stop at the max tokens argument.

</details>

<details>
<summary>Does the Anthropic API natively track a conversation?</summary>

> No! When using the API you need to manually track and provide the desired message history.

</details>

<details>
<summary>How do you define a system prompt in the messages.create call?</summary>

> Define a system prompt, then include `system=system_prompt` in the `create()` call.

</details>

<details>
<summary>How do you stream Claude's response events in real time?</summary>

> Use `client.messages.stream()` inside of a `with` block. You can collect the final response using `stream.get_final_response()`.

</details>

<details>
<summary>Question</summary>

> Answer

</details>

<details>
<summary>Question</summary>

> Answer

</details>

<details>
<summary>Question</summary>

> Answer

</details>

<details>
<summary>Question</summary>

> Answer

</details>

<details>
<summary>Question</summary>

> Answer

</details>