<?php

declare(strict_types=1);

namespace App;

use Doctrine\DBAL\Connection;

final class FetchResultsFromRequest
{
    /** @var Connection */
    private $connection;

    public function __construct(Connection $connection)
    {
        $this->connection = $connection;
    }

    public function fetch(string $sql)
    {
        $this->connection->executeQuery($sql)->fetchAll();
    }
}
