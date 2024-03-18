function calc(){
    console.log("test");
    let netto = document.getElementById("netto").value;
    let satz = document.getElementById("steuersatz").value;

    let brutto = netto * (1 + (satz / 100));
    let steuer = brutto - netto;

    document.getElementById("brutto").value = brutto;
    document.getElementById("steuer").value = steuer;
}