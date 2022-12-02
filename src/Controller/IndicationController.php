<?php

namespace App\Controller;

use App\Entity\Traitement;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use App\Form\IndicationType;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Indication;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndicationController extends AbstractController
{
    #[Route('/indications', name: 'indications')]
    public function getLesIndications(ManagerRegistry $doctrine): Response
    {
        $em = $doctrine->getRepository(Indication::class);
        $lesIndications = $em->findAll();
        return $this->render('indication/index.html.twig', [
            'lesIndications' => $lesIndications,
        ]);
    }

    #[Route('/indication/{id}', name: 'indication')]
    public function getUneIndication(ManagerRegistry $doctrine, $id): Response
    {
        $uneIndication = $doctrine->getRepository(Indication::class)->find($id);
        return $this->render('indication/index.html.twig', [
            'uneIndication' => $uneIndication,
        ]);
    }

    #[Route('/medecin/ajoutIndication/{id}', name: 'ajoutIndication')]
    public function ajoutIndication(ManagerRegistry $doctrine, Request $request,$id): Response
    {
        $em = $doctrine->getManager();
        $indication = new Indication();
        $indication ->setTraitement($doctrine->getRepository(Traitement::class)->find($id));
        $form = $this->createForm(IndicationType::class,$indication);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($indication);
            $em->flush();
        }
        return $this->renderForm('indication/ajoutIndication.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/medecin/supprimerIndication/{id}', name: 'supprimerIndication')]
    public function supprimerIndication(ManagerRegistry $doctrine, Request $request,$id): Response
    {
        $em = $doctrine->getManager();
        $vm = $doctrine->getRepository(Indication::class);
        $indication = $vm->find($id);
        $form = $this->createFormBuilder($indication)
            ->add('save', SubmitType::class, array('label' => 'Oui.'))
            ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->remove($indication);
            $em->flush();
            return $this->redirectToRoute('indications');
        }
        return $this->renderForm('indication/supprimerIndication.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/medecin/modifierIndication/{id}', name: 'modifierIndication')]
    public function modifierIndication(ManagerRegistry $doctrine, Request $request,$id): Response
    {
        $em = $doctrine->getManager();
        $vm = $doctrine->getRepository(Indication::class);
        $indication = $vm->find($id);
        $form = $this->createForm(IndicationType::class,$indication);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $indication = $form->getData();
            $em->persist($indication);
            $em->flush();
            return $this->redirectToRoute('indication', ['id' => $id]);
        }
        return $this->renderForm('indication/modifierIndication.html.twig', [
            'form' => $form,
        ]);
    }
}
