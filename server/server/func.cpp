#include "header.h"

void ErrorOrNo(int meaning){
    if(meaning<0){
        cout<<"Error\n";
    }
 }

string find(pqxx::connection& conn, int number, const string& command){
      string result="";
       try {
        // Создание транзакции
        pqxx::work txn(conn);

        string query;
        pqxx::result res;

        // Поиск по коду
        if (number == 1) {
            query = "SELECT p.*, pc.unique_code FROM Products p JOIN ProductCodes pc ON p.product_id = pc.product_id WHERE p.product_id = " + command;
            res = txn.exec(query);
        }
        // Поиск по штрихкоду
        else if (number == 2) {
            query = "SELECT p.*, pc.unique_code FROM Products p JOIN ProductCodes pc ON p.product_id = pc.product_id WHERE p.barcode = " + txn.quote(command);
            res = txn.exec(query);
        }
        // Поиск по каталогу
        else if (number == 3) {
            query = "SELECT p.*, pc.unique_code FROM Products p JOIN Categories c ON p.category_id = c.category_id JOIN ProductCodes pc ON p.product_id = pc.product_id WHERE c.name ILIKE " + txn.quote('%' + command + '%');
            res = txn.exec(query);
        }
        // Поиск по названию
        else if (number == 4) {
            query = "SELECT p.*, pc.unique_code FROM Products p JOIN ProductCodes pc ON p.product_id = pc.product_id WHERE p.name ILIKE " + txn.quote('%' + command + '%');
            res = txn.exec(query);
        }

        // Проверка результата запроса
        if (res.size() > 0) {
            for (const auto& row : res) {
                //извлечения значения из объекта 
                int product_id = row[0].as<int>();
                string name = row[1].as<string>();
                double price = row[2].as<double>();
                string codeSh = row[3].as<string>();
                int description_id = row[5].as<int>();
                // Выполнение запроса для поиска кода продукта по product_id
                query = "SELECT unique_code FROM ProductCodes WHERE product_id = " + to_string(product_id);
                pqxx::result code_res = txn.exec(query);

                string unique_code = code_res.size() > 0 ? code_res[0][0].as<string>() : "Не найден";
                // Форматирование цены с двумя знаками после запятой
                stringstream price_stream;
                price_stream << fixed << setprecision(2) << price;
                string price_str = price_stream.str();

                // Выполнение запроса для поиска описания продукта по description_id
                query = "SELECT description FROM ProductDescriptions WHERE description_id = " + std::to_string(description_id);
                pqxx::result description_res = txn.exec(query);

                std::string description = description_res.size() > 0 ? description_res[0][0].as<std::string>() : "Описание не найдено";


                // Сборка результата в строку
                result += "Код: " + unique_code + "\n";
                result += "Название: " + name + "\n";
                result += "Штрихкод: " + codeSh + "\n";
                result += "Цена: " + price_str + "\n";
                result += "Описание: " + description + "\n";
                result += "-----------------------------\n";
            }
        } else {
            result = "Ничего не найдено\n";
        }

        // Подтверждение транзакции
        txn.commit();

    } catch (const exception &e) {
        cerr << e.what() << endl;
    }

    return result;

}

//Скидочные карты
// Функция для генерации уникального номера карты
string CardNumber(pqxx::work& txn) {
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dis(0, 1316134911);
    string card_number;
    bool card_number_exists;

    do {
        card_number = to_string(dis(gen));
        // Дополнение до 13 знаков
        card_number = string(13 - card_number.length(), '0') + card_number; 
        cout << card_number << endl;

        // Проверка наличия номера карты в таблице Card
        pqxx::result res = txn.exec("SELECT EXISTS (SELECT 1 FROM Card WHERE card_number = " + txn.quote(card_number) + ")");
        card_number_exists = res[0][0].as<bool>();
    } while (card_number_exists);

    return card_number;
}

