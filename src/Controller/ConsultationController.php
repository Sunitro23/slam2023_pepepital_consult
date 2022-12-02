<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Consultation;
use App\Form\ConsultationType;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class ConsultationController extends AbstractController
{
    #[Route('/consultations', name: 'consultations')]
    public function getLesConsultations(ManagerRegistry $doctrine): Response
    {
        $em = $doctrine->getRepository(Consultation::class);
        $lesConsultations = $em->findAll();
        return $this->render('consultation/index.html.twig', [
            'lesConsultations' => $lesConsultations,
        ]);
    }

    #[Route('/consultation/{id}', name: 'consultation')]
    public function getUneConsultation(ManagerRegistry $doctrine, $id): Response
    {
        $uneConsultation = $doctrine->getRepository(Consultation::class)->find($id);
        return $this->render('consultation/index.html.twig', [
            'uneConsultation' => $uneConsultation,
        ]);
    }

    #[Route('/ajoutConsultation', name: 'ajoutConsultation')]
    public function ajoutConsultation(Request $request, EntityManagerInterface $entityManager): Response
    {
        $consultation = new Consultation();
        $form = $this->createForm(ConsultationType::class, $consultation);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {

            $entityManager->persist($consultation);
            $entityManager->flush();
            
            return $this->redirectToRoute('consultations');
        }

        return $this->renderForm('consultation/ajoutConsultation.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/modifConsultation/{id}', name:'modifConsultation')]
    public function modifConsultation(Request $request, ManagerRegistry $doctrine, $id): Response
    {
        $em=$doctrine->getManager();
        $consultation=$em->getRepository(Consultation::class)->find($id);
        $form = $this->createForm(ConsultationType::class, $consultation);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $em->persist($consultation);
            $em->flush();
            return $this->redirectToRoute('consultations');
        }
        return $this->renderForm('consultation/modifConsultation.html.twig',array(
            'form'=>$form,
        ));
    }

    #[Route('/supprimerConsultation/{id}', name: 'supprimerConsultation')]
    public function supprimerMedicament(Request $request, ManagerRegistry $doctrine, $id): Response
    {
        $em=$doctrine->getManager();
        $consultation=$em->getRepository(Consultation::class)->find($id);
        $form = $this->createFormBuilder($consultation)
            ->add('submit', SubmitType::class)
            ->getForm();
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {

            $em->remove($consultation);
            $em->flush();
            
            return $this->redirectToRoute('consultations');
        }

        return $this->renderForm('consultation/supprimerConsultation.html.twig', [
            'form' => $form,
        ]);
    }
}