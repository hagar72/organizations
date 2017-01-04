<?php

namespace ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use ApiBundle\Entity\Organization;
use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\View\View;
use Doctrine\ORM\EntityNotFoundException;
use ApiBundle\Constants\Methods;

/**
 * @package api
 * @author Hagar <hagar.as3ad@gmail.com>
 * Organization controller - manage api services
 * 
 */
class OrganizationController extends Controller
{
    /**
     * List organizations
     * @author Hagar <hagar.as3ad@gmail.com>
     * 
     * @return array
     * 
     * @Rest\Get("/organizations")
     * @Rest\View
     */
    public function indexOrganizationsAction()
    {
        $organizations = $this->get('api.OrganizationService')->getOrganizations();

        return array(
            'organizations' => $organizations,
        );
    }
    
    /**
     * Create new organization
     * @author Hagar <hagar.as3ad@gmail.com>
     *
     * @param array $request (submitted as json format) with the below parameters:
     * {
     *      "organization_id": "10001",
     *      "name": "Sleighdogs",
     *      "account_created_date": "2016­02­24"
     * }
     * 
     * @Rest\View
     * @return response
     */
    public function postOrganizationsAction(Request $request)
    {
        $parameters = $request->request->all();
        return $this->get('api.OrganizationService')->processForm(new Organization(), $parameters);
    }

    /**
     * Get organization by id
     * @author Hagar <hagar.as3ad@gmail.com>
     * 
     * @Rest\View
     */
    public function getOrganizationsAction($id)
    {
        try {
            $organization = $this->get('api.OrganizationService')->getOrganizationById($id);
        } catch (EntityNotFoundException $e) {
            return array('status' => false, 'message' => 'Organization not found');
        }

        return array('status' => true, 'organization' => $organization);
    }
    
    /**
     * Update organization entity
     * @author Hagar <hagar.as3ad@gmail.com>
     * 
     * @param array $request (submitted as json format) with the below parameters:
     * {
     *      "organization_id": "10001",
     *      "name": "Sleighdogs",
     *      "account_created_date": "2016­02­24"
     * }
     * @param int $id
     * 
     * @Rest\View
     */
    public function putOrganizationsAction(Request $request, $id)
    {
        try {
            $organization = $this->get('api.OrganizationService')->getOrganizationById($id);
        } catch (EntityNotFoundException $e) {
            return array('status' => false, 'message' => 'Organization not found');
        }
        
        $parameters = $request->request->all();
        return $this->get('api.OrganizationService')->processForm($organization, $parameters, Methods::Put);
    }

    /**
     * Deletes a Organization entity.
     * @author Hagar <hagar.as3ad@gmail.com>
     *
     * @param int $id
     * @Rest\View
     */
    public function deleteOrganizationsAction($id)
    {
        try {
            $this->get('api.OrganizationService')->deleteOrganization($id);
        } catch (EntityNotFoundException $e) {
            return array('status' => false, 'message' => 'Organization not found');
        }

        return array('status' => true, 'message' => 'organization has been deleted successfully');
    }
}
