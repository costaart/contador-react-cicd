# Etapa 1: build da aplicação
FROM node:20 AS build

# Define diretório de trabalho
WORKDIR /app

# Copia package.json e package-lock.json (ou yarn.lock)
COPY package*.json ./

# Instala dependências
RUN npm install

# Copia o restante do código
COPY . .

# Build para produção
RUN npm run build

# Etapa 2: servidor Nginx para servir arquivos
FROM nginx:stable-alpine

# Copia arquivos buildados para o Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Expor a porta padrão
EXPOSE 80

# Comando padrão
CMD ["nginx", "-g", "daemon off;"]
