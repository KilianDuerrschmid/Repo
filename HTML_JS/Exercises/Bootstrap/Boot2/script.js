function calc(){
    console.log("test");
    let netto = document.getElementById("netto").value;
    let satz = document.getElementById("steuersatz").value;

    let brutto = netto * (1 + (satz / 100));
    let steuer = brutto - netto;

    document.getElementById("brutto").value = brutto;
    document.getElementById("steuer").value = steuer;
}

function calc2(){
    console.log("test");
    let brutto = parseFloat(document.getElementById("brutto").value);
    let satz = parseFloat(document.getElementById("steuersatz").value);
    console.log(brutto)
    console.log(satz)

    let netto = (brutto / (100 + satz)) * 100;
    console.log(netto)
   

    let steuer = brutto - netto;
    console.log(steuer)

    document.getElementById("netto").value = netto;
    document.getElementById("steuer").value = steuer;
}