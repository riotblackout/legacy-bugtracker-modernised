\# Modernisation Plan



Goal: modernise BugTracker.NET enough to run in cloud without rewriting.



\## Phase 1: Stabilise baseline

\- Ensure build reproducible

\- Fix DB drift issues



\## Phase 2: Containerise

\- Windows IIS container

\- docker-compose for local



\## Phase 3: Cloud deploy

\- Azure Container Instances (ACI)

\- Externalised configuration



\## Phase 4: CI/CD

\- GitHub Actions build + push + deploy



