data:
	( cd data && dbt seed && dbt run )
.PHONY: data
