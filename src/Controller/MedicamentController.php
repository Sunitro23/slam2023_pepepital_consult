<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Medicament;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use App\Form\MedicamentType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class MedicamentController extends AbstractController
{
    #[Route('/medicaments', name: 'medicaments')]
    public function getLesMedocs(ManagerRegistry $doctrine): Response
    {
        $em = $doctrine->getRepository(Medicament::class);
        $lesMedicaments = $em->findAll();
        return $this->render('medicament/index.html.twig', [
            'lesMedicaments' => $lesMedicaments,
        ]);
    }

    #[Route('/medicament/{id}', name: 'medicament')]
    public function getUnMedoc(ManagerRegistry $doctrine, $id): Response
    {
        $unMedicament = $doctrine->getRepository(Medicament::class)->find($id);
        return $this->render('medicament/index.html.twig', [
            'unMedicament' => $unMedicament,
        ]);
    }

    #[Route('/medecin/ajoutMedicament', name: 'ajoutMedicament')]
    public function ajoutMedicament(Request $request, EntityManagerInterface $entityManager): Response
    {
        $medicament = new Medicament();
        $form = $this->createForm(MedicamentType::class, $medicament);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {

            $entityManager->persist($medicament);
            $entityManager->flush();
            
            return $this->redirectToRoute('medicaments');
        }

        return $this->renderForm('medicament/ajoutMedicament.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/medecin/modifMedicament/{id}', name:'modifMedicament')]
    public function modifMedicament(Request $request, ManagerRegistry $doctrine, $id): Response
    {
        $em=$doctrine->getManager();
        $medicament=$em->getRepository(Medicament::Class)->find($id);
        $form = $this->createForm(MedicamentType::class, $medicament);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $em->persist($medicament);
            $em->flush();
            return $this->redirectToRoute('medicaments');
        }
        return $this->renderForm('medicament/modifMedicament.html.twig',array(
            'form'=>$form,
        ));
    }

    #[Route('/medecin/supprimerMedicament/{id}', name: 'supprimerMedicament')]
    public function supprimerMedicament(Request $request, ManagerRegistry $doctrine, $id): Response
    {
        $em=$doctrine->getManager();
        $medicament=$em->getRepository(Medicament::Class)->find($id);
        $form = $this->createFormBuilder($medicament)
            ->add('submit', SubmitType::class)
            ->getForm();
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {

            $em->remove($medicament);
            $em->flush();
            
            return $this->redirectToRoute('medicaments');
        }

        return $this->renderForm('medicament/supprimerMedicament.html.twig', [
            'form' => $form,
        ]);
    }
}
