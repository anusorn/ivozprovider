<?php

namespace Ivoz\Provider\Infrastructure\Persistence\Doctrine;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Ivoz\Provider\Domain\Model\Carrier\CarrierInterface;
use Ivoz\Provider\Domain\Model\Carrier\CarrierRepository;
use Ivoz\Provider\Domain\Model\Carrier\Carrier;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * CarrierDoctrineRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CarrierDoctrineRepository extends ServiceEntityRepository implements CarrierRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Carrier::class);
    }

    /**
     * @return array
     */
    public function getCarrierIdsGroupByBrand()
    {
        /** @var CarrierInterface[] $carriers */
        $carriers = $this->findAll();
        $response = [];

        foreach ($carriers as $carrier) {
            $brandId = $carrier->getBrand()->getId();
            if (!array_key_exists($brandId, $response)) {
                $response[$brandId] = [];
            }
            $response[$brandId][] = $carrier->getId();
        }

        return $response;
    }
}
