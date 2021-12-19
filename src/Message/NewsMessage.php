<?php

namespace App\Message;

final class NewsMessage
{
    private int $id;
    private array $context;

    /**
     * @param $id
     * @param $context
     */
    public function __construct($id, $context)
    {
        $this->id = $id;
        $this->context = $context;
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return array
     */
    public function getContext(): array
    {
        return $this->context;
    }


}
