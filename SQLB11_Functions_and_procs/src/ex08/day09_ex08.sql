CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS TABLE (
    fib_numbers INTEGER
) AS $fnc_fibonacci$
DECLARE
    current_val INTEGER := 0;
    next_val INTEGER := 1;
    temp_val INTEGER;
BEGIN
    WHILE current_val < pstop LOOP
        fib_numbers := current_val;
        RETURN NEXT;

        temp_val := current_val + next_val;
        current_val := next_val;
        next_val := temp_val;
    END LOOP;
    RETURN;
END;
$fnc_fibonacci$ LANGUAGE plpgsql;


SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci(20);