//потоки
#include <thread>
#include <pqxx/pqxx> 
//блокировка
#include<mutex> 
#include<locale>
#include <fstream>
#include <sstream>
#include<iostream>
#include<string.h>
#include<iomanip>
#include <random>
//exit
#include<unistd.h>
#include<stdlib.h>
//содержит функции для работы с сетевыми адресами, такие как htons.
#include<arpa/inet.h>
//определяет символы, начинающиеся с " AF_ " для различных видов сетей и для работы сокетов
#include<sys/socket.h>
//функции для работы с сетевыми именами и адресами.
#include<netdb.h>
//содержащую определения для работы с интернет-адресами и портами.
#include<netinet/in.h>

//#define SERVER_IP "10.241.107.115"
#define NUMBER_PORT 7432
#define MAX_SIZE_BUF 10000

using namespace std;

void ErrorOrNo(int meaning);
void Communication_With_Client(int server);