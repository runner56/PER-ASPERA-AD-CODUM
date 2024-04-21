<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;

class AchievementController extends AbstractController
{
    #[Route('achievement/add', methods: ['GET'])]
    public function add()
    {

    }

    #[Route('achievement/add', methods: ['POST'])]
    public function addSave()
    {

    }
}