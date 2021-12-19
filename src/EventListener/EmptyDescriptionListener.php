<?php

namespace App\EventListener;

use App\Entity\News;
use Doctrine\ORM\Event\LifecycleEventArgs;

class EmptyDescriptionListener
{
    public function preUpdate(News $news, LifecycleEventArgs $eventArgs): void
    {
        if (empty($news->getDescription())) {
            $news->setDescription('Значение для пустого описания');
        }
    }
}