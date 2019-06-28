Feature: Join

    Scenario:
    Fetch all the identifier products that are not variant product and in Accessories family ordered by identifier

    Given I fetch the results with the following query:
    """
    SELECT identifier
    FROM pim_catalog_product p
    JOIN pim_catalog_family f ON f.id = p.family_id
    WHERE product_model_id IS NULL
    AND f.code = 'accessories'
    ORDER BY identifier
    """
    Then the tuples should be:
    | identifier |
    | 1111111171 |
    | 1111111172 |
    | 1111111240 |
    | 1111111292 |
    | 1111111304 |

    Scenario:
    Fetch all codes of all families without any product

    Given I fetch the results with the following query:
    """
    SELECT f.code as family_code
    FROM pim_catalog_family f
    LEFT JOIN pim_catalog_product p ON p.family_id = f.id
    WHERE p.family_id IS NULL
    ORDER BY f.code
    """
    Then the tuples should be:
      | family_code |
      | headphones  |
      | mugs        |
      | tablets     |
      | tshirts     |

    Scenario:
    Get the combination of all channels and activated locales ordered by channel and locale code

    Given I fetch the results with the following query:
    """
    SELECT
        c.code as channel_code,
        l.code as locale_code
    FROM pim_catalog_channel c CROSS JOIN pim_catalog_locale l
    WHERE l.is_activated = 1
    ORDER BY c.code, l.code
    """
    Then the tuples should be:
      | channel_code | locale_code |
      | ecommerce    | de_DE       |
      | ecommerce    | en_US       |
      | ecommerce    | fr_FR       |
      | mobile       | de_DE       |
      | mobile       | en_US       |
      | mobile       | fr_FR       |
      | print        | de_DE       |
      | print        | en_US       |
      | print        | fr_FR       |

  Scenario:
  Get the code of the root product model for variant products belonging to Accessories family
  Be careful, a product model can have a parent also.
    Given I fetch the results with the following query:
    """
    SELECT DISTINCT COALESCE(pm2.code, pm1.code) as root_product_model_code
    FROM pim_catalog_product p
    JOIN pim_catalog_family f ON f.id = p.family_id
    JOIN pim_catalog_product_model pm1 ON pm1.id = p.product_model_id
    LEFT JOIN pim_catalog_product_model pm2 ON pm2.id = pm1.parent_id
    WHERE f.code = 'accessories'
    ORDER BY COALESCE(pm2.code, pm1.code)
    """
    Then the tuples should be:
      | root_product_model_code |
      | model-braided-hat       |
