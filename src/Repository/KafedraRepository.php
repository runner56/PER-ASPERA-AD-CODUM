<?php

namespace App\Repository;

use App\Entity\Kafedra;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Kafedra>
 *
 * @method Kafedra|null find($id, $lockMode = null, $lockVersion = null)
 * @method Kafedra|null findOneBy(array $criteria, array $orderBy = null)
 * @method Kafedra[]    findAll()
 * @method Kafedra[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class KafedraRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Kafedra::class);
    }

    //    /**
    //     * @return Kafedra[] Returns an array of Kafedra objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('k')
    //            ->andWhere('k.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('k.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Kafedra
    //    {
    //        return $this->createQueryBuilder('k')
    //            ->andWhere('k.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
