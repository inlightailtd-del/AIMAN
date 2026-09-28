# AIMAN Mission Engine

## Mission
A mission is the durable unit of goal-oriented autonomous work.

## Lifecycle
`draft -> planned -> awaiting_approval -> running -> verifying -> completed`

Alternative terminal paths: `failed`, `cancelled`; temporary path: `blocked`.

## Mission fields
ID, owner, project, objective, constraints, context references, risk class, plan, tasks, assigned agents, tool permissions, acceptance criteria, status, timestamps and execution summary.

## Task graph
Tasks can have dependencies and can run sequentially or in parallel when safe. Each task records input, output, agent, tools, start/end, errors and verification result.

## Resume
Interrupted missions should resume from the last durable checkpoint instead of restarting completed work.

## Approval
The mission pauses when an action exceeds its configured authority. Approval records must contain the exact action, scope, risk and expiration where applicable.

## Completion
A mission is completed only when acceptance criteria pass and required artifacts are available.

## Cancellation
Cancellation stops new actions, attempts to safely stop active work, records the reason, and preserves audit history.

## Example
Website request -> ingest requirements -> research -> design plan -> implementation -> run -> QA -> fix -> retest -> final package.
