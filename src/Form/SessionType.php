<?php

namespace App\Form;

use App\Entity\Session;
use App\Entity\Stagiaire;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class SessionType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('session', TextType::class)
            ->add('nbPlace', NumberType::class)
            ->add('dateDebut', DateType::class)
            ->add('dateFin', DateType::class)
            // ->add('stagiaires',EntityType::class
            // ,[
            //     'class'=>Stagiaire::class,
            //     'choice_label'=>'nom',
            //     'multiple'=>true,
            //     'expanded'=>true,
            //     'by_reference'=>false
            // ]
            // )
            ->add('referent',TextType::class)
            ->add('valider',SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Session::class,
        ]);
    }
}
