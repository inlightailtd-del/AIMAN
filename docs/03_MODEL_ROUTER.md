# AIMAN Model Router

## Purpose
Provide one stable model interface while allowing local and cloud providers to change independently.

## Provider types
- Ollama/local models
- OpenAI-compatible endpoints
- Anthropic-compatible provider
- Future specialist providers

## Routing inputs
Task type, required capability, privacy class, context size, latency target, cost budget, model health, availability and mission risk.

## Task classes
`reasoning`, `coding`, `research`, `vision`, `writing`, `classification`, `embedding`, `transcription`, `generation`.

## Router contract
Input: task, messages/context, constraints, preferred provider, fallback policy.
Output: selected model, provider, response, usage metadata, latency, fallback status and errors.

## Fallback
Provider failure should trigger a configured fallback only when the fallback can safely satisfy the task. Sensitive data must not be sent to a provider outside the mission's privacy policy.

## Local-first
Ollama is the initial development path. The rest of AIMAN must not depend directly on Ollama-specific APIs; use an adapter.

## Evaluation
Track response quality, latency, failure rate, cost where available and task-specific evaluation scores. Do not select models from a single benchmark alone.

## Configuration
Provider/model settings belong in configuration tables or environment-backed secrets, never hard-coded into agents.
