<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;

class IndexV2Controller extends AbstractController
{

    #[Route('/')]
    public function index(UserRepository $repository)
    {
        $t = $repository->fetchTopStudents();
        return $this->render('shared/index.html.twig', [
            'top_students' =>  $t
        ]);
    }
}