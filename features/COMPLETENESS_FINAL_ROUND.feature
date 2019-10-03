Feature: POC Completeness calculation in SQL


    Scenario:
    Calculate the completeness per product, channel, locale.
    For the exercise, a values is considered as complete if the attribute is required for the channel and if it exists in the raw values.

    This is obviously not the case in reality (asset, price, etc).
    Don't pay attention to performance also.

    Here, we are getting only the 5 first results just to know the expected format.

    Given I fetch the results with the following query:
    """
    SELECT
        id,
        channel_id,
        locale_id,
        SUM(is_value_filled) as number_of_values_filled,
        COUNT(is_value_filled) as number_of_values_required,
        SUM(is_value_filled)/COUNT(is_value_filled) * 100 as ratio
    FROM (
        SELECT
            id,
            IF(
                JSON_EXTRACT(
                    raw_values,
                    CONCAT('$.', attribute_code, '.', IF(is_scopable = 1, channel_code, '"<all_channels>"'), '.', IF(is_localizable = 1, locale_code, '"<all_locales>"'))
                ) IS NULL,
                0,
                1
            ) as is_value_filled,
            channel_id,
            locale_id
        FROM
        (
            SELECT
                p.id,
                a.code as attribute_code,
                c.code as channel_code,
                c.id as channel_id,
                l.code as locale_code,
                l.id as locale_id,
                a.is_scopable,
                a.is_localizable,
                JSON_MERGE(COALESCE(pm.raw_values, '{}'), COALESCE(pm2.raw_values, '{}'), p.raw_values) as raw_values
            FROM pim_catalog_attribute_requirement ar
            JOIN pim_catalog_family f ON f.id = ar.family_id
            JOIN pim_catalog_attribute a ON a.id = ar.attribute_id
            JOIN pim_catalog_channel c ON c.id = ar.channel_id
            JOIN pim_catalog_channel_locale cl ON cl.channel_id = c.id
            JOIN pim_catalog_locale l ON l.id = cl.locale_id
            JOIN pim_catalog_product p ON p.family_id = ar.family_id
            LEFT JOIN pim_catalog_product_model pm ON pm.id = p.product_model_id
            LEFT JOIN pim_catalog_product_model pm2 ON pm2.id = pm.parent_id
        ) as e
    ) as completeness
    GROUP BY id, channel_id, locale_id
    ORDER BY id, channel_id, locale_id
    LIMIT 5
;


    """
        Then the tuples should be:
        | id | channel_id | locale_id | number_of_values_filled | number_of_values_required | ratio   |
        | 1  | 1          | 39        | 4                       | 6                         | 66.6667 |
        | 1  | 1          | 58        | 4                       | 6                         | 66.6667 |
        | 1  | 1          | 90        | 4                       | 6                         | 66.6667 |
        | 1  | 2          | 39        | 4                       | 6                         | 66.6667 |
        | 1  | 2          | 58        | 4                       | 6                         | 66.6667 |




