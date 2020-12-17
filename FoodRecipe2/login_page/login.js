var modal = document.getElementById('id01'); 
window.onclick = function(event) { 
    if (event.target == modal) { 
        modal.style.display = "none"; 
    } 
} 




// Username is valid e-mail address
// Password between 8 to 15 characters which contain
// at least one lowercase letter, one uppercase letter, 
// one numeric digit, and one special character
function validate(){
    var username = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
    var passw =  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
    if(   document.getElementById("text1").value.match(username)
       && document.getElementById("text2").value.match(passw) )
    {
       // alert( "validation succeeded" );
       window.location="../home_page/index.html"
    }
    else if ( !document.getElementById("text2").value.match(passw) ){
        alert( "password failed" );
    }
    else
    {
        alert( "username failed" );
    }
}


