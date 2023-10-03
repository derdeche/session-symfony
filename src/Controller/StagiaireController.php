<?php

namespace App\Controller;

// use App\Entity\Session;
use App\Entity\Stagiaire;
use App\Form\StagiaireType;
use App\Repository\StagiaireRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class StagiaireController extends AbstractController
{
    // affichage de tous les stagiaires
    #[Route('/stagiaire', name: 'app_stagiaire')]
    public function index(StagiaireRepository $stagiaireRepository): Response
    {
        $stagiaire = $stagiaireRepository->findBy([], ['nom' => 'ASC']);
        return $this->render('stagiaire/index.html.twig', [
            'stagiaire' => $stagiaire,
        ]);
    }

    // affichage details stagiaire + modif stagiaire
    #[Route('/stagiaire/new', name: 'new_stagiaire')]
    public function new(Request $request ,  EntityManagerInterface $entityManager): Response
    {
        $stagiaire = new Stagiaire();
       

        $form = $this->createForm(StagiaireType::class, $stagiaire);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            
            $session = $form->getData();
            // prepare PDO
            $entityManager->persist($stagiaire);
            //execute PDO  
            $entityManager->flush();

           

            return $this->redirectToRoute('app_stagiaire');
        }

        return $this->render('stagiaire/new.html.twig', [
            'formAddStagiaire' => $form,
        ]);
    }  

    // affichage details stagiaire + delete stagiaire
    #[Route('/stagiaire/{id}/delete', name: 'delete_stagiaire')]
    
    public function delete(Stagiaire $stagiaire , EntityManagerInterface $entityManager): Response
    {
        $entityManager->remove($stagiaire);
        $entityManager->flush();
        return $this->redirectToRoute('app_stagiaire');
    }

    #[Route('/stagiaire/{id}', name: 'show_stagiaire')]
    public function show(Stagiaire $stagiaire):Response

    {
        
        return $this->render('stagiaire/show.html.twig', [
            'stagiaire' => $stagiaire,
                      
         ]);
    }
}
