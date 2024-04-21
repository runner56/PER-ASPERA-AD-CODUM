<?php

namespace App\DataFixtures;

use App\Entity\PublishType;
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
        $it = (new PublishType())->setName('профориентация');
        $manager->persist($it);
        $it = (new PublishType())->setName('волонтёрская деятельность');
        $manager->persist($it);
        $manager->flush();
       ##############################
    }
}
