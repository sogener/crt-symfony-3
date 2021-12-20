<?php

namespace App\Service;

abstract class Message implements MessageInterface
{
    protected array $messages = ['Привет', 'Ух-ты', 'Классно'];
}