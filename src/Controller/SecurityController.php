<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\TeachGroupRepository;
use App\Repository\UniversityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{

    #[Route(path: '/registration', methods: ['GET'])]
    public function register(Request $request, UniversityRepository $repository): Response
    {

        return $this->render('security/login_registration.html.twig', [
            'universities'=> $repository->findAll()
        ]);
    }

    //TODO("Валидация")
    #[Route(path: '/registration', methods: ['POST'])]
    public function newUser(Request $request, UserPasswordHasherInterface $hasher, EntityManagerInterface $em, TeachGroupRepository $teachGroupRepository, UniversityRepository $universityRepository): Response
    {
        $role = $request->get('status') === 'teacher' ? 'ROLE_TEACHER' : 'ROLE_STUDENT';
        $username = $request->get('username');
        $lastname = $request->get('last-name');
        $firstname = $request->get('first-name');
        $university_id = $request->get('university');
        $group_id = $request->get('group');
        $email = $request->get('email');
        $password = $request->get('password');
        $user = (new User())->setRoles([$role])->setUsername($username)->setLastname($lastname)->setFirstname($firstname)->setEmail($email)->setVerify(false)->setStar(0);
        if ($role === 'ROLE_STUDENT'){
            $user->setTeachGroup($teachGroupRepository->findOneBy(['id' => $group_id]));
        }
        if ($role === 'ROLE_TEACHER'){
            $user->setUniversity($universityRepository->findOneBy(['id' => $university_id]));
        }
        $user->setPassword($hasher->hashPassword($user, $password));
        $em->persist($user);
        $em->flush();
        return $this->redirectToRoute('app_login');
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
