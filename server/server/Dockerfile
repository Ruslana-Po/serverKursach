FROM gcc:12

RUN apt-get update && apt-get install -y g++ libpq-dev libpqxx-dev

WORKDIR /app

COPY . .

RUN g++ -o main *.cpp -lpqxx -lpq

EXPOSE 7432

CMD ["./main"]