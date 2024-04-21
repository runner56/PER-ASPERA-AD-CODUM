<?php

namespace App\Controller;

use App\Entity\Event;
use App\Entity\User;
use App\Repository\EventRepository;
use App\Repository\EventTypeRepository;
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
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\Validator\Constraints\DateTime;

class EventController extends AbstractController
{

    #[\Symfony\Component\Routing\Attribute\Route('/event/all', methods: ['GET'])]
    public function publishAll(EventRepository $repository, UserRepository $userRepository): Response
    {
        $user = $this->getUser();
        $publishes = array_map(function ($publish) use ($userRepository, $user) {
            return [
                'id' => $publish->getId(),
                'like_count' => 0,
                'is_like' => false,
                'title' => $publish->getName(),
                'type' => $publish->getEventType()->getName(),
                'creator' => $userRepository->fetchTeacher($publish->getCreator()->getId()),
                'date' => $publish->getDate()
            ];
        }, $repository->findAll());
        return $this->json([
            'status' => 'ok',
            'publishes' => $publishes
        ]);
    }

    #[Route('/event/like')]
    public function like(Request $request, #[CurrentUser] User $user, EventRepository $repository, EntityManagerInterface $em)
    {
        $id = $request->get('event_id');
        $repository->findOneBy(['id' => $id])->addLikeUser($user);
        $em->flush();
        return $this->json(['status'=> 'ok']);
    }

    #[Route('/event/visit')]
    public function visit(Request $request, #[CurrentUser] User $user, EventRepository $repository, EntityManagerInterface $em)
    {
        $id = $request->get('event_id');
        $repository->findOneBy(['id' => $id])->addVisitor($user);
        $em->flush();
        return $this->json(['status'=> 'ok']);
    }

    #[Route('/events')]
    public function all(EventRepository $eventRepository, PublishTypeRepository $publishTypeRepository, UniversityRepository $repository, FacultyRepository $facultyRepository, KafedraRepository $kafedraRepository, TeachGroupRepository $teachGroupRepository)
    {
        $cities = $repository->getUniqCities();
        $names = $repository->getNames();
        $faculties = $facultyRepository->findAll();
        $kafedras = $kafedraRepository->findAll();
        $groups = $teachGroupRepository->findAll();
        $streamYears = $teachGroupRepository->getUniqStreamYears();
        return $this->render("evt/feed.html.twig", [
            'events' => $repository->findAll(),
            'cities' => $cities,
            'universities' => $names,
            'faculties' => $faculties
        ]);
    }

    #[Route('/event/view/{id}')]
    public function view(Event $event)
    {
        return $this->render("evt/view.html.twig", [
            'event' => $event
        ]);
    }

    #[Route('/event/add', methods: ['GET'])]
    public function add(EventTypeRepository $repository)
    {
        $types = $repository->findAll();
        return $this->render("evt/add.html.twig", [
            'types' => $types
        ]);
    }

    #[Route('/event/add', methods: ['POST'])]
    public function addSave(Request $request, #[CurrentUser] User $user, EventTypeRepository $repository, EntityManagerInterface $em)
    {
        $name = $request->get('name');
        $date = new \DateTime($request->get('date'));
        $type = $request->get('type');
        $text = $request->get('text');
        $tp = $repository->findOneBy(['id' => $type]);
        $event = (new Event())->setName($name)->setDate($date)->setCreator($user)->setHtml($text)
            ->setEventType($tp);
        $user->setStar($user->getStar() + $tp->getWeight());
        $em->persist($event);
        $em->flush();
        $id = $event->getId();
        return $this->redirect("/event/view/{$id}");
    }
}