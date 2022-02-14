<?php

namespace App\EventSubscriber;

use App\Repository\CommentsRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Twig\Environment;

class TwigEventSubscriber implements EventSubscriberInterface
{
    private Environment $twig;
    private CommentsRepository $commentsRepository;

    /**
     * @param Environment $twig
     * @param CommentsRepository $commentsRepository
     */
    public function __construct(Environment $twig, CommentsRepository $commentsRepository)
    {
        $this->twig = $twig;
        $this->commentsRepository = $commentsRepository;
    }


    public function onKernelController(ControllerEvent $event)
    {
        $this->twig->addGlobal('header', [
            [
                'name' => 'Об авторе',
                'href' => 'author'
            ],
            [
                'name' => 'Админ панель',
                'href' => 'admin'
            ],
            [
                'name' => 'Новости',
                'href' => 'news'
            ],
            [
                'name' => 'Статьи',
                'href' => 'index'
                'href' => 'index'
            ],
        ]);
    }


    public static function getSubscribedEvents()
    {
        return [
            'kernel.controller' => 'onKernelController',
        ];
    }
}
