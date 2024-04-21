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

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '5']);
        $user = (new User())
            ->setEmail("ivan1986@yandex.ru")
            ->setUsername("ivan1986")
            ->setFirstname("Иван Леонтьевич")
            ->setLastname("Мамыкин")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher15.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '5']);
        $user = (new User())
            ->setEmail("efim9731@yandex.ru")
            ->setUsername("efim9731")
            ->setFirstname("Ефим Егорович")
            ->setLastname("Шиловский")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher10.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '2']);
        $user = (new User())
            ->setEmail("oksana86@ya.ru")
            ->setUsername("oksana86")
            ->setFirstname("Оксана Саввановна")
            ->setLastname("Великая")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher3.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '5']);
        $user = (new User())
            ->setEmail("yaroslava70@gmail.com")
            ->setUsername("yaroslava70")
            ->setFirstname("Ярослава Макаровна")
            ->setLastname("Суркова")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher17.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '1']);
        $user = (new User())
            ->setEmail("dmitriy7010@ya.ru")
            ->setUsername("dmitriy7010")
            ->setFirstname("Дмитрий Вениаминович")
            ->setLastname("Маюров")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher5.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '3']);
        $user = (new User())
            ->setEmail("lana1962@yandex.ru")
            ->setUsername("lana1962")
            ->setFirstname("Лана Александровна")
            ->setLastname("Берестова")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher15.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '3']);
        $user = (new User())
            ->setEmail("artem1963@gmail.com")
            ->setUsername("artem1963")
            ->setFirstname("Артем Прокопьевич")
            ->setLastname("Гаврилов")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher11.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '5']);
        $user = (new User())
            ->setEmail("nikifor1976@hotmail.com")
            ->setUsername("nikifor1976")
            ->setFirstname("Никифор Фадеевич")
            ->setLastname("Аксенчук")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher11.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '2']);
        $user = (new User())
            ->setEmail("ignatiy28111977@rambler.ru")
            ->setUsername("ignatiy28111977")
            ->setFirstname("Игнатий Серафимович")
            ->setLastname("Ягодич")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher3.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '1']);
        $user = (new User())
            ->setEmail("artem.novichkov@rambler.ru")
            ->setUsername("artem.novichkov")
            ->setFirstname("Артем Севастьянович")
            ->setLastname("Новичков")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher16.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '2']);
        $user = (new User())
            ->setEmail("gerasim1968@outlook.com")
            ->setUsername("gerasim1968")
            ->setFirstname("Герасим Юрьевич")
            ->setLastname("Капшуков")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher10.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '1']);
        $user = (new User())
            ->setEmail("aleksey1960@outlook.com")
            ->setUsername("aleksey1960")
            ->setFirstname("Алексей Георгиевич")
            ->setLastname("Демидов")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher11.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '3']);
        $user = (new User())
            ->setEmail("viktor8250@gmail.com")
            ->setUsername("viktor8250")
            ->setFirstname("Виктор Ипполитович")
            ->setLastname("Ильинский")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher10.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '2']);
        $user = (new User())
            ->setEmail("ulyana.nedelskaya@gmail.com")
            ->setUsername("ulyana.nedelskaya")
            ->setFirstname("Ульяна Юрьевна")
            ->setLastname("Недельская")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher9.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '1']);
        $user = (new User())
            ->setEmail("elizaveta02041974@mail.ru")
            ->setUsername("elizaveta02041974")
            ->setFirstname("Елизавета Ефремовна")
            ->setLastname("Макушева")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher2.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '5']);
        $user = (new User())
            ->setEmail("arseniy23@mail.ru")
            ->setUsername("arseniy23")
            ->setFirstname("Арсений Тарасович")
            ->setLastname("Эскин")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher6.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '3']);
        $user = (new User())
            ->setEmail("taisiya18041994@hotmail.com")
            ->setUsername("taisiya18041994")
            ->setFirstname("Таисия Севастьяновна")
            ->setLastname("Натарова")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher13.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '1']);
        $user = (new User())
            ->setEmail("varvara1975@rambler.ru")
            ->setUsername("varvara1975")
            ->setFirstname("Варвара Севастьяновна")
            ->setLastname("Ремизова")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher3.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '4']);
        $user = (new User())
            ->setEmail("lana.ratnikova@ya.ru")
            ->setUsername("lana.ratnikova")
            ->setFirstname("Лана Яковна")
            ->setLastname("Ратникова")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher11.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '3']);
        $user = (new User())
            ->setEmail("daniil26@ya.ru")
            ->setUsername("daniil26")
            ->setFirstname("Даниил Прохорович")
            ->setLastname("Бирюков")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher9.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '5']);
        $user = (new User())
            ->setEmail("valentin6379@outlook.com")
            ->setUsername("valentin6379")
            ->setFirstname("Валентин Леонтьевич")
            ->setLastname("Стрельников")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher17.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '2']);
        $user = (new User())
            ->setEmail("rada44@mail.ru")
            ->setUsername("rada44")
            ->setFirstname("Рада Антоновна")
            ->setLastname("Зылькова")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher6.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();

        $university = $manager->getRepository(University::class)->findOneBy(['id' => '5']);
        $user = (new User())
            ->setEmail("oksana48@outlook.com")
            ->setUsername("oksana48")
            ->setFirstname("Оксана Феликсовна")
            ->setLastname("Кириленко")
            ->setRoles(['ROLE_TEACHER'])
            ->setVerify(true)
            ->setUniversity($university)
            ->setPhoto("teacher18.jpg");
        $user->setPassword($this->hasher->hashPassword($user, "password"));

        $manager->persist($user);
        $manager->flush();


        $manager->flush();


        ##############################
    }
}
