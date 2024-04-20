<?php

namespace App\Repository;

use App\Entity\Faculty;
use App\Entity\Kafedra;
use App\Entity\TeachGroup;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<TeachGroup>
 *
 * @method TeachGroup|null find($id, $lockMode = null, $lockVersion = null)
 * @method TeachGroup|null findOneBy(array $criteria, array $orderBy = null)
 * @method TeachGroup[]    findAll()
 * @method TeachGroup[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TeachGroupRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TeachGroup::class);
    }

    /**
     * @return TeachGroup[] Returns an array of TeachGroup objects
     */
    public function findByUniversityId($universityId): array
    {
        return $this->createQueryBuilder('t')
            ->innerJoin(Kafedra::class, 'k', 'with', 't.kafedra = k')
            ->innerJoin(Faculty::class, 'f', 'with', 'k.faculty = f')
            ->innerJoin(Faculty::class, 'ff', 'with', 'f.university = ff')
            ->where('ff.id = :id')
            ->setParameter('id', $universityId)
            ->getQuery()
            ->getResult();
    }

    //    /**
    //     * @return TeachGroup[] Returns an array of TeachGroup objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('t')
    //            ->andWhere('t.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('t.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?TeachGroup
    //    {
    //        return $this->createQueryBuilder('t')
    //            ->andWhere('t.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
