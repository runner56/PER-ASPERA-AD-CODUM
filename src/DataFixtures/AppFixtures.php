<?php

namespace App\DataFixtures;

use App\Entity\TeachGroup;
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
            ->setStar(0)
            ->setVerify(true);
        $user1->setPassword($this->hasher->hashPassword($user1, "admin"));
        $manager->persist($user1);
        $manager->flush();
        ##############################

    }
}
