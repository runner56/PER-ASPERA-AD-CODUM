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

        $teachGroup = $manager->getRepository(TeachGroup::class)->findOneBy(['id' => '15']);
        $user = (new User())
            ->setEmail("prohor30@gmail.com")
            ->setUsername("prohor30")
            ->setFirstname("Прохор Порфирьевич")
            ->setLastname("Смольянинов")
            ->setRoles(['ROLE_STUDENT'])
            ->setStar(0)
            ->setPhoto("student18.jpg")
            ->setTeachGroup($teachGroup);
        $user->setPassword($this->hasher->hashPassword($user1, "password"));
        $manager->persist($user);

        ##############################
    }
}
