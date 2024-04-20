<?php

namespace App\Repository;

use App\Entity\PublishType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<PublishType>
 *
 * @method PublishType|null find($id, $lockMode = null, $lockVersion = null)
 * @method PublishType|null findOneBy(array $criteria, array $orderBy = null)
 * @method PublishType[]    findAll()
 * @method PublishType[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PublishTypeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PublishType::class);
    }

    //    /**
    //     * @return PublishType[] Returns an array of PublishType objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('p.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?PublishType
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
