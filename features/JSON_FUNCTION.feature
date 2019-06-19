Feature: JSON function (included aggregation)
# You can activate the wrapping of your lines in the IDE to ease the reading of the expected result

    Scenario:
    Fetch all the attributes of a family, the attribute as label code, the attribute as image code and the translations
    with the same format as in the expected result.


    Given I fetch the results with the following query:
    """
       SELECT
            f.code as family_code,
            a_label.code as attribute_as_label_code,
            a_image.code as attribute_as_image_code,
            attributes.attributes as attribute_codes,
            JSON_ARRAYAGG(JSON_OBJECT('locale', ft.locale, 'label', ft.label)) as translations
        FROM pim_catalog_family f
        LEFT JOIN pim_catalog_attribute a_label on a_label.id = f.label_attribute_id
        LEFT JOIN pim_catalog_attribute a_image on a_image.id = f.image_attribute_id
        LEFT JOIN pim_catalog_family_translation ft on ft.foreign_key = f.id
        LEFT JOIN (
            SELECT
                f.id as family_attribute_id,
                JSON_ARRAYAGG(a.code) as attributes
            FROM pim_catalog_family f
            JOIN pim_catalog_family_attribute fa on fa.family_id = f.id
            JOIN pim_catalog_attribute a on a.id = fa.attribute_id
            GROUP BY f.code
            ORDER by f.code
        ) as attributes on attributes.family_attribute_id = f.id
        WHERE f.code IN ('accessories')
        GROUP BY f.code, a_label.code, a_image.code;
    """
    Then the tuples should be:
      | family_code | attribute_as_label_code | attribute_as_image_code | attribute_codes | translations |
      | accessories | name                    | image                   | ["sku", "name", "description", "price", "weight", "erp_name", "meta_title", "meta_description", "keywords", "image", "notice", "variation_name", "variation_image", "collection", "composition", "color", "size", "brand", "ean", "supplier", "material"] | [{"label": "Accessories", "locale": "en_US"}, {"label": "Accessories", "locale": "fr_FR"}, {"label": "Accessories", "locale": "de_DE"}] |


    Scenario:
    Fetch the raw values of products 1111111158 and tvsam32 with the inherited values.

    Given I fetch the results with the following query:
    """
        SELECT
            p.identifier,
            JSON_MERGE(COALESCE(pm1.raw_values, '{}'), COALESCE(pm2.raw_values, '{}'), p.raw_values) as raw_values
        FROM
            pim_catalog_product p
            LEFT JOIN pim_catalog_product_model pm1 ON pm1.id = p.product_model_id
            LEFT JOIN pim_catalog_product_model pm2 on pm2.id = pm1.parent_id
            LEFT JOIN pim_catalog_family f ON f.id = p.family_id
        WHERE  p.identifier IN ('1111111158', 'tvsam32')
        ORDER BY p.identifier;
    """
        Then the tuples should be:
            | identifier | raw_values |
            | 1111111158 | {"ean": {"<all_channels>": {"<all_locales>": "1234567890170"}}, "sku": {"<all_channels>": {"<all_locales>": "1111111158"}}, "name": {"<all_channels>": {"<all_locales>": "Slightly washed denim shorts"}}, "size": {"<all_channels>": {"<all_locales>": "xxl"}}, "color": {"<all_channels>": {"<all_locales>": "blue"}}, "image": {"<all_channels>": {"<all_locales>": "c/4/5/c/c45c2c2522fcad44b480b4509e599861e3436025_bacchus.jpg"}}, "price": {"<all_channels>": {"<all_locales>": [{"amount": "599.00", "currency": "EUR"}, {"amount": null, "currency": "USD"}]}}, "weight": {"<all_channels>": {"<all_locales>": {"unit": "GRAM", "amount": "800.0000", "family": "Weight", "base_data": "0.800", "base_unit": "KILOGRAM"}}}, "erp_name": {"<all_channels>": {"en_US": "Bacchus"}}, "supplier": {"<all_channels>": {"<all_locales>": "zaro"}}, "collection": {"<all_channels>": {"<all_locales>": ["summer_2016"]}}, "description": {"ecommerce": {"en_US": "Slightly washed denim shorts with worn finish on the front. The model is 185cm and is wearing a size UK 32, size 42 EN 100% cotton. Machine washable."}}, "variation_name": {"<all_channels>": {"en_US": "Bacchus blue"}}, "variation_image": {"<all_channels>": {"<all_locales>": "2/7/0/5/27051fab5b4f0492f552bddcff9fc218f2156850_bacchus.jpg"}}, "wash_temperature": {"<all_channels>": {"<all_locales>": "600"}}} |
            | tvsam32 | {"sku": {"<all_channels>": {"<all_locales>": "tvsam32"}}, "name": {"<all_channels>": {"<all_locales>": "TV SAMSUNG"}}, "picture": {"<all_channels>": {"<all_locales>": "b/7/a/7/b7a7141669a8eb58daa977328364ff6ab10d02e1_samtv.jpg"}}, "description": {"ecommerce": {"en_US": "TV SAMSUNG"}}, "display_diagonal": {"<all_channels>": {"<all_locales>": {"unit": "INCH", "amount": 32, "family": "Length", "base_data": "0.8128", "base_unit": "METER"}}}} |
