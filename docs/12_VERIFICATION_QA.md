# AIMAN Verification and QA

## Principle
AIMAN verifies outcomes instead of trusting agent claims.

## Verification levels
1. Schema validation.
2. Unit tests.
3. Integration tests.
4. End-to-end mission tests.
5. Render/browser inspection where UI exists.
6. Acceptance-criteria verification.
7. Security/policy checks.

## Agent output
Every important output should include what was produced, what was tested, test results, known limitations and unresolved issues.

## Recovery loop
Failure -> classify -> diagnose -> safe fix -> retest -> verify. If the system cannot establish correctness, stop and escalate rather than repeatedly guessing.

## Regression
Each fixed defect should become a regression test when practical.

## Autonomous build acceptance
For software builds, check install/startup, routes, APIs, forms, error states, accessibility basics, responsive behavior, logs and key acceptance criteria.

## Quality gates
A mission cannot be marked complete while required acceptance checks are failing or unverified.

## Human review
Owner review remains available for subjective quality, brand decisions, legal matters and high-impact outcomes.
