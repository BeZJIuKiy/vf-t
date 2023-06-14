FROM node:16

# Создаем директорию приложения
WORKDIR /app

# Копируем package.json и yarn.lock в рабочую директорию
COPY package.json .
COPY yarn.lock .

# Устанавливаем зависимости
RUN yarn install --production

# Копируем build, node_modules и vite.config.js в рабочую директорию
COPY build build
COPY node_modules node_modules
COPY vite.config.js .

# Запускаем приложение
CMD ["yarn", "run", "preview"]
