# День 08 - Транзакции и уровни изоляции

## _Изоляция - одно из ACID свойств_

**Описание:** Изучение работы базы данных с транзакциями и уровнями изоляции, исследование аномалий данных.

## Изученные концепции

**4 фундаментальные аномалии данных:**
- Lost Update Anomaly (потерянное обновление)
- Dirty Reads Anomaly (грязное чтение)
- Non-repeatable Reads Anomaly (неповторяющееся чтение)
- Phantom Read Anomaly (фантомное чтение)

**Уровни изоляции ANSI SQL:**
- READ UNCOMMITTED
- READ COMMITTED  
- REPEATABLE READ
- SERIALIZABLE

## Выполненные задания

- **00**: Простая транзакция - демонстрация видимости изменений до и после COMMIT
- **01**: Lost Update Anomaly на уровне READ COMMITTED
- **02**: Lost Update для REPEATABLE READ - защита от аномалии
- **03**: Non-Repeatable Reads на уровне READ COMMITTED
- **04**: Non-Repeatable Reads для SERIALIZABLE - предотвращение аномалии
- **05**: Phantom Reads на уровне READ COMMITTED
- **06**: Phantom Reads для REPEATABLE READ - частичная защита
- **07**: Deadlock - воспроизведение взаимной блокировки

**Каждое задание включает:**
- SQL скрипт с комментариями для двух сессий
- Скриншоты вывода psql для обеих сессий
- Демонстрация поведения на конкретных уровнях изоляции

## Технологии

- PostgreSQL
- psql (командная строка)
- Транзакции, уровни изоляции
- Параллельные сессии