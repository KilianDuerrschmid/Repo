function getProofNums(){
    let serial = document.getElementById("serial").value;
    let bday = document.getElementById("bday").value;
    let expire = document.getElementById("expire").value;
    let sum = 0;
    let multiply = [7,3,1,7,3,1,7,3,1,7,3,1,7,3,1,7,3,1,7,3,1,7,3,1,7,3,1,7,3,1,7,3,1,7,3,1]
    let result;
    let proofNumSerial;
    let proofNumBday;
    let proofNumExpire;
    let proofNumFinal;

    for (let i = 0; i < serial.length; i++) {
        sum += (serial[i] * multiply[i]) % 10
    }

    proofNumSerial = sum % 10;

    sum = 0;
    for (let i = 0; i < bday.length; i++) {
        sum += (bday[i] * multiply[i]) % 10
    }

    proofNumBday = sum % 10;

    sum = 0;
    for (let i = 0; i < expire.length; i++) {
        sum += (expire[i] * multiply[i]) % 10
    }

    proofNumExpire = sum % 10;

    result = serial + proofNumSerial + bday + proofNumBday + expire + proofNumExpire;

    sum = 0;
    for (let i = 0; i < result.length; i++) {
        sum += (result[i] * multiply[i]) % 10
    }

    proofNumFinal = sum % 10;

    result += proofNumFinal;

    document.getElementById("result").value = result;

}