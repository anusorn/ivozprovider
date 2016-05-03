<?php

/**
 * Application Model
 *
 * @package IvozProvider\Model
 * @subpackage Model
 * @author Luis Felipe Garcia
 * @copyright ZF model generator
 * @license http://framework.zend.com/license/new-bsd     New BSD License
 */

/**
 * [entity]
 *
 * @package IvozProvider\Model
 * @subpackage Model
 * @author Luis Felipe Garcia
 */

namespace IvozProvider\Model;
class Companies extends Raw\Companies
{
    /**
     * This method is called just after parent's constructor
     */
    public function init()
    {
    }

    /**
     * @param string $exten
     * @return string
     */
    public function getTypeCall($exten)
    {
        $extensions = $this->getExtensions("number='".$exten."'");
        $extension = array_shift($extensions);

        if(empty($extension)) {
            return "shared-external";
        }
        return "shared-".$extension->getRouteType();
    }

    public function getExtension($exten)
    {
        $extensions = $this->getExtensions("number='".$exten."'");
        return array_shift($extensions);
    }

    public function getService($exten)
    {
        $services = array();

        // Add Brand Service Codes
        $brandServices = $this->getBrand()->getBrandServices();
        foreach ($brandServices as $brandService) {
            $services[$brandService->getServiceId()] = $brandService;
        }

        // Override Brand services with company codes
        $companyServices = $this->getCompanyServices();
        foreach ($companyServices as $companyService) {
            $services[$companyService->getServiceId()] = $companyService;
        }

        // Look for the Service Code in the extension
        foreach ($services as $service) {
            if (strpos($exten, $service->getCode()) === 1) {
                return $service;
            }
        }

        // Extension doesn't match any service
        return null;
    }

    public function getTerminal($name)
    {
        $terminals = $this->getTerminals("name='".$name."'");
        return array_shift($terminals);
    }

    public function getCompanyActivePricingPlan($date = null)
    {

        if (is_null($date)) {
            $date = new \Zend_Date();
            $date->setTimezone("UTC");
        }

        $dateTime = $date->toString('yyyy-MM-dd HH:mm:ss');

        $where = "validFrom <= '".$dateTime."' AND validTo >= '".$dateTime."'";
        $this->_logger->log("[Model][Companies] Condition: ".$where, \Zend_Log::DEBUG);
        $order = "metric asc";
        $companyPricingPlans = $this->getPricingPlansRelCompanies($where, $order);
        if (empty($companyPricingPlans)) {
            $this->_logger->log("[Model][Companies] No active Pricing Plan.", \Zend_Log::WARN);
            return null;
        }
        return $companyPricingPlans;
    }

    public function getLanguageCode()
    {
        $language = $this->getLanguage();
        if (!$language) {
            return $this->getBrand()->getLanguageCode();
        }
        return $language->getIden();
    }
    
}
