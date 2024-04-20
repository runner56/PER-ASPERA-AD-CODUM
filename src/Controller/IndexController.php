<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;

class IndexController extends AbstractController
{
    #[Route('/', name: 'main')]
    public function index(UserRepository $repository)
    {

        return $this->render('index.html.twig', [
        ]);
    }

    #[Route('/publications/add')]
    public function addPublications()
    {
        return $this->render('add_publication.html.twig');
    }

    #[Route('/profile')]
    public function userProfile()
    {
        return $this->render('user_profile.html.twig');
    }

    #[Route('/group/view/{id}')]
    public function groupView(int $id)
    {
        return $this->render('user_profile.html.twig');
    }
}