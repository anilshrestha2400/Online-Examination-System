<!--Body Starts Here-->
<div class="main">
            <div class="content">
                <div class="report">
                    
                    <form method="post" action="" class="forms">
                        <h2>Add Course</h2>
                        <?php 
                            if(isset($_SESSION['validation']))
                            {
                                echo $_SESSION['validation'];
                                unset($_SESSION['validation']);
                            }
                            if(isset($_SESSION['add']))
                            {
                                echo $_SESSION['add'];
                                unset($_SESSION['add']);
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
                                        <option value="<?php echo $faculty_name; ?>"><?php echo $faculty_name; ?></option>
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
                        <input type="text" name="course_name" placeholder="Course Title" required="true" /> <br />
                        
                        <span class="name">Is Active?</span>
                        <input type="radio" name="is_active" value="yes" /> Yes 
                        <input type="radio" name="is_active" value="no" /> No
                        <br />
                        
                        <input type="submit" name="submit" value="Add Course" class="btn-add" style="margin-left: 15%;" />
                        <a href="<?php echo SITEURL; ?>admin/index.php?page=faculties">
                            <button type="button" class="btn-delete">Cancel</button>
                        </a>
                    </form>
                    
                    <?php 
                        if(isset($_POST['submit']))
                        {
                            //echo "Clicked";
                            //Get Values froom the form
                            $faculty_name=$obj->sanitize($conn,$_POST['faculty']);
                            $course_name=$obj->sanitize($conn,$_POST['course_name']);
                            if(isset($_POST['is_active']))
                            {
                                $is_active=$obj->sanitize($conn,$_POST['is_active']);
                            }
                            else
                            {
                                $is_active="yes";
                            }
                            $added_date=date('Y-m-d');
                            
                            //Normal PHP Validation
                            if(($faculty_name=="")||($course_name==""))
                            {
                                $_SESSION['validation']="<div class='error'>Course name or Faculty name is Empty.</div>";
                                header('location:'.SITEURL.'admin/index.php?page=add_course');
                            }
                            //Inserting into the database
                            $tbl_name='tbl_course';
                            $data="faculty='$faculty_name',
                                    course_name='$course_name',
                                    is_active='$is_active',
                                    added_date='$added_date',
                                    updated_date=''";
                            //Query to Insert Data
                            $query=$obj->insert_data($tbl_name,$data);
                            $res=$obj->execute_query($conn,$query);
                            if($res===true)
                            {
                                //Success Message
                                $_SESSION['add']="<div class='success'>New course successfully added.</div>";
                                header('location:'.SITEURL.'admin/index.php?page=faculties');
                            }
                            else
                            {
                                //FAil Message
                                $_SESSION['add']="<div class='error'>Failed to add new course. Try again.</div>";
                                header('location:'.SITEURL.'admin/index.php?page=add_course');
                            }
                        }
                    ?>
                </div>
            </div>
        </div>
        <!--Body Ends Here-->