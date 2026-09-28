# AIMAN Tool Engine

## Purpose
Expose external capabilities through consistent adapters instead of hard-coding tools into agents.

## Tool families
Web/search, browser, terminal, files, Git/GitHub, databases, HTTP APIs, n8n, email, calendar, CRM, design platforms, social platforms, voice/telephony, cloud infrastructure and computer control.

## Tool contract
Every tool declares name, version, input schema, output schema, permissions, risk class, timeout, retry policy and verification method.

## Execution
Agent requests a tool -> policy checks scope -> tool runs -> result is captured -> mission observes result -> verification decides whether it is acceptable.

## Retries
Retry only when the failure is classified as transient and the action is safe to repeat. Idempotency keys should be used for external side effects where supported.

## Credentials
Credentials stay in environment/secret storage or connector-managed authentication. They are never written into prompts, ordinary memory, logs or generated documentation.

## Preferred integration rule
Use an official API when it provides reliable capability. Use browser/computer automation when an API is unavailable or insufficient, with stronger observation and verification.
