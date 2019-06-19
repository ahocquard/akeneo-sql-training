<?php

use App\FetchResultsFromRequest;
use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use PHPUnit\Framework\Assert;

class FeatureContext implements Context
{
    /** @var FetchResultsFromRequest */
    private $fetchResult;

    private $result;

    public function __construct(FetchResultsFromRequest $fetchResultsFromRequest)
    {
        $this->fetchResult = $fetchResultsFromRequest;
    }

    /**
     * @Given /^I fetch the results with the following query:$/
     */
    public function iFetchTheResultsWithTheFollowingQuery(PyStringNode $string)
    {
        $this->result = $this->fetchResult->fetch($string->getRaw());
    }

    /**
     * @Then /^the tuples should be:$/
     */
    public function theTuplesShouldBe(TableNode $table)
    {
        $notIndexedExpectedRows = $table->getRows();
        if (count($notIndexedExpectedRows) < 2) {
            throw new LogicException('There should be at least column names and one line of tuples');
        }
        $headers = array_shift($notIndexedExpectedRows);

        $expectedRows = [];
        foreach ($notIndexedExpectedRows as $notIndexedExpectedRow) {
            $expectedRows[] = array_combine($headers, $notIndexedExpectedRow);
        }

        Assert::assertEqualsCanonicalizing($expectedRows, $this->result);
    }
}
