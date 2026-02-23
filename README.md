# Lending Data Platform (Consumer Installment Loans)

Portfolio data engineering project (DataTalksClub DE Zoomcamp 2026 v1): batch pipeline on GCP (GCS + BigQuery), dbt transformations, Airflow orchestration, IaC with Terraform, and 2 dashboard visuals.

## Stack (v1)
- GCP: GCS + BigQuery
- Transformations: dbt (BigQuery)
- Orchestration: Airflow (Docker)
- IaC: Terraform
- Dev tooling: uv + Make + pre-commit + GitHub Actions

## Quickstart (local dev in WSL2)
```bash
make setup
make lint
make test
```

See `docs/runbook.md` for full setup.
