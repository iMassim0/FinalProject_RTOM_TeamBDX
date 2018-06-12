function openObject(objectName) {
    var i;
    var x = document.getElementsByClassName("tabs");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    document.getElementById(objectName).style.display = "block";
}
