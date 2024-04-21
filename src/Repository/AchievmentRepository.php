<?php

namespace App\Repository;

use App\Entity\Achievment;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Achievment>
 *
 * @method Achievment|null find($id, $lockMode = null, $lockVersion = null)
 * @method Achievment|null findOneBy(array $criteria, array $orderBy = null)
 * @method Achievment[]    findAll()
 * @method Achievment[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AchievmentRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Achievment::class);
    }

    //    /**
    //     * @return Achievment[] Returns an array of Achievment objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('a')
    //            ->andWhere('a.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('a.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Achievment
    //    {
    //        return $this->createQueryBuilder('a')
    //            ->andWhere('a.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
