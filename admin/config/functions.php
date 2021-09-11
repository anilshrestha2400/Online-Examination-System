<?php 
    include('database.php');
    
    class Functions extends Database
    {
        //to generate unique name for image
        function uniqid()
        {
            $uniq= md5(uniqid(rand(0000,9999),TRUE));
            return $uniq;
        }
        public function sanitize($conn,$data)
        {
            $clean=mysqli_real_escape_string($conn,$data);
            return $clean;
        }
    }
    //The real_escape_string() / mysqli_real_escape_string() function escapes special characters in a string 
    //for use in an SQL querytaking into account the current character set of the connection.
?>

