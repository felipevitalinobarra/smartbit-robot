# 🏋️‍♂️ SmartBit

## Sumário

- [Introdução](#introdução)
- [Recursos](#recursos)
- [Pré-requisitos](#pré-requisitos)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Instalação](#instalação)
- [Testes Automatizados](#testes-automatizados)

## Introdução  

> Automação de testes para aplicações Web, Mobile e API, utilizando o Robot Framework e Appium, com foco em um sistema de gestão para academias."

---

## Recursos

- Cadastro de clientes (Web)
- Login de Administrador (Web)
- Cadastro de matrículas (Web)
- Envio de peso e altura do cliente (Mobile)
  
---

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter os seguintes softwares instalados em sua máquina:
1. Node.js (LTS) [Baixe a versão mais recente aqui.](https://nodejs.org/pt)
  Após a intalação, habilite o Corepack:
  ```bash
  corepack enable
  ```
2. Git Bash [Baixe e instale o Git Bash aqui.](https://git-scm.com/)
3. Python [Baixe e instale o Python aqui.](https://www.python.org/downloads/)
4. Banco de Dados:
   Utilize o [Supabase](https://supabase.com/) para configuração do banco de dados, que utiliza o PostgreSQL.

# - Appium (versão 2.12.1 ou superior) VER DEPOIS

---

## 📂 Estrutura do Projeto
A estrutura do projeto é dividida em dois diretórios principais:

- apps: Contém os diretórios da aplicação, como API e Web.
- smartbit-robot: Diretório deste repositório, com as automações (libs, mobile, web, services, etc.).

---

## 🛠 Passo a passo para configuração

1️⃣ Setup da Aplicação
1. Faça o download da aplicação do projeto [aqui](https://github.com/felipevitalinobarra/aplicacoes/blob/main/smartbit.rar).
2. Crie dois diretórios locais:
 - apps: Para armazenar a aplicação (API e Web).
 - smartbit-robot: Diretório para este repositório.
3. Extraia os arquivos baixados e organize conforme os diretórios acima.

2️⃣ Instalação das dependências
- API:
  1. Acesse o diretório da API:
  ```bash
  cd [caminho-relativo]/apps/smartbit/api
  ```
  2. Instale as dependências:
  ```bash
  npm install
  ```
- Web:
  1. Acesse o diretório da aplicação Web:
  ```bash
  cd [caminho-relativo]/apps/smartbit/web
  ```
  2. Instale as dependências:
  ```bash
  npm install
  ```
3️⃣ Configuração do Banco de Dados  
1. Acesse o [Supabase](https://supabase.com/) e crie uma conta (ou faça login).
2. Crie um novo projeto chamado Smartbit.
3. Acesse Settings > Database e copie as informações:
- Host, Database Name, Port, User, Password.
4. No diretório da API, edite o arquivo .env e insira os valores nos respectivos campos:
```env
DB_HOST=<seu_host>
DB_NAME=<seu_nome_do_banco>
DB_USER=<seu_usuario>
DB_PASS=<sua_senha>
DB_PORT=<sua_porta>
```
5. No terminal, inicialize o banco de dados:
```bash
cd [caminho-relativo]/apps/smartbit/api
./setup.sh
```
> Esse script utiliza o Sequelize para criar a estrutura e popular o banco com dados iniciais.
 
4️⃣ Configuração do Repositório
1. No terminal, acesse o diretório smartbit-robot:
```bash
cd [caminho-relativo]/smartbit-robot
```
2. Instale as dependências:
```bash
pip install -r requirements.txt
```

---

## ✅ Testes Automatizados
Após concluir a instalação, configuração e colocar no ar a API e WEB, você poderá rodar os testes automatizados.

