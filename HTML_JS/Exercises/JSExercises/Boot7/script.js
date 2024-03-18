function calcTemp(){
    let check = document.getElementById("celsius").checked
    let cel = parseFloat(document.getElementById("cel").value)
    let far = parseFloat(document.getElementById("far").value)


    console.log(check + cel + far);

    if(check){
        cel = (far - 32) * (5/9)
        document.getElementById("cel").value = cel
    } else{
        far = cel * 1.8 + 32
        document.getElementById("far").value = far
    }
}
