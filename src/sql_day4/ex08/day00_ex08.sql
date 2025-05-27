DROP VIEW v_generated_dates;
DROP VIEW v_persons_female;
DROP VIEW v_persons_male;
DROP VIEW v_price_with_discount;
DROP VIEW v_symmetric_union;
DROP materialized VIEW mv_dmitriy_visits_and_eats;


SELECT count(*) = 0 AS CHECK
FROM pg_class
WHERE relname IN ('v_generated_dates',
                  'v_persons_female',
                  'v_persons_male',
                  'v_price_with_discount',
                  'v_symmetric_union',
                  'mv_dmitriy_visits_and_eats')