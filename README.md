### Hexlet tests and linter status:
[![Actions Status](https://github.com/VladyBarvy/devops-for-programmers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/VladyBarvy/devops-for-programmers-project-76/actions)


### Требования

Требованию к установке и запуску приложения:

1. Операционная система: Linux (рекомендуется Ubuntu)
2. Python: Версия 3.12 или выше
3. Ansible: Установлен на управляющем узле
4. Ansible Collections: community.docker
6. Ansible Roles: geerlingguy.pip, datadog.datadog

### Команды

Настройка окружения: `make setup`

Развертывание приложения: `make deploy`

### Ссылка на приложение

https://puffysound.ru





















Запустить контейнер:
```docker-compose up -d```

Остановить контейнер:
```docker-compose stop```

После каждой остановки ВМ у неё меняется IP-адрес, 
поэтому перед следующим подключением после нового запуска надо проверять актуальный IP-адрес. 

Подключение к ВМ vm-one:
```ssh -i ~/.ssh/id_yandex_one barvv@158.160.134.177```

Подключение к ВМ vm-two:
```ssh -i ~/.ssh/id_yandex_two barvv@158.160.185.160```



Запуск приложения на ВМ:
1. Удалить имеющиеся контейнеры:
```docker rm redmine postgres```
2. Запуск PostgreSQL
```
docker run -d \
  --name postgres \
  -e POSTGRES_USER=redmine \
  -e POSTGRES_PASSWORD=secret \
  -e POSTGRES_DB=redmine \
  --network=redmine-network \
  postgres:13
```
3. Запуск Redmine
```
docker run -d \
  --name redmine \
  -p 3000:3000 \
  -e REDMINE_DB_POSTGRES=postgres \
  -e REDMINE_DB_USERNAME=redmine \
  -e REDMINE_DB_PASSWORD=secret \
  -e REDMINE_DB_DATABASE=redmine \
  --network=redmine-network \
  redmine:latest
```
4. Проверка
```
http://<ваш-IP-адрес>:3000
```
проверить актуальный IP-адрес после нового запуска ВМ