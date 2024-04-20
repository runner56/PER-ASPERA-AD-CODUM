<?php

namespace App\Controller;

use App\Repository\FacultyRepository;
use App\Repository\KafedraRepository;
use App\Repository\TeachGroupRepository;
use App\Repository\UniversityRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class IndexController extends AbstractController
{
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
        return $this->render('profile.html.twig');
    }

    #[Route('/profile_university')]
    public function universityProfile(): Response
    {
        return $this->render('profile_university.html.twig');
    }

    #[Route('/group/view/{id}')]
    public function groupView(int $id)
    {
        return $this->render('profile.html.twig');
    }

    public function rating(UniversityRepository $repository, FacultyRepository $facultyRepository, KafedraRepository $kafedraRepository, TeachGroupRepository $teachGroupRepository)
    {
        $cities = $repository->getUniqCities();
        $names = $repository->getNames();
        $faculties = $facultyRepository->findAll();
        $kafedras = $kafedraRepository->findAll();
        $groups = $teachGroupRepository->findAll();
        return $this->render('rating.html.twig', [
            'cities' => $cities,
            'names' => $names,
            'faculties' => $faculties,
            'kafedras' => $kafedras,
            'groups' => $groups
        ]);
    }

    #[Route('/student_search')]
    public function studentSearch()
    {
        return $this->render('student_search.html.twig');
    }

    #[Route('/university_search')]
    public function universitySearch()
    {
        return $this->render('university_search.html.twig');
    }
}