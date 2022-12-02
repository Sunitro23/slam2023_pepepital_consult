<?php

namespace App\Controller;

use App\Entity\EffetsSecondaire;
use App\Form\EffetsSecondaireType;
use App\Repository\EffetsSecondaireRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EffetsSecondaireController extends AbstractController
{
    #[Route('/effets-secondaires', name: 'app_effets_secondaire_index', methods: ['GET'])]
    public function index(EffetsSecondaireRepository $effetsSecondaireRepository): Response
    {
        return $this->render('effets_secondaire/index.html.twig', [
            'effets_secondaires' => $effetsSecondaireRepository->findAll(),
        ]);
    }

    #[Route('/pharmacien/effets-secondaires/new', name: 'app_effets_secondaire_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EffetsSecondaireRepository $effetsSecondaireRepository): Response
    {
        $effetsSecondaire = new EffetsSecondaire();
        $form = $this->createForm(EffetsSecondaireType::class, $effetsSecondaire);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $effetsSecondaireRepository->save($effetsSecondaire, true);

            return $this->redirectToRoute('app_effets_secondaire_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('effets_secondaire/new.html.twig', [
            'effets_secondaire' => $effetsSecondaire,
            'form' => $form,
        ]);
    }

    #[Route('/effets-secondaires/{id}', name: 'app_effets_secondaire_show', methods: ['GET'])]
    public function show(EffetsSecondaire $effetsSecondaire): Response
    {
        return $this->render('effets_secondaire/show.html.twig', [
            'effets_secondaire' => $effetsSecondaire,
        ]);
    }

    #[Route('/pharmacien/effets-secondaires/{id}/edit', name: 'app_effets_secondaire_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, EffetsSecondaire $effetsSecondaire, EffetsSecondaireRepository $effetsSecondaireRepository): Response
    {
        $form = $this->createForm(EffetsSecondaireType::class, $effetsSecondaire);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $effetsSecondaireRepository->save($effetsSecondaire, true);

            return $this->redirectToRoute('app_effets_secondaire_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('effets_secondaire/edit.html.twig', [
            'effets_secondaire' => $effetsSecondaire,
            'form' => $form,
        ]);
    }

    #[Route('/pharmacien/effets-secondaires/delete/{id}', name: 'app_effets_secondaire_delete', methods: ['POST'])]
    public function delete(Request $request, EffetsSecondaire $effetsSecondaire, EffetsSecondaireRepository $effetsSecondaireRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$effetsSecondaire->getId(), $request->request->get('_token'))) {
            $effetsSecondaireRepository->remove($effetsSecondaire, true);
        }

        return $this->redirectToRoute('app_effets_secondaire_index', [], Response::HTTP_SEE_OTHER);
    }
}
