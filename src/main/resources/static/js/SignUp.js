function validateForm(){
    var passwordOne = document.getElementById("password");
    var passwordTwo = document.getElementById("password2");
    if(passwordOne.value!=passwordTwo.value){
        alert("Both passwords must be equal!");
        passwordOne.value="";
        passwordTwo.value="";
        return false;
    }
    else{
        return true;
    }
}