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

def execute(query, params=None, fetch=False):
    with psycopg2.connect(db_conn) as conn:
        with conn.cursor() as cur:
            if params:
                cur.execute(query, params)
            else:
                cur.execute(query)

            result = cur.fetchall() if fetch else None
            conn.commit()
    return result


def insert_membership(data):
    account = data["account"]
    plan = data["plan"]
    credit_card = data["credit_card"]["number"][-4]

    query = """
    -- Inicia uma transação
    BEGIN;

    -- Remove o registro pelo email
    DELETE FROM accounts WHERE email = %s;

    -- Insere uma nova conta e obtém o ID da conta recém-inserida
    WITH new_account AS (
        INSERT INTO accounts (name, email, cpf)
        VALUES (%s, %s, %s)
        RETURNING id
    )

    -- Insere um registro na tabela memberships com o ID da conta
    INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
    SELECT id, %s, %s, %s, TRUE
    FROM new_account;

    -- Confirma a transação
    COMMIT;
    """
    params = (account["email"], account["name"], account["email"], account["cpf"], plan["id"], credit_card, plan["price"])
    execute(query, params)


def insert_account(data):
    name = data["account"]["name"]
    email = data["account"]["email"]
    cpf = data["account"]["cpf"]

    query = """
    -- Inicia uma transação
    BEGIN;

    -- Remove o registro pelo cpf
    DELETE FROM accounts WHERE cpf = %s;

    -- Insere uma nova conta
    INSERT INTO accounts (name, email, cpf)
        VALUES (%s, %s, %s);
    
    -- Confirma a transação
    COMMIT;
    """

    params = (cpf, name, email, cpf)
    execute(query, params)


def delete_account_by_email(email):
    query = "DELETE FROM accounts WHERE email = %s;"
    
    params = (email,)
    execute(query, params)


def search_id_by_cpf(cpf):
    query = "SELECT id FROM accounts WHERE cpf = %s"
    params = (cpf,)
    result = execute(query, params, fetch=True)
    
    return result[0][0] if result else None  # Retorna apenas o ID

