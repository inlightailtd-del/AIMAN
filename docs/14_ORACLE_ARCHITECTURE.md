# AIMAN Local + Oracle Architecture

## Local PC
Local development, Ollama models, code workspace, computer-use adapter and local testing.

## Oracle Cloud
Always-on API, background workers, scheduler, secure remote services, database where appropriate and monitoring.

## Boundary
The same AIMAN Core contracts should work locally or remotely. Environment-specific adapters provide deployment differences.

## Security
Remote services require authentication, encrypted transport, minimal exposed ports, secret isolation and audit logging.

## Workload placement
Choose placement using RAM/CPU/GPU, latency, privacy, uptime and cost. Sensitive local workloads can remain local.

## Deployment stages
Local development -> local integration -> staging on Oracle -> controlled production.

## Recovery
Cloud services should have health checks, restart policies, backups and observable logs. Local services should fail gracefully when cloud services are unavailable.

## First cloud target
Run the FastAPI backend and worker layer on Oracle only after the local Brain, mission, memory and verification contracts are stable.
