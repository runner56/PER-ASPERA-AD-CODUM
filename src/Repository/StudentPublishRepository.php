<?php

namespace App\Repository;

use App\Entity\StudentPublish;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<StudentPublish>
 *
 * @method StudentPublish|null find($id, $lockMode = null, $lockVersion = null)
 * @method StudentPublish|null findOneBy(array $criteria, array $orderBy = null)
 * @method StudentPublish[]    findAll()
 * @method StudentPublish[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StudentPublishRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StudentPublish::class);
    }

    //    /**
    //     * @return StudentPublish[] Returns an array of StudentPublish objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('s')
    //            ->andWhere('s.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('s.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?StudentPublish
    //    {
    //        return $this->createQueryBuilder('s')
    //            ->andWhere('s.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
