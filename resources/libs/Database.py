import psycopg2

db_conn = """
    host='aws-0-sa-east-1.pooler.supabase.com'
    dbname='postgres'
    user='postgres.dpfnczrgezgcwlvzhtvr'
    password='PZiT9jeBb4DUEHA3'
    """

def execute(query):
    conn = psycopg2.connect(db_conn)

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close

def delete_account_by_email(email):

    query = f"DELETE FROM accounts WHERE email = '{email}';"
    
    execute(query)

def insert_account(account):
    query = f"""
    INSERT INTO accounts (name, email, cpf)
    values ('{account["name"]}', '{account["email"]}', '{account["cpf"]}');
    """
    execute(query)