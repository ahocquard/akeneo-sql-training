Feature: Aggregation

    Scenario:
    Fetch all the families having strictly less than 10 products in it, ordered by family code

    Given I fetch the results with the following query:
    """

    """
    Then the tuples should be:
    | family_code |
    | accessories |
    | headphones  |
    | mugs        |
    | tablets     |
    | tshirts     |
