INSERT INTO customers(id, full_name,
                      timestamp, delivery_address)
                      VALUES ('2', 'Dariga Zhakysh',
                              '2021-09-02', 'street Utepbaeva 42');
UPDATE customers
SET full_name = 'Aruzhan Zhakysh'
WHERE id = '2';

DELETE
FROM customers
WHERE id = '2';
