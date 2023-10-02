<?php

namespace App\Controller;


use App\Entity\Session;
use App\Entity\Referent;
use App\Entity\Programme;
use App\Entity\Stagiaire;
use App\Repository\SessionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;



class SessionController extends AbstractController
{
    #[Route('/session', name: 'app_session')]
    
    // public function index(EntityManagerInterface $entityManager): Response
    public function index(SessionRepository $sessionRepository): Response
    {
        // $sessions = $entityManager->getRepository(Session::class)->findAll();
        $session = $sessionRepository->findBy([],["dateDebut"=>"DESC"]);
          
             
        
        return $this->render('session/index.html.twig', [
           'session' => $session,
                     
        ]);
    }

    #[Route('/session/{id}', name: 'show_session')]
    public function show(Session $session):Response

    {
               
        return $this->render('session/show.html.twig', [
            'session' => $session,
                      
         ]);
    }


  

   
}

