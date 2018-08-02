<?php

namespace Ivoz\Cgr\Domain\Service\TpDestination;

use Ivoz\Cgr\Domain\Model\TpDestination\TpDestination;
use Ivoz\Cgr\Domain\Model\TpDestination\TpDestinationInterface;
use Ivoz\Cgr\Domain\Model\TpDestination\TpDestinationDto;
use Ivoz\Core\Application\Service\EntityTools;
use Ivoz\Core\Domain\Service\EntityPersisterInterface;
use Ivoz\Provider\Domain\Model\Destination\DestinationInterface;
use Ivoz\Provider\Domain\Service\Destination\DestinationLifecycleEventHandlerInterface;

class CreatedByDestination implements DestinationLifecycleEventHandlerInterface
{
    CONST POST_PERSIST_PRIORITY = self::PRIORITY_NORMAL;

    /**
     * @var EntityTools
     */
    protected $entityTools;

    /**
     * CreatedByTpDestinationRate constructor.
     * @param EntityTools $entityTools
     */
    public function __construct(
        EntityTools $entityTools
    ) {
        $this->entityTools = $entityTools;
    }

    public static function getSubscribedEvents()
    {
        return [
            self::EVENT_POST_PERSIST => self::POST_PERSIST_PRIORITY
        ];
    }

    /**
     * Create a new TpDestination when a Destination is created
     *
     * @param DestinationInterface $destination
     * @param $isNew
     */
    public function execute(DestinationInterface $destination, $isNew)
    {
        if (!$isNew) {
            return;
        }

        $tpDestination = $destination->getTpDestination();

        /** @var TpDestinationDto $tpDestinationDto */
        $tpDestinationDto = is_null($tpDestination)
            ? TpDestination::createDto()
            : $this->entityTools->entityToDto($tpDestination);

        $tpDestinationDto
            ->setPrefix($destination->getPrefix())
            ->setDestinationId($destination->getId())
            ->setTag($destination->getCgrTag());

        $tpDestination = $this->entityTools->persistDto(
            $tpDestinationDto,
            $tpDestination,
            true
        );

        $destination->setTpDestination($tpDestination);
    }

}