// Функция для добавления номера телефона и уникального номера карты
string addCard(pqxx::connection& conn, const string& telephone) {
    string result = "";
    try {
        pqxx::work txn(conn);

        // Проверка наличия номера телефона в таблице Card
        pqxx::result res = txn.exec("SELECT EXISTS (SELECT 1 FROM Card WHERE telephone = " + txn.quote(telephone) + ")");
        bool telephone_exists = res[0][0].as<bool>();
        if (!telephone_exists) {
            // Генерация уникального номера карты
            string card_number = CardNumber(txn);
            cout << card_number << endl;
            // Вставка новой записи в таблицу Card
            txn.exec_params("INSERT INTO Card (telephone, card_number) VALUES ($1, $2)", telephone, card_number);
            txn.commit();
            result = "Добавил";
        } else {
            result = "Уже существует";
        }
    } catch (const exception &e) {
        cerr << e.what() << endl;
    }
    return result;
}

// Функция для проверки наличия номера телефона в таблице Card
bool checkTelephoneExists(pqxx::connection& conn, const string& telephone) {
    try {
        pqxx::work txn(conn);
        pqxx::result res = txn.exec("SELECT EXISTS (SELECT 1 FROM Card WHERE telephone = " + txn.quote(telephone) + ")");
        bool telephone_exists = res[0][0].as<bool>();
        txn.commit();
        return telephone_exists;
    } catch (const exception &e) {
        cerr << e.what() << endl;
        return false;
    }
}

string search(int number, string command){
    string result="";
    cout<<'\n'<<number<<" "<<command<<'\n';
    try {
        // Создание подключения к базе данных
        pqxx::connection conn("dbname=kassa user=postgres password=1251 host=db port=5432");
        if(number>=1&& number<=4){
            result=find(conn, number, command);
        }else if(number==5){
            result=addCard(conn,command);
        }else if(number==6){
            bool check= checkTelephoneExists(conn,command);
            if(check){
                result="Уже существует";
            }else{
                result ="Такого номера нету";
            }
        }

        
    } catch (const exception &e) {
        cerr << e.what() << endl;
        result = "Ошибка: " + string(e.what());
    }
    return result;
}

 //Отправление сообщения
 void sendAMessage(int system, char* buffer){
    //Новый код
    if(strlen(buffer)<3){
        string result="Ничего не найдено"+'\0';
     //Обратно
    for(size_t i=0; i< result.length();i++){
        buffer[i]=result[i];
    }
    //Отправляет сообщение  
    send(system, buffer, MAX_SIZE_BUF,0);
    return;
    }
    int number = buffer[0]- '0';
    string str="";
    //перенесла в строку
    for(size_t i=2; i<strlen(buffer);i++){
        str += buffer[i];
    }

    string result=search(number, str)+'\0';
    //Обратно
    for(size_t i=0; i< result.length();i++){
        buffer[i]=result[i];
    }
    //Отправляет сообщение  
    send(system, buffer, MAX_SIZE_BUF,0);
    
 }

 //Принять сообщение
 void AcceptTheMessage(int system, char* buffer){
     int bytes_received = recv(system, buffer, MAX_SIZE_BUF, 0);
    if (bytes_received <= 0) {
        throw runtime_error("Клиент отключен или произошла ошибка.");
        cerr << "Клиент отключен или произошла ошибка." << endl;
    }
 }

 //Связь с клиентом
 void Communication_With_Client(int server) {
    while (true) {
        static mutex g_lock;
        try {
            char buffer[MAX_SIZE_BUF];
            AcceptTheMessage(server, buffer);
            g_lock.lock();
            cout<<"Client № "<<server-3<<" : "<<endl;
            cout << buffer << endl;
            cout << "Server : " << endl;
            sendAMessage(server, buffer);
            cout << "Запрос выполнен" << endl;
            g_lock.unlock();
        } catch (const exception &e) {
            cerr << e.what() << endl;
            break;
        }
    }
    close(server);
}