Bank
========================

1) Beskriv databasen i ett textstycke
------------------------

Vi har en bank med kunder. Kunderna har bankkonton. en kund kan ha flera bankkonton. Banken har sparat information om kunden, tex namn, adress och personnumer.

Varje bankkonto har ett kontonummer och en balans.

(Ett konto kan vara kopplat till en eller flera kunder.)


2) Skriv ned alla entiteter
------------------------

* kunder
* konton

3) Skriv ned alla relationer (och visa i matris)
------------------------

* Kunderna har ett eller flera bankkonton.
* (Ett konto kan vara kopplat till en eller flera kunder.)


4) Rita enkelt ER-diagram med entiteter och relationer
------------------------


5) Komplettera ER-diagram med kardinalitet
------------------------

* kund (1) har (N) konto - 1:N

* kund (N) har (M) konto - N:M



6) Komplettera ER-diagram med alla attribut samt kandidatnycklar
------------------------

* kund (namn, adress, *personnumer, *id)
* konto (*kontonummer, balans)

