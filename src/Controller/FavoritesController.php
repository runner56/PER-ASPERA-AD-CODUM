<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;

class FavoritesController extends AbstractController
{
    #[Route('/favorites')]
    public function index(#[CurrentUser] User $user)
    {

        $publishes = $user->getLikes()->map(function ($it) {
            return [
                'id' => $it->getId(),
                'name' => $it->getTitle()
            ];
        });

        $events = $user->getLikedEvents()->map(function ($it) {
            return [
                'id' => $it->getId(),
                'name' => $it->getName()
            ];
        });
        return $this->render("shared/favorite.html.twig", [
            'publishes' => $publishes,
            'events' => $events
        ]);
    }
}