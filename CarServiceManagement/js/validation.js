function validateRegister()
{
    let name=document.getElementById("name").value.trim();
    let email=document.getElementById("email").value.trim();
    let mobile=document.getElementById("mobile").value.trim();
    let city=document.getElementById("city").value.trim();
    let address=document.getElementById("address").value.trim();
    let password=document.getElementById("password").value;
    let confirm=document.getElementById("confirm").value;

    if(name=="")
    {
        alert("Enter Full Name");
        return false;
    }

    let emailPattern=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    if(!email.match(emailPattern))
    {
        alert("Enter Valid Email");
        return false;
    }

    let mobilePattern=/^[6-9]\d{9}$/;

    if(!mobile.match(mobilePattern))
    {
        alert("Enter Valid Mobile Number");
        return false;
    }

    if(city=="")
    {
        alert("Enter City");
        return false;
    }

    if(address=="")
    {
        alert("Enter Address");
        return false;
    }

    if(password.length<6)
    {
        alert("Password must be minimum 6 characters");
        return false;
    }

    if(password!=confirm)
    {
        alert("Password and Confirm Password do not match");
        return false;
    }

    return true;
}


// Customer Login Validation

function validateLogin()
{
    let email=document.getElementById("email").value.trim();
    let password=document.getElementById("password").value;

    if(email=="")
    {
        alert("Enter Email");
        return false;
    }

    if(password=="")
    {
        alert("Enter Password");
        return false;
    }

    return true;
}

function validateAdmin()
{
    let username=document.getElementById("username").value.trim();
    let password=document.getElementById("password").value;

    if(username=="")
    {
        alert("Enter Admin Username");
        return false;
    }

    if(password=="")
    {
        alert("Enter Password");
        return false;
    }

    return true;
}


// Mechanic Login Validation

function validateMechanic()
{
    let employee_id = document.getElementById("employee_id").value.trim();
    let password = document.getElementById("password").value.trim();

    if(employee_id == "")
    {
        alert("Enter Employee ID");
        return false;
    }

    if(password == "")
    {
        alert("Enter Password");
        return false;
    }

    return true;
}

// Booking Validation

function validateBooking()
{
    let vehicle=document.getElementById("vehicle").value.trim();
    let model=document.getElementById("model").value.trim();
    let service=document.getElementById("service").value;
    let date=document.getElementById("date").value;
    let problem=document.getElementById("problem").value.trim();

    if(vehicle=="")
    {
        alert("Enter Vehicle Number");
        return false;
    }

    if(model=="")
    {
        alert("Enter Vehicle Model");
        return false;
    }

    if(service=="")
    {
        alert("Select Service");
        return false;
    }

    if(date=="")
    {
        alert("Select Booking Date");
        return false;
    }

    if(problem=="")
    {
        alert("Describe Vehicle Problem");
        return false;
    }

    return true;
}
