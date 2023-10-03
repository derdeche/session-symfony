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
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class StagiaireType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom',TextType::class)
            ->add('prenom',TextType::class)
            ->add('ville',TextType::class)
            ->add('telephone',TextType::class)
            ->add('courriel',TextType::class)
            ->add('dateNaissance',DateType::class
            ,[
                'widget'=>'single_text',
                'format'=>'yyyy-MM-dd',
            ])
            ->add('sessions',EntityType::class
            ,[
                'class'=>Session::class,
                'choice_label'=>'session',
                'multiple'=>true,
                'expanded'=>true,
                'by_reference'=>false,
            ]
            )

            ->add('valider',SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Stagiaire::class,
        ]);
    }
}
