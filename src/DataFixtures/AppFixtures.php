<?php

namespace App\DataFixtures;

use App\Entity\TeachGroup;
use App\Entity\University;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    public function __construct(private UserPasswordHasherInterface $hasher)
    {
    }

    public function load(ObjectManager $manager): void
    {
        ##############################
        $user1 = (new User())
            ->setEmail("rescqd@gmail.com")
            ->setUsername("rescqd")
            ->setFirstname("Никита")
            ->setLastname("Боченин")
            ->setRoles(['ROLE_ADMIN'])
            ->setStar(0);
        $user1->setPassword($this->hasher->hashPassword($user1, "admin"));

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '19']);
        $user = (new User())
            ->setEmail("aleksey8309@mail.ru")
            ->setUsername("aleksey8309")
            ->setFirstname("Алексей Валентинович")
            ->setLastname("Филипов")
            ->setRoles(['ROLE_TEACHER'])
            ->setPhoto("teacherN.jpg")
            ->setVerify(true)
            ->setUniversity($university);

        $user->setPassword($this->hasher->hashPassword($user1, "password"));
        $manager->persist($user);
        $manager->flush();


        ##############################
    }
}
