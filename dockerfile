# Usa a imagem oficial do Node.js como base
FROM node:18

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia os arquivos do projeto
COPY package.json ./
COPY package-lock.json ./

# Instala as dependências
RUN npm install

# Copia todo o código do projeto
COPY . .

# Expõe a porta padrão do NestJS
EXPOSE 3000

# Comando para rodar o servidor
CMD ["npm", "run", "start"]