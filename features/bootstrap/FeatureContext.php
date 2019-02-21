<?php

use App\FetchResultsFromRequest;
use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Doctrine\DBAL\Connection;

/**
 * Defines application features from the specific context.
 */
class FeatureContext implements Context
{
    /** @var FetchResultsFromRequest */
    private $fetchResult;

    public function __construct(FetchResultsFromRequest $fetchResultsFromRequest)
    {
        $this->fetchResult = $fetchResultsFromRequest;
    }

    /**
     * @Given there is a(n) :arg1, which costs £:arg2
     */
    public function thereIsAWhichCostsPs($arg1, $arg2)
    {

    }
}
