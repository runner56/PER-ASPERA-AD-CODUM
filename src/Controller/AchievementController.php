<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;

class AchievementController extends AbstractController
{
    #[Route('achievement/add', methods: ['GET'])]
    public function add()
    {
        return $this->render("achievment/add.html.twig");
    }

    #[Route('achievement/add', methods: ['POST'])]
    public function addSave()
    {

    }
}