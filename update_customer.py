import duckdb

conn = duckdb.connect('jaffle_shop.duckdb')
conn.execute("UPDATE main.customers SET customer_type = 'new' WHERE customer_id = '10899404-3ec1-45d1-8d74-1819f19f060b'")
conn.close()
print('Done')