-- SELECT services.description FROM services
-- RIGHT OUTER JOIN customers_services
--              ON customers_services.services_id = services.id
-- WHERE customers_services.services_id IS NULL;

SELECT description FROM customers_services
RIGHT OUTER JOIN services
              ON services.id = services_id
WHERE services_id IS NULL;