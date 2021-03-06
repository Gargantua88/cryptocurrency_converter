## Тестовое API на Rails

## Задание
### Конвертер криптовалют
Необходимо разработать API, реализующее конвертер из одной заданной валюты в другую.

1. Курсы валют брать из CoinMarketCap и обновлять раз в 5 минут
2. Необходимо хранить историю конвертаций валют
3. Методы API:
* Получение списка доступных для конвертации криптовалют
* Конвертация из одной заданной криптовалюты в другую. 
Как минимум метод должен реализовывать конвертацию BTC в любую другую доступную криптовалюту.
Усложненный (но необязательный) вариант: реализовать конвертации из любой доступной криптовалюты в любую.
* Получение истории конвертаций. По умолчанию должно возвращаться 10 последних операций
4. API является открытым (авторизация пользователей не нужна)
5. Frontend-часть реализовывать НЕ нужно!

Детали:
* За основу взять фреймворк Ruby On Rails
* Готовое задание разместить в своём профиле на Github
* Обертку для общения с CoinMarketCap реализовать самостоятельно, без использования уже существующих gem’ов.
Для остальных подзадач, использование gem’ов разрешено.

Дополнительные пожелания (выполнять НЕ обязательно):
* Покрыть тестами один из методов АПИ и логику синхронизации валют
* Добавить интерфейс, с помощью которого можно будет протестировать API “вручную” (Например, swagger). 

## Запуск
1. Зарегистрироваться и получить API key для запросов в coinmarketcap вот [тут](https://coinmarketcap.com/api/)
2. Завести в корне директории файл `.env` и скопировать в него свой ключ, полученный в предыдущем шаге
(см. файл `.env.example`)
3. Выполните `bundle install`
4. Выполните `rails db:migrate`
5. Создайте фоновую задачу общения с coinmarketcap `whenever --update-crontab` 
(для запуска на development окружении `whenever --update-crontab --set environment=development`)

## Формат запросов

Для получение списка доступных для конвертации криптовалют отправьте GET запрос на *[host]/cryptocurrencies*
```
[host]/cryptocurrencies
```

Для конвертации из одной криптовалюты в другую отправьте POST запрос на *[host]/conversions*
с 3 параметрами(конвертируемая криптовалюта(**initial_currency_sym**), конечная криптовалюта(**final_currency_sym**),
сумма конвертируемой валюты(**amount**))

Криптовалюты в параметры передаются символами:
```
[host]/conversions?conversion[initial_currency_sym]=BTC&conversion[final_currency_sym]=ETH&conversion[amount]=2
```

Для получения истории конвертаций отправьте GET запрос на *[host]/conversions* 
Без параметра запрос вернет последние 10 операций.
С параметром **last** и значением **n** - вернет последние **n** операций:
```
[host]/conversions?last=5
```