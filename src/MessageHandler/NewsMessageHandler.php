<?php

namespace App\MessageHandler;

use App\Message\NewsMessage;
use App\Repository\NewsRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Messenger\Handler\MessageHandlerInterface;

final class NewsMessageHandler implements MessageHandlerInterface
{
    private EntityManagerInterface $em;
    private NewsRepository $newsRepository;

    /**
     * @param EntityManagerInterface $em
     * @param NewsRepository $newsRepository
     */
    public function __construct(EntityManagerInterface $em, NewsRepository $newsRepository)
    {
        $this->em = $em;
        $this->newsRepository = $newsRepository;
    }


    public function __invoke(NewsMessage $message)
    {
        $news = $this->newsRepository->find($message->getId());
        if (!$news) {
            return;
        }

        $news->setIsShow(true);

        $this->em->flush();
    }
}
