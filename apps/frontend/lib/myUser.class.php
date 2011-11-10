<?php

class myUser extends sfBasicSecurityUser implements AppFlowerSecurityUser
{
    public function initialize(sfEventDispatcher $dispatcher, sfStorage $storage, $options = array())
    {
        // set timeout
        $options['timeout'] = 28800;
        parent::initialize($dispatcher, $storage, $options);
    }
    
    /**
     * Getting AppFlower User
     *
     * @return object
     * @author Łukasz Wojciechowski <luwo@appflower.com>
     */
    public function getAppFlowerUser()
    {
        return new AppFlowerAnonymousUser;
    }
    
}
