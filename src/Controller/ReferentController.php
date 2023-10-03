<?php

namespace App\Controller;

use App\Entity\Referent;
use App\Repository\ReferentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ReferentController extends AbstractController
{
    // affichage de tous les referents
    #[Route('/referent', name: 'app_referent')]
       
    

    public function index(EntityManagerInterface $entityManager): Response
    {
        $referents = $entityManager->getRepository(Referent::class)->findAll();
        
        return $this->render('referent/index.html.twig', [
            'listes' => $referents,
        ]);

    }




}

