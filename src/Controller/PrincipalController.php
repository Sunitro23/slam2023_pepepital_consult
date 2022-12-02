<?php

namespace App\Controller;

use App\Entity\Patient;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PrincipalController extends AbstractController
{
    #[Route('/', name: 'app_principal')]
    public function index(): Response
    {
        return $this->render('principal/index.html.twig', [
            'controller_name' => 'PrincipalController',
        ]);
    }

    #[Route('/patient/{id}', name: 'patient')]
    public function getUnPatient(ManagerRegistry $doctrine, $id): Response
    {
        $unPatient = $doctrine->getRepository(Patient::class)->find($id);
        return $this->render('principal/patient.html.twig', [
            'unPatient' => $unPatient,
        ]);
    }
}
