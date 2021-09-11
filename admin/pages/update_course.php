<!--Body Starts Here-->
<?php 
            if(isset($_GET['id']))
            {
                $course_id=$_GET['id'];
                //Getting VAlues fro the datadabase
                $tbl_name="tbl_course";
                $where="course_id=$course_id";
                $query=$obj->select_data($tbl_name,$where);
                $res=$obj->execute_query($conn,$query);
                $count_rows=$obj->num_rows($res);
                if($count_rows==1)
                {
                    $row=$obj->fetch_data($res);
                    $faculty_db=$row['faculty'];
                    $course_name=$row['course_name'];
                    $is_active=$row['is_active'];
                }
                else
                {
                    header('location:'.SITEURL.'admin/index.php?page=courses');
                }
            }
            else
            {
                header('location:'.SITEURL.'admin/index.php?page=courses');
            }
        ?>
        <div class="main">
            <div class="content">
                <div class="report">
                    
                    <form method="post" action="" class="forms">
                        <h2>Update Course</h2>
                        <?php 
                            if(isset($_SESSION['update']))
                            {
                                echo $_SESSION['update'];
                                unset($_SESSION['update']);
                            }
                        ?>
                        <span class="name">Faculty Title</span> 
                        <select name="faculty">
                             <?php 
                                //Get Faculties from database
                                $tbl_name="tbl_faculty";
                                $query=$obj->select_data($tbl_name);
                                $res=$obj->execute_query($conn,$query);
                                $count_rows=$obj->num_rows($res);
                                if($count_rows>0)
                                {
                                    while($row=$obj->fetch_data($res))
                                    {
                                        $faculty_id=$row['faculty_id'];
                                        $faculty_name=$row['faculty_name'];
                                        ?>
                                        <option <?php if($faculty_db==$faculty_name){echo"selected='selected'";} ?> value="<?php echo $faculty_name; ?>"><?php echo $faculty_name; ?></option>
                                        <?php
                                    }
                                }
                                else
                                {
                                    ?>
                                    <option value="0">Uncategorized</option>
                                    <?php
                                }
                            ?>
                        </select>
                        <br />

                        <span class="name">Course Title</span> 
                        <input type="text" name="course_name" value="<?php echo $course_name; ?>" required="true" /> <br />
                        
                        <span class="name">Is Active?</span>
                        <input <?php if($is_active=="yes"){echo "checked='checked'";} ?> type="radio" name="is_active" value="yes" /> Yes 
                        <input <?php if($is_active=="no"){echo "checked='checked'";} ?> type="radio" name="is_active" value="no" /> No
                        <br />
                        
                        <input type="submit" name="submit" value="Update Course" class="btn-update" style="margin-left: 15%;" />
                        <button type="button" class="btn-delete">Cancel</button>
                    </form>
                    <?php 
                        if(isset($_POST['submit']))
                        {
                            //echo "Clcked";
                            //Getting all the values from the forms
                            $faculty_name=$obj->sanitize($conn,$_POST['faculty']);
                            $course_name=$obj->sanitize($conn,$_POST['course_name']);
                            $is_active=$obj->sanitize($conn,$_POST['is_active']);
                            $updated_date=date('Y-m-d');
                            
                            $tbl_name='tbl_course';
                            $data="faculty='$faculty_name',
                                    course_name='$course_name',
                                    is_active='$is_active',
                                    updated_date='$updated_date'";
                            $where="course_id='$course_id'";
                            $query=$obj->update_data($tbl_name,$data,$where);
                            $res=$obj->execute_query($conn,$query);
                            if($res===true)
                            {
                                $_SESSION['update']="<div class='success'>Course successfully updated.</div>";
                                header('location:'.SITEURL.'admin/index.php?page=faculties');
                            }
                            else
                            {
                                $_SESSION['update']="<div class='error'>Failed to update course. Please try again.</div>";
                                header('location:'.SITEURL.'admin/index.php?page=update_course&id='.$course_id);
                            }
                        }
                    ?>
                </div>
            </div>
        </div>
        <!--Body Ends Here-->