<?php

namespace App\Controller;

use App\Entity\News;
use App\Message\NewsMessage;
use App\Repository\NewsRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Messenger\MessageBusInterface;
use Symfony\Component\Routing\Annotation\Route;

class NewsController extends AbstractController
{
    #[Route('/news', name: 'news')]
    public function index(ManagerRegistry $doctrine): Response
    {
        $repository = $doctrine->getRepository(News::class);

        $news = $repository->findAll();

        return $this->render('news/index.html.twig', [
            'heading' => 'Новости',
            'news' => $news
        ]);
    }

    #[Route('/news/{id}', name: 'news_detail')]
    public function show(int $id, NewsRepository $newsRepository): Response
    {
        $newsDetail = $newsRepository->find($id);

        if ($newsDetail === null) {
            throw new \RuntimeException("News detail cannot be found with id {$id}");
        }


        return $this->render('news/detail.html.twig', [
            'heading' => $newsDetail->getTitle(),
            'newsDetail' => $newsDetail
        ]);
    }

    #[Route('/news/{id}/check', name: 'check')]
    public function check(int $id, NewsRepository $newsRepository, MessageBusInterface $bus): Response
    {
        $newsItem = $newsRepository->find($id);

        $bus->dispatch(new NewsMessage($newsItem->getId(), []));

        return $this->redirectToRoute('news_detail', ['id' => $id]);
    }
}
