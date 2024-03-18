function stringFunctions(){
    let sL = document.getElementById("length").value
    document.getElementById("stringL").textContent = sL.length

    let sC = document.getElementById("charAt").value
    let charPos = document.getElementById("charAtPos").value
    document.getElementById("stringChar").textContent = sC.charAt(charPos)

    let sCon = document.getElementById("concat").value
    let sCon2 = document.getElementById("concat2").value
    document.getElementById("stringCon").textContent = sCon.concat(", ", sCon2)

    let sI = document.getElementById("indexOf").value
    let indexChar = document.getElementById("indexOf2").value
    document.getElementById("stringPos").textContent = sI.indexOf(indexChar)

    let sSub = document.getElementById("subStr").value
    let sNum = document.getElementById("subStrNum").value
    document.getElementById("stringSub").textContent = sSub.substring(0, sNum);



}