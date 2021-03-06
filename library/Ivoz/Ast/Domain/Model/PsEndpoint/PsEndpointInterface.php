<?php

namespace Ivoz\Ast\Domain\Model\PsEndpoint;

use Ivoz\Core\Domain\Model\LoggableEntityInterface;

interface PsEndpointInterface extends LoggableEntityInterface
{
    const DIRECTMEDIAMETHOD_UPDATE = 'update';
    const DIRECTMEDIAMETHOD_INVITE = 'invite';
    const DIRECTMEDIAMETHOD_REINVITE = 'reinvite';


    const T38UDPTL_YES = 'yes';
    const T38UDPTL_NO = 'no';


    const T38UDPTLEC_NONE = 'none';
    const T38UDPTLEC_FEC = 'fec';
    const T38UDPTLEC_REDUNDANCY = 'redundancy';


    const T38UDPTLNAT_YES = 'yes';
    const T38UDPTLNAT_NO = 'no';


    /**
     * @codeCoverageIgnore
     * @return array
     */
    public function getChangeSet();

    /**
     * Get sorceryId
     *
     * @return string
     */
    public function getSorceryId();

    /**
     * Get fromDomain
     *
     * @return string | null
     */
    public function getFromDomain();

    /**
     * Get aors
     *
     * @return string | null
     */
    public function getAors();

    /**
     * Get callerid
     *
     * @return string | null
     */
    public function getCallerid();

    /**
     * Get context
     *
     * @return string
     */
    public function getContext();

    /**
     * Get disallow
     *
     * @return string
     */
    public function getDisallow();

    /**
     * Get allow
     *
     * @return string
     */
    public function getAllow();

    /**
     * Get directMedia
     *
     * @return string | null
     */
    public function getDirectMedia();

    /**
     * Get directMediaMethod
     *
     * @return string | null
     */
    public function getDirectMediaMethod();

    /**
     * Get mailboxes
     *
     * @return string | null
     */
    public function getMailboxes();

    /**
     * Get namedPickupGroup
     *
     * @return string | null
     */
    public function getNamedPickupGroup();

    /**
     * Get sendDiversion
     *
     * @return string | null
     */
    public function getSendDiversion();

    /**
     * Get sendPai
     *
     * @return string | null
     */
    public function getSendPai();

    /**
     * Get oneHundredRel
     *
     * @return string
     */
    public function getOneHundredRel();

    /**
     * Get outboundProxy
     *
     * @return string | null
     */
    public function getOutboundProxy();

    /**
     * Get trustIdInbound
     *
     * @return string | null
     */
    public function getTrustIdInbound();

    /**
     * Get t38Udptl
     *
     * @return string
     */
    public function getT38Udptl();

    /**
     * Get t38UdptlEc
     *
     * @return string
     */
    public function getT38UdptlEc();

    /**
     * Get t38UdptlMaxdatagram
     *
     * @return integer
     */
    public function getT38UdptlMaxdatagram();

    /**
     * Get t38UdptlNat
     *
     * @return string
     */
    public function getT38UdptlNat();

    /**
     * Set terminal
     *
     * @param \Ivoz\Provider\Domain\Model\Terminal\TerminalInterface $terminal
     *
     * @return static
     */
    public function setTerminal(\Ivoz\Provider\Domain\Model\Terminal\TerminalInterface $terminal = null);

    /**
     * Get terminal
     *
     * @return \Ivoz\Provider\Domain\Model\Terminal\TerminalInterface
     */
    public function getTerminal();

    /**
     * Set friend
     *
     * @param \Ivoz\Provider\Domain\Model\Friend\FriendInterface $friend
     *
     * @return static
     */
    public function setFriend(\Ivoz\Provider\Domain\Model\Friend\FriendInterface $friend = null);

    /**
     * Get friend
     *
     * @return \Ivoz\Provider\Domain\Model\Friend\FriendInterface
     */
    public function getFriend();

    /**
     * Set residentialDevice
     *
     * @param \Ivoz\Provider\Domain\Model\ResidentialDevice\ResidentialDeviceInterface $residentialDevice
     *
     * @return static
     */
    public function setResidentialDevice(\Ivoz\Provider\Domain\Model\ResidentialDevice\ResidentialDeviceInterface $residentialDevice = null);

    /**
     * Get residentialDevice
     *
     * @return \Ivoz\Provider\Domain\Model\ResidentialDevice\ResidentialDeviceInterface
     */
    public function getResidentialDevice();

    /**
     * Set retailAccount
     *
     * @param \Ivoz\Provider\Domain\Model\RetailAccount\RetailAccountInterface $retailAccount
     *
     * @return static
     */
    public function setRetailAccount(\Ivoz\Provider\Domain\Model\RetailAccount\RetailAccountInterface $retailAccount = null);

    /**
     * Get retailAccount
     *
     * @return \Ivoz\Provider\Domain\Model\RetailAccount\RetailAccountInterface
     */
    public function getRetailAccount();
}
