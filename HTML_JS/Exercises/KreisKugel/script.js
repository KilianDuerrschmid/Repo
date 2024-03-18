function calc(){
    let radius = document.getElementById("radius").value
    let check = document.getElementById("circle").checked
    let result1;
    let result2;

    if(check){
        document.getElementById("valueOneText").innerHTML = "Fläche";
        document.getElementById("valueTwoText").innerHTML = "Umfang";

        result1 = Math.PI * Math.pow(radius, 2)

        result2 = 2 * radius * Math.PI

        document.getElementById("value1").value = result1;
        document.getElementById("value2").value = result2;


    } else{
        document.getElementById("valueOneText").innerHTML = "Oberfläche";
        document.getElementById("valueTwoText").innerHTML = "Volumen";

        result1 = 4 * Math.PI * Math.pow(radius, 2);

        result2 = (4/3) * Math.PI * Math.pow(radius, 3);

        document.getElementById("value1").value = result1;
        document.getElementById("value2").value = result2;
    }
}