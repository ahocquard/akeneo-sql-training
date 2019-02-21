Feature: Product basket

  Scenario: Buying a single product under £10
    Given there is a "Sith Lord Lightsaber", which costs £5
    When there is a "Sith Lord Lightsaber", which costs £10
    Then there is an 'Anakin Lightsaber', which costs £10
    And there is a Lightsaber, which costs £2
    But there is a Lightsaber, which costs £25
