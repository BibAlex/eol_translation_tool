<?
class BLL_countries {
	static function get_name($id) {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("SELECT * as name FROM country WHERE id=?;");
		$query->bindParam(1, $id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_countries');
		$con->Close();
		if (count($records)>0)
		return $records[0]->name;
		else
		return '';
	}

	static function load_all() {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("SELECT * FROM country order by name;");
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_countries');
		$con->Close();
		return $records;
	}
}
?>