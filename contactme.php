<?php   
    require("./mailing/mailfunction.php");

    $name = $_POST["name"];
    $phone = $_POST['phone'];
    $email = $_POST["email"];
    $message = $_POST["message"];

    // Create the email body content
    $body = "<ul>
                <li>Name: ".$name."</li>
                <li>Phone: ".$phone."</li>
                <li>Email: ".$email."</li>
                <li>Message: ".$message."</li>
            </ul>";

    // Specify the recipient email address
    $recipientEmail = "notify@cygnonex.com";

    // Call the mailfunction to send the email
    $status = mailfunction($recipientEmail, "Company", $body); //reciever

    // Check if the email was successfully sent
    if($status)
        echo '<center><h1>Thanks! We will contact you soon.</h1></center>';
    else
        echo '<center><h1>Error sending message! Please try again.</h1></center>';    
?>
