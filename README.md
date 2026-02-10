# 🛠 BugTracker – Legacy ASP.NET Modernised

**A real-world legacy ASP.NET WebForms application modernised using containerisation, automated database provisioning, and CI pipelines.**

---

## 📌 Overview

**BugTracker** is a classic ASP.NET (.NET Framework 4.8) issue tracking system originally designed for on-premise IIS + SQL Server deployments.

This repository demonstrates how a legacy enterprise application can be:
- 🐳 **Containerised** using Docker (Windows containers + IIS)
- 🔑 **Configured** for deterministic cryptographic behaviour (stable machineKey)
- ⚙️ **Automated** for database provisioning
- 🔄 **Integrated** with CI (GitHub Actions)
- 🌍 **Made reproducible** and environment-agnostic

This project reflects practical **legacy modernisation work**—not rewriting, but stabilising, isolating, and productionising existing systems.

---

## 🏗 Architecture

[Browser] --(HTTP/HTTPS)--> [Docker Container (Windows Server Core)]
                                   |
                                   +--> [IIS Web Server]
                                   |      |
                                   |      +--> [ASP.NET 4.8 WebForms]
                                   |             |
                                   |             +--(EF6/ADO.NET)--> [SQL Server]

### Key Components
- **Framework:** ASP.NET WebForms (.NET Framework 4.8)
- **ORM:** Entity Framework 6
- **Database:** SQL Server (Local / Containerised)
- **Host:** IIS (inside Windows Server Core container)
- **CI/CD:** GitHub Actions

---

## 🚀 What Was Modernised

### 1️⃣ Containerisation
- **Multi-stage Dockerfile** utilising Windows Server Core (ASP.NET 4.8 image).
- Clean **IIS deployment** strategy.
- Explicit connection string handling via environment variables.
- Writable `App_Data` folders created dynamically at runtime.

### 2️⃣ Deterministic Machine Key
**Resolved:**
- ViewState MAC validation failures.
- Cross-instance cryptographic inconsistencies in scaled environments.

**Implemented:**
- Added specific `machineKey` generation (HMACSHA256 / AES) to `web.config` transforms to ensure stable behaviour in scaled/containerised environments.

### 3️⃣ Database Automation
- Schema scripts executed via `sqlcmd`.
- Automated provisioning script included in the repo.
- **Result:** Eliminated manual SSMS setup dependency.

### 4️⃣ CI Pipeline (GitHub Actions)
- Runs on **Windows runner**.
- Handles **NuGet restore** and **MSBuild compilation**.
- Validates legacy solution builds to ensure reproducibility.

---

## 🧪 Running Locally

### Prerequisites
- Windows 10/11 Professional or Enterprise
- **Docker Desktop** (Switched to **Windows Containers** mode)
- SQL Server (Local instance or running in a container)
- .NET Framework 4.8 SDK

### Build & Run

1. **Build the container image:**
   docker compose -f infra/docker/docker-compose.yml build

2. **Run the application:**
   docker compose -f infra/docker/docker-compose.yml up -d

3. **Access the application:**
   Open your browser and navigate to: `http://localhost:8080`

---

## 🧠 Why This Project Matters

> **"Rewriting is expensive. Modernising safely is strategic."**

Many enterprises still operate on non-cloud-native stacks:
- .NET Framework applications
- IIS-bound systems
- Legacy SQL deployments
- WebForms architectures

This project demonstrates:
- ✅ Deep understanding of legacy architecture.
- ✅ Pragmatic modernisation techniques.
- ✅ Infrastructure-first thinking.
- ✅ DevOps integration for older stacks.
- ✅ Controlled handling of technical debt.

---

## 🎯 Positioning

This repository is part of a broader portfolio focused on **Legacy System Stabilisation** and **Brownfield Modernisation**. It serves as a proof-of-concept for enterprise migration strategies, particularly in industrial and financial sectors.

**Related Projects:**
- **FactoryBridgeDashboard:** OPC UA modern integration.
- **LegacyBankApp:** Financial system simulation.

---

## 🔐 Security Notes
- **Warning:** Production secrets must **never** be hardcoded.
- Replace connection strings with environment variables in production.
- Use secure key vault solutions (e.g., Azure Key Vault, HashiCorp Vault) for real-world deployments.

---

## 📈 Future Enhancements
- [ ] Publish Windows container image to registry.
- [ ] Full SQL Server container integration in Compose.
- [ ] Publish CI build artifacts.
- [ ] Automated database migrations (DbUp or EF Migrations).
- [ ] Infrastructure as Code (Terraform/Bicep).

---

## 👤 Author

**Modernisation-Focused Software Engineer**
*Specialising in Legacy Transformation, .NET Ecosystems, Industrial Integration, and Infrastructure-Aware Development.*
