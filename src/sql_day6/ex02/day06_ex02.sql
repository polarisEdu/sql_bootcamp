SELECT 
    p.name AS person_name,          
    m.pizza_name,                 
    m.price,                       
    TO_CHAR(m.price * (1 - pd.discount / 100), 'FM999999999.99') AS discount_price, 
    pi.name AS pizzeria_name       
FROM 
    person_order po
JOIN 
    menu m ON po.menu_id = m.id          
JOIN 
    pizzeria pi ON m.pizzeria_id = pi.id 
JOIN 
    person p ON po.person_id = p.id      
LEFT JOIN 
    person_discounts pd ON p.id = pd.person_id AND pi.id = pd.pizzeria_id 
ORDER BY 
    p.name,                              
    m.pizza_name;                        
