<?php

namespace App\Service;

class RandomMessageGenerator extends Message
{
    public function getRandomMessage(): string
    {
        return $this->messages[array_rand($this->messages)];
    }
}