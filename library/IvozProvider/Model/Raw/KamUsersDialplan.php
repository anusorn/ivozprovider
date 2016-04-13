<?php

/**
 * Application Model
 *
 * @package IvozProvider\Model\Raw
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

namespace IvozProvider\Model\Raw;
class KamUsersDialplan extends ModelAbstract
{


    /**
     * Database var type int
     *
     * @var int
     */
    protected $_id;

    /**
     * Database var type int
     *
     * @var int
     */
    protected $_dpid;

    /**
     * Database var type int
     *
     * @var int
     */
    protected $_pr;

    /**
     * Database var type int
     *
     * @var int
     */
    protected $_matchOp;

    /**
     * Database var type varchar
     *
     * @var string
     */
    protected $_matchExp;

    /**
     * Database var type int
     *
     * @var int
     */
    protected $_matchLen;

    /**
     * Database var type varchar
     *
     * @var string
     */
    protected $_substExp;

    /**
     * Database var type varchar
     *
     * @var string
     */
    protected $_replExp;

    /**
     * Database var type varchar
     *
     * @var string
     */
    protected $_attrs;

    /**
     * Database var type binary(36)
     *
     * @var binary
     */
    protected $_transformationRulesetGroupsUsersId;


    /**
     * Parent relation kam_users_dialplan_ibfk_2
     *
     * @var \IvozProvider\Model\Raw\TransformationRulesetGroupsUsers
     */
    protected $_TransformationRulesetGroupsUsers;


    protected $_columnsList = array(
        'id'=>'id',
        'dpid'=>'dpid',
        'pr'=>'pr',
        'match_op'=>'matchOp',
        'match_exp'=>'matchExp',
        'match_len'=>'matchLen',
        'subst_exp'=>'substExp',
        'repl_exp'=>'replExp',
        'attrs'=>'attrs',
        'transformationRulesetGroupsUsersId'=>'transformationRulesetGroupsUsersId',
    );

    /**
     * Sets up column and relationship lists
     */
    public function __construct()
    {
        $this->setColumnsMeta(array(
        ));

        $this->setMultiLangColumnsList(array(
        ));

        $this->setAvailableLangs(array('es', 'en'));

        $this->setParentList(array(
            'KamUsersDialplanIbfk2'=> array(
                    'property' => 'TransformationRulesetGroupsUsers',
                    'table_name' => 'TransformationRulesetGroupsUsers',
                ),
        ));

        $this->setDependentList(array(
        ));




        $this->_defaultValues = array(
        );

        $this->_initFileObjects();
        parent::__construct();
    }

    /**
     * This method is called just after parent's constructor
     */
    public function init()
    {
    }
    /**************************************************************************
    ************************** File System Object (FSO)************************
    ***************************************************************************/

    protected function _initFileObjects()
    {

        return $this;
    }

    public function getFileObjects()
    {

        return array();
    }


    /**************************************************************************
    *********************************** /FSO ***********************************
    ***************************************************************************/

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param int $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setId($data)
    {

        if ($this->_id != $data) {
            $this->_logChange('id');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_id = $data;

        } else if (!is_null($data)) {
            $this->_id = (int) $data;

        } else {
            $this->_id = $data;
        }
        return $this;
    }

    /**
     * Gets column id
     *
     * @return int
     */
    public function getId()
    {
        return $this->_id;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param int $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setDpid($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_dpid != $data) {
            $this->_logChange('dpid');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_dpid = $data;

        } else if (!is_null($data)) {
            $this->_dpid = (int) $data;

        } else {
            $this->_dpid = $data;
        }
        return $this;
    }

    /**
     * Gets column dpid
     *
     * @return int
     */
    public function getDpid()
    {
        return $this->_dpid;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param int $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setPr($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_pr != $data) {
            $this->_logChange('pr');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_pr = $data;

        } else if (!is_null($data)) {
            $this->_pr = (int) $data;

        } else {
            $this->_pr = $data;
        }
        return $this;
    }

    /**
     * Gets column pr
     *
     * @return int
     */
    public function getPr()
    {
        return $this->_pr;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param int $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setMatchOp($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_matchOp != $data) {
            $this->_logChange('matchOp');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_matchOp = $data;

        } else if (!is_null($data)) {
            $this->_matchOp = (int) $data;

        } else {
            $this->_matchOp = $data;
        }
        return $this;
    }

    /**
     * Gets column match_op
     *
     * @return int
     */
    public function getMatchOp()
    {
        return $this->_matchOp;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param string $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setMatchExp($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_matchExp != $data) {
            $this->_logChange('matchExp');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_matchExp = $data;

        } else if (!is_null($data)) {
            $this->_matchExp = (string) $data;

        } else {
            $this->_matchExp = $data;
        }
        return $this;
    }

    /**
     * Gets column match_exp
     *
     * @return string
     */
    public function getMatchExp()
    {
        return $this->_matchExp;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param int $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setMatchLen($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_matchLen != $data) {
            $this->_logChange('matchLen');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_matchLen = $data;

        } else if (!is_null($data)) {
            $this->_matchLen = (int) $data;

        } else {
            $this->_matchLen = $data;
        }
        return $this;
    }

    /**
     * Gets column match_len
     *
     * @return int
     */
    public function getMatchLen()
    {
        return $this->_matchLen;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param string $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setSubstExp($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_substExp != $data) {
            $this->_logChange('substExp');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_substExp = $data;

        } else if (!is_null($data)) {
            $this->_substExp = (string) $data;

        } else {
            $this->_substExp = $data;
        }
        return $this;
    }

    /**
     * Gets column subst_exp
     *
     * @return string
     */
    public function getSubstExp()
    {
        return $this->_substExp;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param string $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setReplExp($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_replExp != $data) {
            $this->_logChange('replExp');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_replExp = $data;

        } else if (!is_null($data)) {
            $this->_replExp = (string) $data;

        } else {
            $this->_replExp = $data;
        }
        return $this;
    }

    /**
     * Gets column repl_exp
     *
     * @return string
     */
    public function getReplExp()
    {
        return $this->_replExp;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param string $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setAttrs($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_attrs != $data) {
            $this->_logChange('attrs');
        }

        if ($data instanceof \Zend_Db_Expr) {
            $this->_attrs = $data;

        } else if (!is_null($data)) {
            $this->_attrs = (string) $data;

        } else {
            $this->_attrs = $data;
        }
        return $this;
    }

    /**
     * Gets column attrs
     *
     * @return string
     */
    public function getAttrs()
    {
        return $this->_attrs;
    }

    /**
     * Sets column Stored in ISO 8601 format.     *
     * @param binary $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setTransformationRulesetGroupsUsersId($data)
    {

        if (is_null($data)) {
            throw new \InvalidArgumentException(_('Required values cannot be null'));
        }
        if ($this->_transformationRulesetGroupsUsersId != $data) {
            $this->_logChange('transformationRulesetGroupsUsersId');
        }

        $this->_transformationRulesetGroupsUsersId = $data;
        return $this;
    }

    /**
     * Gets column transformationRulesetGroupsUsersId
     *
     * @return binary
     */
    public function getTransformationRulesetGroupsUsersId()
    {
        return $this->_transformationRulesetGroupsUsersId;
    }

    /**
     * Sets parent relation TransformationRulesetGroupsUsers
     *
     * @param \IvozProvider\Model\Raw\TransformationRulesetGroupsUsers $data
     * @return \IvozProvider\Model\Raw\KamUsersDialplan
     */
    public function setTransformationRulesetGroupsUsers(\IvozProvider\Model\Raw\TransformationRulesetGroupsUsers $data)
    {
        $this->_TransformationRulesetGroupsUsers = $data;

        $primaryKey = $data->getPrimaryKey();
        if (is_array($primaryKey)) {
            $primaryKey = $primaryKey['id'];
        }

        if (!is_null($primaryKey)) {
            $this->setTransformationRulesetGroupsUsersId($primaryKey);
        }

        $this->_setLoaded('KamUsersDialplanIbfk2');
        return $this;
    }

    /**
     * Gets parent TransformationRulesetGroupsUsers
     * TODO: Mejorar esto para los casos en que la relación no exista. Ahora mismo siempre se pediría el padre
     * @return \IvozProvider\Model\Raw\TransformationRulesetGroupsUsers
     */
    public function getTransformationRulesetGroupsUsers($where = null, $orderBy = null, $avoidLoading = false)
    {
        $fkName = 'KamUsersDialplanIbfk2';

        $usingDefaultArguments = is_null($where) && is_null($orderBy);
        if (!$usingDefaultArguments) {
            $this->setNotLoaded($fkName);
        }

        $dontSkipLoading = !($avoidLoading);
        $notLoadedYet = !($this->_isLoaded($fkName));

        if ($dontSkipLoading && $notLoadedYet) {
            $related = $this->getMapper()->loadRelated('parent', $fkName, $this, $where, $orderBy);
            $this->_TransformationRulesetGroupsUsers = array_shift($related);
            if ($usingDefaultArguments) {
                $this->_setLoaded($fkName);
            }
        }

        return $this->_TransformationRulesetGroupsUsers;
    }

    /**
     * Returns the mapper class for this model
     *
     * @return IvozProvider\Mapper\Sql\KamUsersDialplan
     */
    public function getMapper()
    {
        if ($this->_mapper === null) {

            \Zend_Loader_Autoloader::getInstance()->suppressNotFoundWarnings(true);

            if (class_exists('\IvozProvider\Mapper\Sql\KamUsersDialplan')) {

                $this->setMapper(new \IvozProvider\Mapper\Sql\KamUsersDialplan);

            } else {

                 new \Exception("Not a valid mapper class found");
            }

            \Zend_Loader_Autoloader::getInstance()->suppressNotFoundWarnings(false);
        }

        return $this->_mapper;
    }

    /**
     * Returns the validator class for this model
     *
     * @return null | \IvozProvider\Model\Validator\KamUsersDialplan
     */
    public function getValidator()
    {
        if ($this->_validator === null) {

            if (class_exists('\IvozProvider\\Validator\KamUsersDialplan')) {

                $this->setValidator(new \IvozProvider\Validator\KamUsersDialplan);
            }
        }

        return $this->_validator;
    }

    public function setFromArray($data)
    {
        return $this->getMapper()->loadModel($data, $this);
    }

    /**
     * Deletes current row by deleting the row that matches the primary key
     *
     * @see \Mapper\Sql\KamUsersDialplan::delete
     * @return int|boolean Number of rows deleted or boolean if doing soft delete
     */
    public function deleteRowByPrimaryKey()
    {
        if ($this->getId() === null) {
            $this->_logger->log('The value for Id cannot be null in deleteRowByPrimaryKey for ' . get_class($this), \Zend_Log::ERR);
            throw new \Exception('Primary Key does not contain a value');
        }

        return $this->getMapper()->getDbTable()->delete(
            'id = ' .
             $this->getMapper()->getDbTable()->getAdapter()->quote($this->getId())
        );
    }

    public function mustUpdateEtag()
    {
        return true;
    }

}