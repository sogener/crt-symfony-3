<?php

namespace App\Controller;

use App\Entity\Comments;
use App\Form\CommentType;
use App\Repository\ArticleRepository;
use App\Repository\CommentsRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ArticleController extends AbstractController
{
    #[Route('/article/{id}', name: 'article_detail')]
    public function show(int $id, ArticleRepository $articleRepository, CommentsRepository $commentsRepository, Request $request): Response
    {
        $article = $articleRepository->find($id);
        if ($article === null) {
            throw new \RuntimeException("Article with ID: {$id}. Does not exists");
        }

        $comment = new Comments();
        $comment->setCreatedAt(new \DateTimeImmutable('now'));
        $comment->setArticle($article);

        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $comment = $form->getData();

            // saving comment to the database
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comment);
            $entityManager->flush();
        }

        $comments = $commentsRepository->findBy(
            ['article' => $article->getId()]
        );

        return $this->render('articles/index.html.twig', [
            'heading' => $article->getTitle(),
            'article' => $article,
            'comments' => $comments,
            'form' => $form->createView()
        ]);
    }
}
