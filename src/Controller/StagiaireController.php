<?php

namespace App\Controller;

use App\Entity\Stagiaire;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StagiaireController extends AbstractController
{
    #[Route('/stagiaire', name: 'app_stagiaire')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $stagiaire = $entityManager->getRepository(Stagiaire::class)->findBy([], ['nom' => 'ASC']);
        return $this->render('stagiaire/index.html.twig', [
            'stagiaire' => $stagiaire,
        ]);
    }
}
