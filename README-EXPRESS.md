# Table Express API 🍽️

Uma API completa para sistema de reservas de restaurantes desenvolvida com NestJS, TypeScript, MySQL, Sequelize e Docker.

![License](https://img.shields.io/badge/license-MIT-green)
![NestJS](https://img.shields.io/badge/NestJS-10.0.0-red)
![TypeScript](https://img.shields.io/badge/TypeScript-5.2.2-blue)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange)
![Sequelize](https://img.shields.io/badge/Sequelize-6.32.1-blueviolet)
![Jest](https://img.shields.io/badge/Jest-29.5.0-green)
![Docker](https://img.shields.io/badge/Docker-ready-blue)

## 📋 Sobre o Projeto

Table Express API é um sistema completo para gerenciamento de reservas de restaurantes. A aplicação permite que usuários encontrem restaurantes, verifiquem disponibilidade e façam reservas, enquanto restaurantes podem gerenciar suas mesas, horários e confirmações.

### Principais Funcionalidades

- ✅ Cadastro e autenticação de usuários e restaurantes
- ✅ Busca de restaurantes por localização, categoria ou nome
- ✅ Verificação de disponibilidade em tempo real
- ✅ Criação, modificação e cancelamento de reservas
- ✅ Gestão de mesas e capacidade
- ✅ Sistema de avaliações e comentários
- ✅ Notificações automáticas por email

## 🛠️ Tecnologias Utilizadas

- **Backend Framework**: [NestJS](https://nestjs.com/) - Framework Node.js progressivo para construir aplicações eficientes e escaláveis
- **Linguagem**: [TypeScript](https://www.typescriptlang.org/) - Superset tipado de JavaScript
- **Banco de Dados**: [MySQL](https://www.mysql.com/) - Sistema de gerenciamento de banco de dados relacional
- **ORM**: [Sequelize](https://sequelize.org/) - ORM baseado em promises para Node.js
- **Migrations**: Sequelize CLI para gerenciamento de migrations
- **Containerização**: [Docker](https://www.docker.com/) e Docker Compose
- **Documentação da API**: [Swagger](https://swagger.io/) (OpenAPI)
- **Testes**: [Jest](https://jestjs.io/) e SuperTest
- **Autenticação**: JWT (JSON Web Tokens)
- **Validação**: class-validator

## 🏗️ Arquitetura

O projeto foi desenvolvido seguindo a arquitetura de camadas do NestJS:

- **Controllers**: Responsáveis por receber requisições HTTP e retornar respostas
- **Services**: Implementam a lógica de negócio
- **Models**: Representam as tabelas do banco de dados usando Sequelize
- **DTOs**: Definem a estrutura dos dados transferidos entre camadas
- **Guards**: Controlam o acesso a endpoints protegidos
- **Interceptors**: Modificam requisições/respostas ou implementam funcionalidades transversais
- **Migrations**: Controlam as alterações no esquema do banco de dados

## 🚀 Como Executar

### Pré-requisitos

- [Node.js](https://nodejs.org/) (v16 ou superior)
- [Docker](https://www.docker.com/) e [Docker Compose](https://docs.docker.com/compose/)
- [Git](https://git-scm.com/)

### Configuração e Execução

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/table-express-api.git
   cd table-express-api
   ```

2. Configure as variáveis de ambiente:
   ```bash
   cp .env.example .env
   # Edite o arquivo .env com suas configurações
   ```

3. Inicie os containers Docker:
   ```bash
   docker-compose up -d
   ```

4. Execute as migrations:
   ```bash
   docker-compose exec app npx sequelize-cli db:migrate
   ```

5. A API estará disponível em `http://localhost:3000`

6. Acesse a documentação Swagger em `http://localhost:3000/api`

### Executando sem Docker

Se preferir executar sem Docker:

1. Certifique-se de ter MySQL instalado e configurado localmente

2. Instale as dependências:
   ```bash
   npm install
   ```

3. Execute as migrations:
   ```bash
   npx sequelize-cli db:migrate
   ```

4. Inicie a aplicação:
   ```bash
   npm run start:dev
   ```

## 📊 Modelo de Dados

O sistema possui as seguintes entidades principais:

- **Restaurante**: Informações completas sobre os estabelecimentos
- **Mesa**: Detalhes sobre a capacidade e disponibilidade de cada mesa
- **Usuário**: Dados dos clientes que utilizam o sistema
- **Reserva**: Registros de reservas com status e detalhes
- **Avaliação**: Comentários e notas deixados pelos usuários

## 📝 Documentação da API

A documentação completa da API está disponível via Swagger após a inicialização do projeto em:

```
http://localhost:3000/api
```

## 🧪 Testes

O projeto utiliza Jest para testes unitários e de integração:

```bash
# Executar testes unitários
npm run test

# Executar testes e2e
npm run test:e2e

# Verificar cobertura de testes
npm run test:cov
```

## 📂 Estrutura de Diretórios

```
table-express-api/
├── src/
│   ├── config/           # Configurações da aplicação
│   ├── modules/          # Módulos do NestJS
│   │   ├── auth/         # Autenticação
│   │   ├── restaurants/  # Restaurantes
│   │   ├── reservations/ # Reservas
│   │   ├── tables/       # Mesas
│   │   └── users/        # Usuários
│   ├── shared/           # Código compartilhado
│   │   ├── decorators/   # Decorators personalizados
│   │   ├── filters/      # Filtros de exceção
│   │   ├── guards/       # Guards de segurança
│   │   ├── interceptors/ # Interceptors
│   │   └── pipes/        # Pipes de validação
│   ├── database/         # Configurações do banco de dados
│   │   ├── migrations/   # Migrations do Sequelize
│   │   ├── seeders/      # Seeders para dados iniciais
│   │   └── models/       # Modelos do Sequelize
│   ├── app.module.ts     # Módulo principal
│   └── main.ts           # Ponto de entrada
├── test/                 # Testes
├── docker/               # Configurações Docker
│   ├── mysql/            # Configuração MySQL
│   └── nginx/            # Configuração Nginx (opcional)
├── docker-compose.yml    # Composição de serviços
├── Dockerfile            # Instruções de build
├── .sequelizerc          # Configuração do Sequelize CLI
├── .env.example          # Exemplo de variáveis de ambiente
├── package.json          # Dependências
└── README.md             # Este arquivo
```

## 🔄 Migrations e Seeds

O projeto utiliza Sequelize para gerenciar o banco de dados:

```bash
# Criar uma nova migration
npx sequelize-cli migration:generate --name create-users

# Executar migrations
npx sequelize-cli db:migrate

# Reverter a última migration
npx sequelize-cli db:migrate:undo

# Criar um seeder
npx sequelize-cli seed:generate --name demo-restaurants

# Executar seeders
npx sequelize-cli db:seed:all
```

## 🔒 Segurança

O projeto implementa diversas medidas de segurança:

- Autenticação JWT com refresh tokens
- Criptografia de senhas com bcrypt
- Proteção contra ataques CSRF
- Rate limiting para evitar abusos
- Validação de entradas com class-validator
- HTTPS forçado em produção

## 🌐 Deploy

Instruções para deploy em ambiente de produção:

1. Configure as variáveis de ambiente para produção
2. Execute o build:
   ```bash
   npm run build
   ```
3. Use Docker Compose para deploy:
   ```bash
   docker-compose -f docker-compose.prod.yml up -d
   ```
4. Execute as migrations:
   ```bash
   docker-compose exec app npx sequelize-cli db:migrate
   ```

## 📈 Roadmap

Funcionalidades planejadas para futuras versões:

- [ ] Integração com sistema de pagamentos
- [ ] App mobile com React Native
- [ ] Dashboard administrativo
- [ ] Sistema de fidelidade e recompensas
- [ ] Integração com APIs de delivery

## 👥 Contribuição

Contribuições são bem-vindas! Sinta-
