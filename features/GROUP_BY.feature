Feature: Aggregation

    Scenario:
    Fetch all the families having strictly less than 10 products in it, ordered by family code

    Given I fetch the results with the following query:
    """
    SELECT family_code FROM (
        SELECT f.code as family_code, COUNT(p.id) as count_product_per_family
        FROM pim_catalog_family f
        LEFT JOIN pim_catalog_product p ON p.family_id = f.id
        GROUP BY f.code
        HAVING count_product_per_family < 10
    ) families
    ORDER BY family_code
    """
    Then the tuples should be:
    | f.code      |
    | headphones  |
    | mugs        |
    | tablets     |
    | tshirts     |
    | accessories |
