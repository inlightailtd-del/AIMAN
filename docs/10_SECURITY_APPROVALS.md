# AIMAN Security, Permissions and Approvals

## Authority levels
- L0 Observe only.
- L1 Prepare/draft/stage.
- L2 Low-risk reversible execution.
- L3 Consequential action requiring configured approval.
- L4 Prohibited by policy.

## Risk factors
External side effect, financial impact, data sensitivity, production impact, reversibility, legal/contractual effect, credential scope and blast radius.

## Approval record
Action, exact scope, requester, risk level, evidence/context, expiration, approver, decision, timestamp and execution result.

## Secrets
Use environment variables, OS secret storage, connector auth or a dedicated secrets manager. Never put tokens in source code or model-visible memory.

## Audit
Record mission, agent, model, tool, action, timestamp, policy decision, approval state, result and verification result. Avoid logging secret values.

## Emergency controls
Owner can disable an agent/tool, cancel a mission, revoke an integration or stop execution. Revocation must prevent new actions.

## Isolation
Projects, businesses and sandbox environments must not automatically share credentials or sensitive context.

## Security testing
Include permission tests, approval bypass tests, prompt-injection tests, secret-leak tests, cross-project isolation tests and destructive-action safeguards.
