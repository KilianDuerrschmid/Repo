function format() {
    let red = document.getElementById("red").value
    let green = document.getElementById("green").value
    let blue = document.getElementById("blue").value
    let height = document.getElementById("height").value
    let width = document.getElementById("width").value

    document.getElementById("result").style.backgroundColor = "rgb(" + red + "," + green + "," + blue + ")"
    document.getElementById("result").style.width = width + "px"
    document.getElementById("result").style.height = height + "px"
}

function bigger() {
    let height = document.getElementById("result").offsetHeight;
    let width = document.getElementById("result").offsetWidth;

    height += 20
    width += 20

    document.getElementById("result").style.width = width + "px"
    document.getElementById("result").style.height = height + "px"
}

function smaller() {
    let height = document.getElementById("result").offsetHeight;
    let width = document.getElementById("result").offsetWidth;

    height -= 20
    width -= 20

    if (height > 0 && width > 0) {
        document.getElementById("result").style.width = width + "px"
        document.getElementById("result").style.height = height + "px"
    }

}