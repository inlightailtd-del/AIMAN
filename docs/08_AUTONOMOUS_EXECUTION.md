# AIMAN Autonomous Execution

## Objective
Enable a user to provide a goal or source document and receive a verified final result without manually orchestrating every intermediate step.

## Standard loop
1. Ingest source material.
2. Extract requirements and constraints.
3. Identify missing information.
4. Research missing information.
5. Build a plan and task graph.
6. Select agents and tools.
7. Execute in a controlled workspace.
8. Observe generated state.
9. Run tests and acceptance checks.
10. Diagnose ordinary failures.
11. Fix and retest.
12. Package the result.
13. Request approval for consequential external actions.
14. Deliver result and execution report.

## Example: website from a document
Requirements PDF -> research market/design/technical standards -> architecture -> sitemap -> UI specification -> code -> local run -> browser inspection -> functional tests -> accessibility/performance checks -> fixes -> final build.

## Workspace isolation
Autonomous development should run inside a mission workspace with explicit file/tool permissions. Production systems are separate from scratch workspaces.

## Browser verification
When browser automation is available, AIMAN should inspect real rendered pages rather than trusting source code alone.

## External publication
Publishing, sending messages, spending money, changing production infrastructure or deleting data can require approval based on policy.

## Final report
Every autonomous mission returns artifacts, completed tasks, verification results, unresolved issues, research sources where relevant, and actions that still require the owner.
