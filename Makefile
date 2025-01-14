data:
	( cd data && dbt seed && dbt run )
.PHONY: data

run:
	uv run python3 -m chatbot
.PHONY: run
