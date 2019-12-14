#!/usr/bin/python3
import mysql.connector
import mysqlx

def sql_example() -> None:
    con = mysql.connector.connect(
      unix_socket='/tmp/mysql_sandbox8017.sock',
      user='msandbox',
      password='msandbox',
      database='test',
    )
    c = con.cursor()
    c.execute("SELECT name FROM animals_table")
    print("Animals in the animals table")
    for row in c:
        print(f"  SQL Animal: {row[0]}")
    c.close()
    con.close()

def nosql_example() -> None:
    session = mysqlx.get_session(
      socket='/tmp/mysqlx-18017.sock',
      user='msandbox',
      password='msandbox',
    )
    schema = session.get_schema('test')
    animals = schema.get_collection('animals_collection')
    for doc in animals.find().fields('name').execute().fetch_all():
        print(f"NoSQL Animal: {doc['name']}")
    session.close()

if __name__ == "__main__":
    sql_example()
    nosql_example()
