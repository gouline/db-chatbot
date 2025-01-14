from llama_index.core import SQLDatabase
from llama_index.core.query_engine import NLSQLTableQueryEngine
from llama_index.core.tools import QueryEngineTool
from llama_index.llms.ollama import Ollama

llm = Ollama(model="mistral", request_timeout=60.0)

sql_database = SQLDatabase.from_uri("duckdb:///data/data.duckdb")
sql_query_engine = NLSQLTableQueryEngine(
    sql_database=sql_database,
    tables=[
        "purchases",
        "stores",
    ],
    verbose=True,
)
sql_tool = QueryEngineTool.from_defaults(
    query_engine=sql_query_engine,
    name="sql_tool",
    description=("Useful for translating a natural language query into a SQL query"),
)
