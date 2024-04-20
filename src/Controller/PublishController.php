<?php

namespace App\Controller;

use App\Entity\StudentPublish;
use App\Entity\User;
use App\Repository\FacultyRepository;
use App\Repository\KafedraRepository;
use App\Repository\PublishTypeRepository;
use App\Repository\StudentPublishRepository;
use App\Repository\TeachGroupRepository;
use App\Repository\UniversityRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;

class PublishController extends AbstractController
{
    #[Route('/publish/view/{id}', methods: ['GET'])]
    public function view(StudentPublish $publish)
    {
        return $this->render('publish/view.html.twig', [
            'publish' => $publish
        ]);
    }

    #[Route('/student/publish/add', methods: ['GET'])]
    public function studentAdd(PublishTypeRepository $publishTypeRepository)
    {

        return $this->render('publish/student.add.html.twig', [
            'types' => $publishTypeRepository->findAll()
        ]);
    }

    #[Route('/feed', methods: ['GET'])]
    public function feed(PublishTypeRepository $publishTypeRepository, UniversityRepository $repository, FacultyRepository $facultyRepository, KafedraRepository $kafedraRepository, TeachGroupRepository $teachGroupRepository)
    {
        $cities = $repository->getUniqCities();
        $names = $repository->getNames();
        $faculties = $facultyRepository->findAll();
        $kafedras = $kafedraRepository->findAll();
        $groups = $teachGroupRepository->findAll();
        $streamYears = $teachGroupRepository->getUniqStreamYears();
        return $this->render('publish/feed.html.twig', [
            'cities' => $cities,
            'universities' => $names,
            'faculties' => $faculties
        ]);
    }

    #[Route('/publish/all', methods: ['GET'])]
    public function publishAll(StudentPublishRepository $repository, UserRepository $userRepository): Response
    {
        $user = $this->getUser();
        $publishes = array_map(function ($publish) use ($userRepository, $user) {
            return [
                'id' => $publish->getId(),
                'like_count' => $publish->getLikedUsers()->count(),
                'is_like' => $publish->getLikedUsers()->contains($user),
                'title' => $publish->getTitle(),
                'type' => $publish->getType()->getName(),
                'creator' => $userRepository->fetchStudent($user->getId())
            ];
        }, $repository->findAll());

        return $this->json([
            'status' => 'ok',
            'publishes' => $publishes
        ]);
    }

    #[Route('/student/publish/add', methods: ['POST'])]
    public function studentAddPost(Request $request, #[CurrentUser] User $user, PublishTypeRepository $publishTypeRepository, EntityManagerInterface $em)
    {
        $type = $publishTypeRepository->findOneBy(['id' => $request->get('type')]);
        $publish = (new StudentPublish())->setStudent($user)->setHtml($request->get('text'))->setType($type)->setTitle($request->get('title'));
        $em->persist($publish);
        $em->flush();
        return $this->redirectToRoute('student_profile');
    }
}