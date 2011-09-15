<?php
	class BLL_users {
	    private $all_users;
		
	    static function get_user_id() {
	        return $_SESSION["user_id"];
	    }
	    
	    static function load_all() {
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("select * from users order by name;");		  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();   
				    	
	    	return $records;
	    }
	    
	    private function load_users() {
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("select * from users where active=1 order by name;");		  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();   
				    	
	    	$this->all_users = $records;
	    }
	    
	    private function get_users_options($selected_user, $table_field) {
	    	$return_str = '';
	    	if (!isset($this->all_users))
	    		$this->load_users();    	
	    	
	    	$return_str .= '<option value=0';
	    	if ($selected_user==0) $return_str .= ' selected ';
	    	$return_str .= '></option>';	
	    	foreach ($this->all_users as $user) {	    	
	    		if (($user->task_distributor == 1 && $table_field=='task_distributor') ||
	    			($user->translator == 1 && $table_field=='translator') ||
	    			($user->linguistic_reviewer == 1 && $table_field=='linguistic_reviewer') ||
	    			($user->scientific_reviewer == 1 && $table_field=='scientific_reviewer') ||
	    			($user->final_editor == 1 && $table_field=='final_editor') ||
	    			($user->selector == 1 && $table_field=='selector')) {		    		
	    				
	    				$return_str .= '<option value='.strval($user->id);
		    			if ($selected_user==$user->id) $return_str .= ' selected ';
		    			$return_str .= ' title="'.$user->name.' ('.$user->email.')"';
		    			$return_str .= '>'.$user->name.' ('.$user->email.')</option>';
	    		}
	    	}
	    	return $return_str;
	    }
	    
	    public function get_translators_options($selected_user) {
	    	return $this->get_users_options($selected_user, 'translator');
	    }
	    
		public function get_linguistic_reviewers_options($selected_user) {
	    	return $this->get_users_options($selected_user, 'linguistic_reviewer');
	    }
	    
	 	public function get_scientific_reviewers_options($selected_user) {
	    	return $this->get_users_options($selected_user, 'scientific_reviewer');
	    }
	    
	    static function get_user_name($id) {	    	
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT name FROM users WHERE id=?;");
		  	
		  	$query->bindParam(1, $id);	 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();			
			if (count($records)>0)
				return $records[0]->name;
			else
				return '';			 	
	    }
            
            static function get_user_email($id) {	    	
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT email FROM users WHERE id=?;");
		  	
		  	$query->bindParam(1, $id);	 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();			
			if (count($records)>0)
				return $records[0]->email;
			else
				return '';			 	
	    }
	    
	    static function validate_user($username, $password) {
	    	
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM users WHERE username=? and password=? and active=1;");
		  	$query->bindParam(1, $username);	 	
		  	$query->bindParam(2, $password);
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
	    	$con->Close();
	    		    	
	    	if (count($records) > 0)
	    		return $records[0];
    		else
    			return new BLL_users();
				
	    }
	    
	    static function load_by_id($id) {
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM users WHERE id=?;");
		  	$query->bindParam(1, $id);	 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();    
			
			return $records;
	    }
	    
	    static function email_exists($id, $email) {
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM users WHERE id<>? and email=?;");
		  	$query->bindParam(1, $id);	 	
		  	$query->bindParam(2, $email);
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();    
			
			if (count($records) == 0)
				return false;
			else
				return true;
	    }
	    
		static function username_exists($id, $username) {
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM users WHERE id<>? and username=?;");
		  	$query->bindParam(1, $id);	 	
		  	$query->bindParam(2, $username);
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();    
			
			if (count($records) == 0)
				return false;
			else
				return true;
	    }
	    
		static public function save($user) {
			
			$con = new PDO_Connection();
		  	$con->Open('slave');	
			
			if ($user->id == 0) {
				$query_str = 'insert into users (
									name, username, password, super_admin, selector, task_distributor,
									translator, linguistic_reviewer, scientific_reviewer, final_editor,
									active, email, country_id) 
								values (
									?, ?, ?, ?, ?, ?,
									?, ?, ?, ?, ?, ?, ?);';
				
				$query = $con->connection->prepare($query_str);		
				
				$query->bindParam(1, $user->name, PDO::PARAM_STR);			
				$query->bindParam(2, $user->username, PDO::PARAM_STR);
				$query->bindParam(3, $user->password, PDO::PARAM_STR);
				$query->bindParam(4, $user->super_admin, PDO::PARAM_INT);
				$query->bindParam(5, $user->selector, PDO::PARAM_INT);
				$query->bindParam(6, $user->task_distributor, PDO::PARAM_INT);
				$query->bindParam(7, $user->translator, PDO::PARAM_INT);
				$query->bindParam(8, $user->linguistic_reviewer, PDO::PARAM_INT);
				$query->bindParam(9, $user->scientific_reviewer, PDO::PARAM_INT);
				$query->bindParam(10, $user->final_editor, PDO::PARAM_INT);
				$query->bindParam(11, $user->active, PDO::PARAM_INT);
				$query->bindParam(12, $user->email, PDO::PARAM_STR);
				$query->bindParam(13, $user->country_id, PDO::PARAM_INT);
						
			} else {
				$query_str = 'update users set 
									name=?,
									super_admin=?,
									selector=?,									
									task_distributor=?,
									translator=?,
									linguistic_reviewer=?,
									scientific_reviewer=?,
									final_editor=?,
									active=?,
									email=?,
									country_id=?,
									password=?
								where id=?;';
				
				$query = $con->connection->prepare($query_str);		
				
				$query->bindParam(1, $user->name, PDO::PARAM_STR);			
				$query->bindParam(2, $user->super_admin, PDO::PARAM_INT);
				$query->bindParam(3, $user->selector, PDO::PARAM_INT);
				$query->bindParam(4, $user->task_distributor, PDO::PARAM_INT);
				$query->bindParam(5, $user->translator, PDO::PARAM_INT);
				$query->bindParam(6, $user->linguistic_reviewer, PDO::PARAM_INT);
				$query->bindParam(7, $user->scientific_reviewer, PDO::PARAM_INT);
				$query->bindParam(8, $user->final_editor, PDO::PARAM_INT);
				$query->bindParam(9, $user->active, PDO::PARAM_INT);
				$query->bindParam(10, $user->email, PDO::PARAM_STR);
				$query->bindParam(11, $user->country_id, PDO::PARAM_INT);
				$query->bindParam(12, $user->password, PDO::PARAM_STR);
				$query->bindParam(13, $user->id, PDO::PARAM_INT);
			}							
			
			$query->execute();						
			
		    if ($user->id == 0)
		    	$user->id = $con->connection->lastInsertId();		
		    
			$con->Close();  
			
		}
		
		static function get_task_distributors() {
			return BLL_users::get_users_by_type('task_distributor');
		}
		
		static function get_users_by_type($type) {
			$query_str = 'select * from users where '.$type.'=1 and active=1';
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare($query_str);		  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();    
			
			return $records;
		}
		
		static function Select_Users_ByRole($role){
			$query_str = '';
			switch ($role) {
				case 2: $query_str = 'select * from users where translator=1 ORDER BY name;'; break;
				case 3: $query_str = 'select * from users where scientific_reviewer=1  ORDER BY name;'; break;
				case 4: $query_str = 'select * from users where linguistic_reviewer=1  ORDER BY name;'; break;
				case 5: $query_str = 'select * from users where final_editor=1  ORDER BY name; '; break;
			}
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare($query_str);		  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();
			return $records;
		}
	    
	}
?>
