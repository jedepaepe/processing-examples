int cellWidth = 100;              // largeur des cases
char player = 'X';                // player est "X" ou "O"
String cells = "---------";       // string contenant des " " ou "X" ou "O"
                                  // chaque caractère représente une case
                                  // voici les index des caractères
                                  // positionnés dans les cases correspondants
                                  //  0  1  2
                                  //  3  4  5
                                  //  6  7  8
char winner = '-';                // le gagnant "X" ou "O" ou " " s'il n'y a pas de gagnant

// appelé par processing au démarrage
void setup() {
  size(300, 300);
  background(0);
  stroke(255);
  // dessine les cases
  for (int i = cellWidth; i < width; i += cellWidth) {
    line(i, 0, i, height);
    line(0, i, width, i);
  }
  textAlign(CENTER, CENTER);
}

// appelé par processing 60x par seconde
// nécessaire même si vide (secret de processing)
void draw() {
}

// appelé par processing lorsque la souris est pressée
void mousePressed() {
  // réinitialise l'application si la partie est terminée
  if (winner != '-') { //<>//
    player = 'X';
    cells = "---------";
    winner = '-';
    background(0);
    stroke(255);
    // dessine les cases
    for (int i = cellWidth; i < width; i += cellWidth) {
      line(i, 0, i, height);
      line(0, i, width, i); //<>//
    }
  }
  else {
    // calcule les index à partir de la position de la souris
    int indexX = mouseX / cellWidth;        // index de la colonne (x)
    int indexY = mouseY / cellWidth;        // index de la ligne (y)
    int cellIndex = indexX + indexY * 3;    // index de la String cells
  
    // si la case est vide
    if (cells.charAt(cellIndex) == '-') {
      // dessine la case
      textSize(80);
      fill(255);
      text(player, cellWidth * (indexX + 0.5), cellWidth * (indexY + 0.5) - 10);
      cells = cells.substring(0, cellIndex) + player + cells.substring(cellIndex + 1);
      player = (player == 'X') ? 'O' : 'X';    
    }
    
    // vérifie le match nul
    if (! cells.contains("-")) {
      // affiche match nul
      fill(0, 0, 0, 180);
      rect(0, 100, width, 100);
      textSize(50);
      fill(0, 0, 255);
      text("match nul", width / 2, height / 2);
      winner = '0';    // zéro => force la réinitialisation de l'application 
    }
  
    // vérifie si un joueur a gagné
    for (int i = 0; i < 3; ++i) {
      // lignes
      if (cells.charAt(i * 3) != '-' && cells.charAt(i * 3) == cells.charAt(1 + i * 3) && cells.charAt(i * 3) == cells.charAt(2 + i * 3)) winner = cells.charAt(i * 3);
      // colonnes
      if (cells.charAt(i) != '-' && cells.charAt(i) == cells.charAt(i + 3) && cells.charAt(i) == cells.charAt(i + 6)) winner = cells.charAt(i);
    }
    // diagonales
    if (cells.charAt(0) != '-' && cells.charAt(0) == cells.charAt(4) && cells.charAt(0) == cells.charAt(8)) winner = cells.charAt(0);
    if (cells.charAt(2) != '-' && cells.charAt(2) == cells.charAt(4) && cells.charAt(2) == cells.charAt(6)) winner = cells.charAt(2);
  
    // si un joueur a gagné
    if (winner == 'X' || winner == 'O') {
        // affiche le "nom" du gagnant
        fill(0, 0, 0, 180);
        rect(0, 100, width, 100);
        textSize(50);
        fill(0, 0, 255);
        text(winner + " a gagné", width / 2, height / 2);
    }
  }
}
