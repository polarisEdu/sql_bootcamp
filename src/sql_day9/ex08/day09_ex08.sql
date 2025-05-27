CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE(fibonacci_number INT) AS $$
DECLARE
    a INT := 0;  
    b INT := 1;  
BEGIN

    IF a < pstop THEN
        RETURN NEXT a;
    END IF;

    IF b < pstop THEN
        RETURN NEXT b;
    END IF;


    WHILE b < pstop LOOP

        a := a + b;
        b := a + b;


        IF a < pstop THEN
            fibonacci_number := a;
            RETURN NEXT;
        END IF;

        IF b < pstop THEN
            fibonacci_number := b;
            RETURN NEXT;
        END IF;
    END LOOP;

    RETURN;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
