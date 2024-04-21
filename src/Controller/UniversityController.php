<?php

namespace App\Controller;

use App\Entity\University;
use App\Entity\User;
use App\Repository\UniversityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use function Symfony\Component\String\u;

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

    #[Route('/university/view/{id}', methods: ['POST'])]
    public function editUniversity(University $university, Request $request, EntityManagerInterface $em)
    {
        $university->setName($request->get('name'));
        $university->setCity($request->get('city'));
        $university->setAddress($request->get('address'));
        $em->flush();
        $id = $university->getId();
        return $this->redirect("/university/view/{$id}");
    }

    #[Route('/university/add', methods: ['GET'])]
    public function add()
    {
        return $this->render('university/create.profile.html.twig', []);
    }

    #[Route('/university/view/{id}', methods: ['GET'])]
    public function view(University $university)
    {
        $info = $university->getFaculties()->map(function ($faculty) {
            return [
                'id' => $faculty->getId(),
                'name' => $faculty->getName(),
                'kafedras' => $faculty->getKafedras()->map(function ($kafedra) {
                    return [
                        'id' => $kafedra->getId(),
                        'name' => $kafedra->getName(),
                        'teachGroups' => $kafedra->getTeachGroups()->map(function ($tg) {
                            return [
                                'id' => $tg->getId(),
                                'name' => $tg->getName(),
                                'stream_year' => $tg->getStreamYear()
                            ];
                        })
                    ];
                })
            ];
        });
        /** @var User $user */
        $user = $this->getUser();
        $has_edit = false;
        if ($user) {
            if (in_array('ROLE_ADMIN', $user->getRoles())) {
                $has_edit = true;
            }
            if (in_array('ROLE_TEACHER', $user->getRoles()) && $university->getUsers()->contains($user)) {
                $has_edit = true;
            }
        }
        return $this->render('university/profile.html.twig', [
            'university' => $university,
            'info' => $info,
            'has_edit' => $has_edit
        ]);
    }
}