import duckdb
import os

conn = duckdb.connect('jaffle_shop.duckdb')
conn.execute("CREATE SCHEMA IF NOT EXISTS raw")

for f in os.listdir('jaffle-data'):
    if f.endswith('.csv'):
        table = f.replace('.csv', '')
        conn.execute(f"CREATE OR REPLACE TABLE raw.{table} AS SELECT * FROM read_csv_auto('jaffle-data/{f}')")
        print(f'Loaded {table}')

conn.close()
print('Done!')