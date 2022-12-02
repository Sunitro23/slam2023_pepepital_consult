<?php

namespace App\Repository;

use App\Entity\EffetsSecondaire;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<EffetsSecondaire>
 *
 * @method EffetsSecondaire|null find($id, $lockMode = null, $lockVersion = null)
 * @method EffetsSecondaire|null findOneBy(array $criteria, array $orderBy = null)
 * @method EffetsSecondaire[]    findAll()
 * @method EffetsSecondaire[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EffetsSecondaireRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, EffetsSecondaire::class);
    }

    public function save(EffetsSecondaire $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(EffetsSecondaire $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

//    /**
//     * @return EffetsSecondaire[] Returns an array of EffetsSecondaire objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('e')
//            ->andWhere('e.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('e.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?EffetsSecondaire
//    {
//        return $this->createQueryBuilder('e')
//            ->andWhere('e.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
