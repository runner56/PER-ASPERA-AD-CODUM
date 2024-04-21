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
        $r = $manager->getRepository(University::class)->findOneBy(['id' => '1']);
        ##############################
        $item = (new User())->setRoles(['ROLE_TEACHER'])->setVerify(false)->setPhoto('teacher1.jpg')->setLastname('Иванов')->setFirstname('Иван Иваныч')->setUsername('test')->setUniversity($r)->setEmail('test@example.com');
        $item->setPassword($this->hasher->hashPassword($item, 'password'));
        $manager->persist($item);
        $manager->flush();
        ##############################
    }
}
