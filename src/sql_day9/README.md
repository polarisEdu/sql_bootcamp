# День 09 - Функциональные блоки в базах данных

## _РСУБД - это не только таблицы_

**Описание:** Создание и использование функциональных блоков в базах данных: триггеры, функции, процедуры.

## Изученные концепции

**Функциональные языки в РСУБД:**
- T-SQL, PL/SQL, PL/PGSQL, PL/R, PL/Python

**Два подхода к бизнес-логике:**
- На уровне приложения (Application Level)
- Непосредственно в РСУБД (UDF/Procedures/Packages)

**Типы объектов базы данных:**
- Database Trigger Functions
- Database Triggers  
- SQL Functions
- PL/pgSQL Functions

## Выполненные задания

- **00**: Аудит INSERT операций - создание таблицы person_audit и триггера
- **01**: Аудит UPDATE операций - триггер для отслеживания изменений
- **02**: Аудит DELETE операций - триггер для удаления записей
- **03**: Универсальный аудит - объединение всех триггеров в один
- **04**: SQL функции fnc_persons_female и fnc_persons_male
- **05**: Параметризованная функция fnc_persons с параметром pgender
- **06**: PL/pgSQL функция fnc_person_visits_and_eats_on_date с тремя параметрами
- **07**: Функция func_minimum для поиска минимума в массиве
- **08**: Функция fnc_fibonacci для генерации чисел Фибоначчи

**Пример создания триггера:**
```sql
CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO person_audit VALUES(NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();
```

## Технологии

- PostgreSQL
- SQL, PL/pgSQL
- Триггеры, функции
- Аудит данных