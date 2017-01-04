<?php

namespace ApiBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Organization
 *
 * @ORM\Table(name="organizations")
 * @ORM\Entity
 */
class Organization
{
    /**
     * @var integer
     *
     * @ORM\Column(name="organization_id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $organizationId;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=100, nullable=false)
     */
    private $name;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="account_created_date", type="datetime", nullable=false)
     */
    private $accountCreatedDate;



    /**
     * Get organizationId
     *
     * @return integer 
     */
    public function getOrganizationId()
    {
        return $this->organizationId;
    }

    /**
     * Set name
     *
     * @param string $name
     * @return Organization
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set accountCreatedDate
     *
     * @param \DateTime $accountCreatedDate
     * @return Organization
     */
    public function setAccountCreatedDate($accountCreatedDate)
    {
        $this->accountCreatedDate = $accountCreatedDate;

        return $this;
    }

    /**
     * Get accountCreatedDate
     *
     * @return \DateTime 
     */
    public function getAccountCreatedDate()
    {
        return $this->accountCreatedDate;
    }
}
