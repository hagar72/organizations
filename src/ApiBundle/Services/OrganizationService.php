<?php

namespace ApiBundle\Services;

use Doctrine\ORM\EntityManager;
use Symfony\Component\Routing\Router;
use Symfony\Component\DependencyInjection\ContainerInterface as Container;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Request;
use ApiBundle\Entity\Organization;
use ApiBundle\Form\OrganizationType;
use FOS\RestBundle\View\View;
use ApiBundle\Constants\Methods;
use Doctrine\ORM\EntityNotFoundException;

/**
 * @package Api
 * @author Hagar <hagar.as3ad@gmail.com>
 * OrganizationService - Business layer responsible for handling organization api business logic
 *
 */
class OrganizationService
{
    protected $entityManager;
    protected $router;
    protected $container;
    protected $httpSession;
    protected $request;
    protected $entityName;

    /**
     * Organization Service constructor
     * 
     * @param EntityManager $EntityManager
     * @param Router $router
     * @param Container $container
     * @param Session $httpSession
     * @param Request $request
     */
    public function __construct(EntityManager $EntityManager, Router $router, Container $container, Session $httpSession, Request $request) {
        $this->entityManager = $EntityManager;
        $this->router = $router;
        $this->container = $container;
        $this->httpSession = $httpSession;
        $this->request = $request;
        $this->entityName = 'ApiBundle:Organization';
    }
    
    /**
     * Get all organizations
     * @author Hagar <hagar.as3ad@gmail.com>
     * 
     * @return array of Organization
     * @throws EntityNotFoundException
     */
    public function getOrganizations() {
        return $this->entityManager->getRepository($this->entityName)->findAll();
    }
    
    /**
     * Get organization by id
     * @author Hagar <hagar.as3ad@gmail.com>
     * 
     * @param int $id
     * 
     * @return Organization
     * @throws EntityNotFoundException
     */
    public function getOrganizationById($id) {
        $organization = $this->entityManager->getRepository($this->entityName)->find($id);
        if(!$organization instanceof Organization) {
            throw new EntityNotFoundException();
        }
        return $organization;
    }
    
    /**
     * Delete use by id
     * @author Hagar <hagar.as3ad@gmail.com>
     * 
     * @param int $id
     * @throws EntityNotFoundException
     */
    public function deleteOrganization($id) {
        $organization = $this->getOrganizationById($id);
        
        $this->entityManager->remove($organization);
        $this->entityManager->flush();
    }

    /**
     * Process organization form data
     * @author Hagar <hagar.as3ad@gmail.com>
     * 
     * @param Organization $organization
     * @param array $parameters
     * @param string $method , default 'POST'
     * 
     * @return View
     */
    public function processForm(Organization $organization, $parameters, $method = Methods::Post)
    {
        $form = $this->container->get('form.factory')->create(new OrganizationType(), $organization, array('method' => $method));
        $form->submit($parameters, true);
    
        if ($form->isValid()) {
            $this->entityManager->persist($organization);
            $this->entityManager->flush();
            $this->entityManager->refresh($organization);
            
            return View::create(array('status' => true, 'organization' => $organization), 201);
        }
        return View::create($form, 400);
    }
}
