<?php

namespace App\Form;

use App\Entity\EffetsSecondaire;
use App\Entity\Medicament;
use Doctrine\DBAL\Types\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType as TypeTextType;

class EffetsSecondaireType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('libelle', TypeTextType::class, array('label' => 'Libéllé effets secondaires'))
            ->add('medicaments', EntityType::class, array('class' => Medicament::class, 'choice_label' => 'libelle', 'mapped' => false))
            ->add('save', SubmitType::class, array('label' => 'Enregistrer l\'effet secondaire'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => EffetsSecondaire::class,
        ]);
    }
}
