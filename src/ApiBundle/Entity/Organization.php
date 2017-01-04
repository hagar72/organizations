<?php

namespace ApiBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation as JMS;

/**
 * @package api
 * @author Hagar <hagar.as3ad@gmail.com>
 * Organization
 *
 * @ORM\Table(name="organizations", uniqueConstraints={@ORM\UniqueConstraint(name="uq_organization_name", columns={"name"})})
 * @ORM\Entity
 * @JMS\ExclusionPolicy("all")
 * 
 * @UniqueEntity(fields={"name"}, message="This organization already exist.")
 */
class Organization
{
    /**
     * @var integer
     *
     * @ORM\Column(name="organization_id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     * @JMS\Expose
     */
    protected $organizationId;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=100, nullable=false)
     * @Assert\NotBlank(message="blank organization name")
     * @JMS\Expose
     */
    protected $name;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="account_created_date", type="datetime", nullable=true)
     * @JMS\Expose
     * @JMS\Type("DateTime<'Y-m-d'>")
     */
    protected $accountCreatedDate;

    /**
     * Organization entity constructor
     */
    public function __construct()
    {
        $this->accountCreatedDate = new \DateTime();
    }

    /**
     * Set organizationId
     *
     * @param string $organizationId
     * @return Organization
     */
    public function setOrganizationId($organizationId)
    {
        $this->organizationId = $organizationId;

        return $this;
    }

    /**
     * Get organizationId
     *
     * @return string 
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
