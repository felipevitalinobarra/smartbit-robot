import psycopg2

import os
from dotenv import load_dotenv

load_dotenv()

db_conn = f"""
    host='{os.getenv('DB_HOST')}'
    dbname='{os.getenv('DB_NAME')}'
    user='{os.getenv('DB_USER')}'
    password='{os.getenv('DB_PASS')}'
"""

def execute(query, fetch=False):
    conn = psycopg2.connect(db_conn)
    cur = conn.cursor()

    cur.execute(query)

    result = None
    if fetch: # Se a função precisar de um retorno, busca os dados
        result = cur.fetchall()
    
    conn.commit()
    conn.close

    return result if fetch else None


def insert_membership(data):
    account = data["account"]
    plan = data["plan"]
    credit_card = data["credit_card"]["number"][-4]

    query = f"""
    BEGIN; -- Inicia uma transação

    -- Remove o registro pelo email
    DELETE FROM accounts
    WHERE email = '{account["email"]}';

    -- Insere uma nova conta e obtém o ID da conta recém-inserida
    WITH new_account AS (
        INSERT INTO accounts (name, email, cpf)
        VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}')
        RETURNING id
    )

    -- Insere um registro na tabela memberships com o ID da conta
    INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
    SELECT id, {plan["id"]}, '{credit_card}', {plan["price"]}, true
    FROM new_account;

    COMMIT; -- Confirma a transação
    """
    execute(query)


def delete_account_by_email(email):
    query = f"DELETE FROM accounts WHERE email = '{email}';"
    
    execute(query)


def insert_account(account):
    query = f"""
    INSERT INTO accounts (name, email, cpf)
    values ('{account["name"]}', '{account["email"]}', '{account["cpf"]}');
    """
    execute(query)


def search_id_by_cpf(cpf):
    query = f"SELECT id FROM accounts WHERE cpf = '{cpf}'"
    result = execute(query, fetch=True)
    
    return result[0][0] if result else None  # Retorna apenas o ID

