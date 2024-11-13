import psycopg2

def delete_account_by_email(email):

    query = f"DELETE FROM accounts WHERE email = '{email}';"
    
    conn = psycopg2.connect(
        host='aws-0-sa-east-1.pooler.supabase.com',
        database='postgres',
        user='postgres.dpfnczrgezgcwlvzhtvr',
        password='PZiT9jeBb4DUEHA3'
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close