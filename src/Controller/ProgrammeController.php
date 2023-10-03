<?php

namespace App\Controller;
use App\Entity\Programme;
use App\Entity\Session;
use App\Repository\ProgrammeRepository;
use App\Repository\SessionRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProgrammeController extends AbstractController
{   
    // affichage de tous les programmes
    #[Route('/programme', name: 'app_programme')]
    public function index(ProgrammeRepository $programmeRepository): Response
    {
        $programmes = $programmeRepository->findAll();
        return $this->render('programme/index.html.twig', [
            'programmes' => $programmes,
        ]);
    }
    // affichage d'un programme details
    #[Route('/programme/{id}', name: 'show_programme')]
    public function show(Programme $programme):Response

    {
        
        return $this->render('programme/show.html.twig', [
            'programme' => $programme,
                      
         ]);
    }

    
}
