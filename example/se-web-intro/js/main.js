(function IIFE() {
    "use strict";

    setTimeout(outputGreeting, 2000);

    outputGreeting(9);
})();


function outputGreeting(hours=new Date().getHours()) {
    let greetingElement = document.getElementById("greeting");

    if (greetingElement) {
        let greeting = "Gokväll";
        if (hours <= 10) {
            greeting = "Gomorgon";
        } else if (hours > 10 && hours <= 16) {
            greeting = "Goddag";
        }

        greetingElement.textContent = greeting;
    }
}
