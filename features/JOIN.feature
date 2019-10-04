Feature: Join

    Scenario:
    Fetch all the identifier products that are not variant product and in Accessories family ordered by identifier

    Given I fetch the results with the following query:
    """

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

    """
    Then the tuples should be:
      | root_product_model_code |
      | model-braided-hat       |
