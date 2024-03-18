function sumFunction(){
    let num = document.getElementById("num").value
    let sum = 0

    for(let i = 0; i < num.length; i++){
        sum += parseInt(num.charAt(i))
    }
    document.getElementById("sum").value = sum
}

function primeFunction(){
    let num = parseInt(document.getElementById("primeNum").value)
    let prime = ""

    console.log(num);
    for(let i = 2; i < (num / 2); i++){
        if(num % i == 0){
            prime = "Keine Primzahl"
            break
        } else{
            prime = "Primzahl"
        }
    }

    document.getElementById("prime").value = prime
}