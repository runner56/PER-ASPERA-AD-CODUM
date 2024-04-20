<?php

namespace App\Controller;

use App\Repository\TeachGroupRepository;
use App\Repository\UniversityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{

    #[Route(path: '/registration')]
    public function register(Request $request): Response
    {
        return $this->render("");
    }

    #[Route(path: '/regroups')]
    public function getGroups(TeachGroupRepository $repository, Request $request)
    {
        $id = $request->get('university_id');
        $groups = $repository->findByUniversityId($id);
        $groups = array_map(function ($group) {
            return [
                'name' => $group->getName(),
                'id' => $group->getId()
            ];
        }, $groups);
        return $this->json([
            'status' => 'ok',
            'groups' => $groups
        ]);
    }

    #[Route(path: '/universities')]
    public function getUniversity(UniversityRepository $repository)
    {
        $result = array_map(function ($university) {
            return [
                'name' => $university->getName(),
                'id' => $university->getId()
            ];
        }, $repository->findAll());
        return $this->json([
            'status' => 'ok',
            'university' => $result
        ]);
    }

    #[Route(path: '/login', name: 'app_login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();

        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,
        ]);
    }

    #[Route(path: '/logout', name: 'app_logout')]
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }
}
