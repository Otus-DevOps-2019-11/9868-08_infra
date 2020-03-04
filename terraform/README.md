
# 9868-08_infra
9868-08 Infra repository

## Homework-9 Terraform-2

#### В процессе сделано:

- настройка и импорт ресурсов firewall с помощью Terraform;
- настройка ресурса IP адреса;
- структуризация ресурсов: созданы 2 виртуальные машины app (app.tf) и db (db.tf), правило firewall пересено в vpc.tf;
- созданы и параметризованы модули для приложения (app), базы данных (db), firewall (vpc);
- созданы окружения  prod и stage, которые используют описанные выше модули;
- работы с реестром модулей: использование модуля storage-bucket.



=======
Практика IaC c использованием Terraform v0.12.8 + provider.google v2.15.0\n
Создаем VM согласно описанию\n
* appuser and appuser1 working\n
* добавление ssh ключей пользователей (appuser,appuser1 через конфиг terraform и appuser_web через GUI в метаданные проекта)

