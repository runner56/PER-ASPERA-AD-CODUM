<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\PublishTypeRepository;
use App\Repository\StudentPublishRepository;
use App\Repository\TeachGroupRepository;
use App\Repository\UniversityRepository;
use App\Repository\UserRepository;
use App\Service\FileUploader;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\KernelInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;

class UserController extends AbstractController
{

    #[Route('/student/view/{id}')]
    public function studentView(User $user, StudentPublishRepository $repository,)
    {
        $p = $repository->findBy(['student' => $user]);
        return $this->render("student/profile.html.twig", [
            'user' => $user,
            'publishes' => $p,

        ]);
    }

    #[Route('/student_profile', name: 'student_profile')]
    public function studentProfile(#[CurrentUser] User $user, StudentPublishRepository $repository,)
    {
        $p = $repository->findBy(['student' => $user]);
        return $this->render("student/profile.html.twig", [
            'user' => $user,
            'publishes' => $p,
        ]);
    }

    #[Route('/upload_student_photo')]
    public function upload_user_photo(Request $request, #[CurrentUser] User $user, EntityManagerInterface $em, FileUploader $uploader)
    {
        $file = $request->files->get('fileToUpload');
        if ($file) {
            $filename = $uploader->upload($file);
            $user->setPhoto($filename);
            $em->flush();
        }
        return $this->redirectToRoute('student_profile');
    }

    #[Route('student/search/all')]
    public function studentsAll(UserRepository $repository)
    {
        $students = array_map(function ($user) {
            return [
                'id' => $user['id'],
                'name' => $user['name'],
                'university' => $user['university'],
                'group' => $user['group']
            ];
        }, $repository->searchAll());
        return $this->json([
            'students' => $students
        ]);
    }

    #[Route('student/search')]
    public function studentSearch(UniversityRepository $universityRepository, TeachGroupRepository $teachGroupRepository)
    {

        return $this->render("student/search.html.twig", [
            'universities' => $universityRepository->getNames(),
            'groups' => $teachGroupRepository->findAll()
        ]);
    }
}