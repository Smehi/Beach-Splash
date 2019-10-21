//Array van booleans. Één voor elke KeyCode.
boolean [] lastFrameKeysPressed = new boolean[256];
boolean [] keysPressed = new boolean[256];

//Roep deze methode op na elke update om te onthouden
//na welke knoppen laatste frame warn ingedrukt.
void updateKeys() {
  for (int iKey=0; iKey<keysPressed.length; iKey++)
    lastFrameKeysPressed[iKey] = keysPressed[iKey];
}//End updateKeys

//Zet de waarde van de ingedrukte knop op true.
void keyPressed() {
  keysPressed[keyCode] = true;
}//End keyPressed

//Zet de waarde van de losgelaten knop op false.
void keyReleased() {
  keysPressed[keyCode] = false;
}//End keyReleased