# Imagen base oficial de Ruby
FROM ruby:3.2

# Establece el directorio de trabajo
WORKDIR /app

# Copia todos los archivos del proyecto
COPY . .

# Instala bundler y las dependencias del proyecto
RUN gem install bundler && bundle install

# Expone el puerto que usará el microservicio
EXPOSE 3079

# Comando para iniciar el microservicio en el puerto 3079
CMD ["ruby", "main.rb", "-p", "3079"]
