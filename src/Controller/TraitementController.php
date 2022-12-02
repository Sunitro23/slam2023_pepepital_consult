<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Traitement;
use App\Form\TraitementType;
Use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;

class TraitementController extends AbstractController
{
    #[Route('/traitements', name: 'traitements')]
    public function getLesTraitements(ManagerRegistry $doctrine) : Response
    {
        $repository=$doctrine->getRepository(Traitement::class);
        $lesTraitements = $repository->findAll();
        return $this->render('traitement/traitements.html.twig', [
            'lesTraitements' => $lesTraitements,
        ]);

    }

    #[Route('/traitement/{id}', name: 'traitement')]
    public function getUnTraitement(ManagerRegistry $doctrine, $id) : Response
    {
        $unTraitement = $doctrine->getRepository(Traitement::class)->find($id);
        return $this->render('traitement/traitements.html.twig', [
            'unTraitement' => $unTraitement,
        ]);
    }

    #[Route('/medecin/ajoutTraitements', name: 'ajoutTraitement')]
    public function addTraitement(Request $request, ManagerRegistry $doctrine) : Response
    {
        $em = $doctrine->getManager();
        //Creation formulaire Traitement
        $traitement = new Traitement();        
        $formTraitement = $this->createForm(TraitementType::class, $traitement);
        $formTraitement->handleRequest($request);

        if($formTraitement->isSubmitted() && $formTraitement->isValid()){
            $em->persist($traitement);
            $em->flush();       
            return $this->redirectToRoute('ajoutIndication',['id' => $traitement->getId()]);
           }

        return $this->render('traitement/ajoutTraitements.html.twig', array(
            'formTraitement' => $formTraitement->createView(),
        ));
    }

    #[Route('/medecin/modif/{id}', name: 'modif_traitement')]
    public function modif_traitement(Request $request, ManagerRegistry $doctrine, $id): Response
    {
        $em = $doctrine->getManager();
        $traitement = $doctrine->getRepository(Traitement::class)->find($id);

        $form = $this->createForm(TraitementType::class, $traitement);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($traitement);
            $em->flush();
            return $this->redirectToRoute('traitements');   
    }
    return $this->render('traitement/ajoutTraitements.html.twig', array(
        'form' => $form->createView(),
    ));
  }

  #[Route('/medecin/supp/{id}', name: 'supp_traitement')]
  public function del(ManagerRegistry $doctrine, $id): Response
  {
    $repository = $doctrine->getRepository(Traitement::class);
    $em = $doctrine->getManager();
    $traitement = $repository->find($id);
    $em->remove($traitement);
    $em->flush();
    return $this->redirectToRoute('traitements');
  }
}