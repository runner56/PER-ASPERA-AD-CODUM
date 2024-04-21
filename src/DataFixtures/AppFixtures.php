<?php

namespace App\DataFixtures;

use App\Entity\EventType;
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
        $it = (new EventType())->setName('профориентация')->setWeight(5);
        $manager->persist($it);
        $it = (new EventType())->setName('волонтёрская деятельность')->setWeight(4);
        $manager->persist($it);
        $it = (new EventType())->setName('Наука')->setWeight(7);
        $manager->persist($it);
        $it = (new EventType())->setName('Фотографии')->setWeight(3);
        $manager->persist($it);
        $it = (new EventType())->setName('Путешествия')->setWeight(4);
        $manager->persist($it);
        $it = (new EventType())->setName('Спорт')->setWeight(3);
        $manager->persist($it);
        $manager->flush();
       ##############################
    }
}
