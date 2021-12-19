<?php

namespace App\EventListener;

use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Twig\Environment;

class TwigEventListener
{
    private Environment $twig;

    /**
     * @param Environment $twig
     */
    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
    }

    public function onKernelController(ControllerEvent $event)
    {
        $this->twig->addGlobal('time', new \DateTime('now'));
    }


}
