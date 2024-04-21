<?php

namespace App\Controller;

use App\Entity\Faculty;
use App\Entity\Kafedra;
use App\Entity\TeachGroup;
use App\Entity\University;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Validator\Constraints\DateTime;

class CrudController extends AbstractController
{
    #[Route('/add/group/{id}')]
    public function addGroup(Kafedra $kafedra, Request $request, EntityManagerInterface $em)
    {
        $group = (new TeachGroup())->setName($request->get('name'))->setStreamYear(2024);
        $kafedra->addTeachGroup($group);
        $em->persist($group);
        $em->flush();
        return $this->json(['status' => 'ok']);
    }

    #[Route('/add/kafedra/{id}')]
    public function addKafedra(Faculty $faculty, Request $request, EntityManagerInterface $em)
    {
        $group = (new Kafedra())->setName($request->get('name'));
        $faculty->addKafedra($group);
        $em->persist($group);
        $em->flush();
        return $this->json(['status' => 'ok']);
    }

    #[Route('/add/faculty/{id}')]
    public function addFaculty(University $university, Request $request, EntityManagerInterface $em)
    {
        $group = (new Faculty())->setName($request->get('name'));
        $university->addFaculty($group);
        $em->persist($group);
        $em->flush();
        return $this->json(['status' => 'ok']);
    }

}