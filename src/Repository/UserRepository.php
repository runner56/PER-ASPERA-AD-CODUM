<?php

namespace App\Repository;

use App\Entity\Faculty;
use App\Entity\Kafedra;
use App\Entity\TeachGroup;
use App\Entity\University;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\PasswordUpgraderInterface;

/**
 * @extends ServiceEntityRepository<User>
 *
 * @method User|null find($id, $lockMode = null, $lockVersion = null)
 * @method User|null findOneBy(array $criteria, array $orderBy = null)
 * @method User[]    findAll()
 * @method User[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserRepository extends ServiceEntityRepository implements PasswordUpgraderInterface
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, User::class);
    }

    public function findTopStudents(int $limit)
    {
        return $this->createQueryBuilder('u')
            ->select('')
            ->where('u.roles like :roles')
            ->setParameter('roles', '%ROLE_STUDENT%')
            ->orderBy('u.star', 'desc')
            ->getQuery()->getResult();
    }

    /**
     * Used to upgrade (rehash) the user's password automatically over time.
     */
    public function upgradePassword(PasswordAuthenticatedUserInterface $user, string $newHashedPassword): void
    {
        if (!$user instanceof User) {
            throw new UnsupportedUserException(sprintf('Instances of "%s" are not supported.', $user::class));
        }

        $user->setPassword($newHashedPassword);
        $this->getEntityManager()->persist($user);
        $this->getEntityManager()->flush();
    }

    //    /**
    //     * @return User[] Returns an array of User objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('u.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?User
    //    {
    //        return $this->createQueryBuilder('u')
    //            ->andWhere('u.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }


    public function searchAll(): array
    {
        return $this->createQueryBuilder('u')
            ->select('CONCAT(u.lastname, \' \', u.firstname) as name', 't.name as group', 'un.name as university', 'u.id as id')
            ->innerJoin(TeachGroup::class, 't', 'with', 'u.teachGroup = t')
            ->innerJoin(Kafedra::class, 'k', 'with', 't.kafedra = k')
            ->innerJoin(Faculty::class, 'f', 'with', 'k.faculty = f')
            ->innerJoin(University::class, 'un', 'with', 'f.university = un')
            ->where('u.roles like :roles')
            ->setParameter('roles', '%ROLE_STUDENT%')
            ->getQuery()
            ->getResult();
    }

    public function fetchTopStudents()
    {
        return $this->createQueryBuilder('u')
            ->select(
                'f.name as faculty',
                't.name as group',
                'un.name as university',
                'u.id as id',
                't.streamYear as period',
                'un.city as city',
                't.streamYear as stream',
                'k.name as department',
                'u.photo',
                'u.star',
                'u.lastname',
                'u.firstname',
            )
            ->innerJoin(TeachGroup::class, 't', 'with', 'u.teachGroup = t')
            ->innerJoin(Kafedra::class, 'k', 'with', 't.kafedra = k')
            ->innerJoin(Faculty::class, 'f', 'with', 'k.faculty = f')
            ->innerJoin(University::class, 'un', 'with', 'f.university = un')
            ->where('u.roles like :roles')
            ->setParameter('roles', '%ROLE_STUDENT%')
            ->orderBy('u.star', 'desc')
            ->getQuery()
            ->setMaxResults(20)
            ->getResult();
    }

    public function fetchStudent($id)
    {
        return $this->createQueryBuilder('u')
            ->select(
                'f.name as faculty',
                't.name as group',
                'un.name as university',
                'u.id as id',
                't.streamYear as period',
                'un.city as city',
                't.streamYear as stream',
                'k.name as department',
                'u.photo',
                'u.star',
                'u.lastname',
                'u.firstname',
            )
            ->innerJoin(TeachGroup::class, 't', 'with', 'u.teachGroup = t')
            ->innerJoin(Kafedra::class, 'k', 'with', 't.kafedra = k')
            ->innerJoin(Faculty::class, 'f', 'with', 'k.faculty = f')
            ->innerJoin(University::class, 'un', 'with', 'f.university = un')
            ->where('u.roles like :roles and u.id = :id')
            ->setParameter('roles', '%ROLE_STUDENT%')
            ->setParameter('id', $id)
            ->orderBy('u.star', 'desc')
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function fetchRatingStudents()
    {
        return $this->createQueryBuilder('u')
            ->select('CONCAT(u.lastname, \' \', u.firstname) as name',
                'f.name as faculty',
                't.name as group',
                'un.name as university',
                'u.id as id',
                't.streamYear as period',
                'un.city as city',
                't.streamYear as stream',
                'k.name as department',
                'u.photo',
                'u.star'
            )
            ->innerJoin(TeachGroup::class, 't', 'with', 'u.teachGroup = t')
            ->innerJoin(Kafedra::class, 'k', 'with', 't.kafedra = k')
            ->innerJoin(Faculty::class, 'f', 'with', 'k.faculty = f')
            ->innerJoin(University::class, 'un', 'with', 'f.university = un')
            ->where('u.roles like :roles')
            ->setParameter('roles', '%ROLE_STUDENT%')
            ->orderBy('u.star', 'desc')
            ->getQuery()
            ->getResult();
    }

    public function fetchTeacher($id)
    {        return $this->createQueryBuilder('u')
        ->select(
            'un.name as university',
            'u.id as id',
            'un.city as city',
            'u.photo',
            'u.star',
            'u.lastname',
            'u.firstname',
        )
        ->innerJoin(University::class, 'un', 'with', 'u.university = un')
        ->where('u.roles not like :roles and u.id = :id')
        ->setParameter('roles', '%ROLE_STUDENT%')
        ->setParameter('id', $id)
        ->getQuery()
        ->getOneOrNullResult();
    }
}
