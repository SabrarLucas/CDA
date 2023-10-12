let filtre_mail = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');

let valid = document.getElementById("envoie");  

let mail = document.getElementById("mail");


valid.addEventListener("click",validation);


function validation(e){
    function TestMail(){
        if(mail.value === ""){
            e.preventDefault();
            window.alert("L'adresse mail est manquante");
        }else if(filtre_mail.test(mail.value) == false){
            e.preventDefault();
            window.alert("L'adresse mail n'est pas valide");
        }
    }
    TestMail();
}