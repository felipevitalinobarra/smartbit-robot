# 🏋️‍♂️ SmartBit

## 📖 Introdução  

> Automação de testes para aplicações Web, Mobile e API, utilizando o Robot Framework e Appium, com foco em um sistema de gestão para academias.

---

## 🌟 Recursos
- Web:
  - Cadastro de clientes
  - Login de Administrador
  - Cadastro de matrículas
- Mobile:
  - Envio de peso e altura do cliente
  
---

## ✅ Pré-requisitos

Antes de começar, certifique-se de ter os seguintes softwares instalados em sua máquina:
1. Node.js (LTS)
    - Baixe a versão mais recente do **Node.js** [aqui.](https://nodejs.org/pt)
    - Após a intalação, habilite o Corepack:
    ```bash
    corepack enable
    ```
3. Git Bash 
    - Baixe a versão mais recente do **Git Bash** [aqui.](https://git-scm.com/)
4. Python 
    - Baixe a versão mais recente do **Python** [aqui.](https://www.python.org/downloads/)
5. JDK (Java Development Kit)
    - Baixe a versão mais recente do **JDK** [aqui.](https://www.oracle.com/java/technologies/downloads/?er=221886)
    - Configure as variáveis de ambiente:
        - JAVA_HOME: Caminho para a pasta de instalação do **JDK**.
        - Adicione *%JAVA_HOME%/bin* à variável **PATH**.
6. Appium (2.12.1 ou superior)
    - Instale o **Appium** globalmente com o seguinte comando:
     ```bash
      npm install -g appium
     ```  
7. Banco de Dados
    - Utilize o [Supabase](https://supabase.com/) para configuração do banco de dados, que utiliza o PostgreSQL.

---

## 📂 Estrutura do Projeto
A estrutura do projeto é dividida em dois diretórios principais:
  - apps: Contém os diretórios da aplicação, como API e Web.
  - smartbit-robot: Diretório deste repositório, com as automações (libs, mobile, web, services, etc.).

---

## 🚀 Instalação

### 1️⃣ Setup da Aplicação
1. Baixe a aplicação do projeto [aqui](https://github.com/felipevitalinobarra/aplicacoes/blob/main/smartbit.rar).
2. Crie dois diretórios locais:
    - apps: Para armazenar a aplicação (API e Web).
    - smartbit-robot: Diretório para este repositório.
3. Extraia os arquivos baixados e organize conforme os diretórios acima.

---

### 2️⃣ Instalação das dependências
### API:
  1. Navegue até o diretório da **API**:
  ```bash
  cd [caminho-relativo]/apps/smartbit/api
  ```
  2. Instale as dependências:
  ```bash
  npm install
  ```
### Web:
  1. Navegue até o diretório da aplicação **Web**:
  ```bash
  cd [caminho-relativo]/apps/smartbit/web
  ```
  2. Instale as dependências:
  ```bash
  npm install
  ```
### Repositório Smartbit-Robot:
  1. No terminal, acesse o diretório **smartbit-robot**:
  ```bash
  cd [caminho-relativo]/smartbit-robot
  ```
  2. Instale as dependências:
  ```bash
  pip install -r requirements.txt
  ```

---

🔧 Configuração do Ambiente
1️⃣ Banco de Dados  
  1. Acesse o [Supabase](https://supabase.com/) e crie uma conta ou faça login.
  2. Crie um novo projeto chamado **Smartbit**.
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

---

## 🔄 Colocando o Ambiente no Ar
  ### 1️⃣ API
  1. No terminal, acesse o diretório da API:
  ```bash
    cd [caminho-relativo]/apps/smartbit/api
  ```   
  2. Inicie o servidor da API:
  ```bash
    npm run dev
  ```
### 2️⃣ WEB
  1. No terminal, acesse o diretório da aplicação WEB:
  ```bash
    cd [caminho-relativo]/apps/smartbit/web
  ```   
  2. Inicie o servidor Web:
  ```bash
    npm run dev
  ```
### 3️⃣ Appium
  1. No terminal, acesse o diretório mobile:
  ```bash
    cd [caminho-relativo]/smartbit-robot/mobile
  ```   
  2. Inicie o servidor do Appium:
  ```bash
    npx appium
  ```
---

## 🤖 Testes Automatizados
Após configurar e colocar o ambiente no ar, execute os testes automatizados:

  - Testes Web:
  ```bash
  robot -d ./results web/tests/
  ```
  
  - Testes Mobile:
  ```bash
  robot -d ./results mobile/tests/
  ```  

