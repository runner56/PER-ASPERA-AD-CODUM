<?php

namespace App\Controller;

use App\Repository\FacultyRepository;
use App\Repository\KafedraRepository;
use App\Repository\TeachGroupRepository;
use App\Repository\UniversityRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class RatingController extends AbstractController
{

    #[Route('/rating/students')]
    public function studentRating(UserRepository $userRepository)
    {
        return $this->json([
            'status' => 'ok',
            'students' => $userRepository->fetchRatingStudents()
        ]);
    }

    #[Route('/rating')]
    public function index(UniversityRepository $repository, FacultyRepository $facultyRepository, KafedraRepository $kafedraRepository, TeachGroupRepository $teachGroupRepository, Request $request): Response
    {
        $university_id = $request->get('university_id', null);
        $cities = $repository->getUniqCities();
        $names = $repository->getNames();
        $faculties = $facultyRepository->findAll();
        $kafedras = $kafedraRepository->findAll();
        $groups = $teachGroupRepository->findAll();
        $streamYears = $teachGroupRepository->getUniqStreamYears();
        return $this->render('shared/rating.html.twig', [
            'cities' => $cities,
            'universities' => $names,
            'faculties' => $faculties,
            'kafedras' => $kafedras,
            'groups' => $groups,
            'streamYears' => $streamYears,
            'university_id' => $university_id
        ]);
    }
}