<?php

namespace App\Controller;

use App\Entity\University;
use App\Repository\UniversityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;

class UniversityController extends AbstractController
{
    #[Route('/university/all')]
    public function all(UniversityRepository $repository)
    {
        $universities = array_map(function ($university) {
            return [
                'id' => $university->getId(),
                'name' => $university->getName(),
                'city' => $university->getCity()
            ];
        }, $repository->findAll());

        return $this->json([
            'status' => 'ok',
            'universities' => $universities
        ]);
    }

    #[Route('/university/search')]
    public function search()
    {
        return $this->render('university/search.html.twig');
    }

    #[Route('/university/view/{id}')]
    public function view(University $university)
    {
        return $this->render('university/profile.html.twig', [
            'university' => $university
        ]);
    }
}