<?php


require_once "Horde/Yaml.php";
require_once "Horde/Yaml/Loader.php";
require_once "Horde/Yaml/Node.php";

class PDO_Connection {

	private  $MYSQL_SERVER;
    private  $MYSQL_USER;
    private  $MYSQL_PASSWORD;
    private  $MYSQL_DATABASE;
    private  $MASTER_MYSQL_SERVER;
    private  $MASTER_MYSQL_USER;
    private  $MASTER_MYSQL_PASSWORD;
    private  $MASTER_MYSQL_DATABASE;
    private  $MASTER_MYSQL_PORT;
    
    public $connection; 
     
    
     function  __construct($database_yml_file="../../../config/database.yml") {
        $environments = Horde_Yaml::loadFile($database_yml_file);
        $environment = 'production';

        $this->MYSQL_SERVER           = $environments[$environment]['host'];
        $this->MYSQL_USER             = $environments[$environment]['username'];
        $this->MYSQL_PASSWORD         = $environments[$environment]['password'];
        $this->MYSQL_DATABASE         = $environments[$environment]['database'];
        $this->MASTER_MYSQL_SERVER    = @$environments[$environment]['master_host'];
        $this->MASTER_MYSQL_USER      = @$environments[$environment]['master_username'];
        $this->MASTER_MYSQL_PASSWORD  = @$environments[$environment]['master_password'];
        $this->MASTER_MYSQL_DATABASE  = @$environments[$environment]['master_database'];
        $this->MASTER_MYSQL_PORT      = @$environments[$environment]['master_port'];
    }

    
    
     function Open($type)
     {     	
     	if($type == 'master')
     	{
     		$con = 'mysql:host='.$this->MASTER_MYSQL_SERVER.'; port='.$this->MASTER_MYSQL_PORT.';dbname='.$this->MASTER_MYSQL_DATABASE.';charset=UTF8';
     		$this->connection = new PDO($con, $this->MASTER_MYSQL_USER, $this->MASTER_MYSQL_PASSWORD,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
     	}
     	else if($type == 'slave')
     	{
     		$con = 'mysql:host='.$this->MYSQL_SERVER.';dbname='.$this->MYSQL_DATABASE.';charset=UTF8';
     		$this->connection = new PDO($con, $this->MYSQL_USER, $this->MYSQL_PASSWORD,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
     	}     	
     	$this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Set Errorhandling to Exception
     	
     }
     
     function Close()
     {
     	$this->connection =null;     	 	
     }
}
    
    
