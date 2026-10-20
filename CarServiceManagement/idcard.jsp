<!DOCTYPE html>
<html>
<head>
    <title>Student ID Card</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#ececec;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.card{
    width:340px;
    background:#fff;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 0 20px rgba(0,0,0,.2);
}

h1{
    text-align:center;
    color:#5b00b5;
    margin:20px 0 10px;
    font-size:30px;
}

hr{
    width:80%;
    margin:auto;
    border:1px solid #5b00b5;
}

.photo{
    text-align:center;
    margin:25px 0;
}

.photo img{
    width:170px;
    height:170px;
    border-radius:50%;
    border:4px solid #6a00d4;
    object-fit:cover;
}

.info{
    width:85%;
    margin:auto;
}

.info p{
    padding:15px 0;
    border-bottom:1px solid #ddd;
    font-size:18px;
    color:#333;
}

.info i{
    color:#5b00b5;
    font-size:22px;
    width:40px;
}

.info b{
    color:#3d1668;
    margin-right:10px;
}

.bottom{
    margin-top:30px;
    background:#6a00d4;
    height:120px;
    border-top-left-radius:70% 40px;
    border-top-right-radius:70% 40px;
    display:flex;
    justify-content:center;
    align-items:center;
}

.barcode{
    background:#fff;
    padding:12px 20px;
    border-radius:12px;
    text-align:center;
    font-size:28px;
    font-family:"Libre Barcode 39", monospace;
}

.barcode span{
    display:block;
    font-family:Arial;
    font-size:18px;
    font-weight:bold;
    margin-top:8px;
}
    </style>
</head>
<body>

<div class="card">

    <h1>STUDENT ID CARD</h1>
    <hr>

    <div class="photo">
        <img src="student.jpg" alt="Student">
    </div>

    <div class="info">
        <p><i class="fa-regular fa-user"></i> <b>Name:</b> Aryan Verma</p>
        <p><i class="fa-regular fa-id-card"></i> <b>Roll No:</b> 20240123</p>
        <p><i class="fa-solid fa-graduation-cap"></i> <b>Course:</b> B.Tech (CSE)</p>
        <p><i class="fa-solid fa-school"></i> <b>College:</b> ABC Institute</p>
    </div>

    <div class="bottom">
        <div class="barcode">
            |||||||||||||||||||||||||||||||
            <br>
            <span>Valid Student ID</span>
        </div>
    </div>

</div>

</body>
</html>