function calcDec(){
    let binary = document.getElementById("binary").value;
    let length = binary.length;
    let sum = 0;

    for (let i = 0; i < length; i++) {
       if(binary[i] == 1){
        sum += Math.pow(2, length - (i + 1))
       }
    }

    document.getElementById("decimal").value = sum
}