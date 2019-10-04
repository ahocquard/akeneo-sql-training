Feature: POC Completeness calculation in SQL


    Scenario:
    Calculate the completeness per product, channel, locale.
    For the exercise, a values is considered as complete if the attribute is required for the channel and if it exists in the raw values.

    This is obviously not the case in reality (asset, price, etc).
    Don't pay attention to performance also.

    Here, we are getting only the 5 first results just to know the expected format.

    Given I fetch the results with the following query:
    """

    """
        Then the tuples should be:
        | id | channel_id | locale_id | number_of_values_filled | number_of_values_required | ratio   |
        | 1  | 1          | 39        | 4                       | 6                         | 66.6667 |
        | 1  | 1          | 58        | 4                       | 6                         | 66.6667 |
        | 1  | 1          | 90        | 4                       | 6                         | 66.6667 |
        | 1  | 2          | 39        | 4                       | 6                         | 66.6667 |
        | 1  | 2          | 58        | 4                       | 6                         | 66.6667 |




