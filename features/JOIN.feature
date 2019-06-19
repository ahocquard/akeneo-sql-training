Feature: Masterize the different JOIN

  Scenario:
    Fetch all the identifier products that are not variant product

    Given I fetch the results with the following query:
    """
    SELECT identifier
    FROM akeneo_pim.pim_catalog_product p
    JOIN pim_catalog_family f ON f.id = p.family_id
    WHERE product_model_id IS NULL
    AND f.code = 'accessories'
    ORDER BY identifier;
    """
    Then the tuples should be:
    | identifier |
    | 1111111171 |
    | 1111111172 |
    | 1111111240 |
    | 1111111292 |
    | 1111111304 |

