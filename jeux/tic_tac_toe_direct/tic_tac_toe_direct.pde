int cellWidth = 100;
char player = 'X';
String cells = "         ";
char winner = ' ';

void setup() {
  size(300, 300);
  background(0);
  stroke(255);
  for (int i = cellWidth; i < width; i += cellWidth) {
    line(i, 0, i, height);
    line(0, i, width, i);
  }
  textAlign(CENTER, CENTER);
}

void draw() {
}

void mousePressed() {
  // réinitialise l'application si match nul
  if (winner != ' ') {
    winner = ' ';
    background(0);
    stroke(255);
    for (int i = cellWidth; i < width; i += cellWidth) {
      line(i, 0, i, height);
      line(0, i, width, i); //<>//
    }
  }
  
  textSize(80);
  fill(255);
  int indexX = mouseX / cellWidth;
  int indexY = mouseY / cellWidth;
  int cellIndex = indexX + indexY * 3;
  if (cells.charAt(cellIndex) == ' ') {
    text(player, cellWidth * (indexX + 0.5), cellWidth * (indexY + 0.5) - 10);
    cells = cells.substring(0, cellIndex) + player + cells.substring(cellIndex + 1);
    player = (player == 'X') ? 'O' : 'X';    
  }
  
  // vérifie le match nul
  if (! cells.contains(" ")) {
    fill(0, 0, 0, 180);
    rect(0, 100, width, 100);
    textSize(50);
    fill(0, 0, 255);
    text("match nul", width / 2, height / 2);
  }
  
  // vérifie si un joueur a gagné
  for (int i = 0; i < 3; ++i) {
    // lignes
    if (cells.charAt(i * 3) != ' ' && cells.charAt(i * 3) == cells.charAt(1 + i * 3) && cells.charAt(i * 3) == cells.charAt(2 + i * 3)) winner = cells.charAt(i * 3);
    // colonnes
    if (cells.charAt(i) != ' ' && cells.charAt(i) == cells.charAt(i + 3) && cells.charAt(i) == cells.charAt(i + 6)) winner = cells.charAt(i);
  }
  // diagonales
  if (cells.charAt(0) != ' ' && cells.charAt(0) == cells.charAt(5) && cells.charAt(0) == cells.charAt(8)) winner = cells.charAt(0);
  if (cells.charAt(2) != ' ' && cells.charAt(2) == cells.charAt(4) && cells.charAt(2) == cells.charAt(6)) winner = cells.charAt(2);
  if (winner != ' ') {
      fill(0, 0, 0, 180);
      rect(0, 100, width, 100);
      textSize(50);
      fill(0, 0, 255);
      text(winner + " a gagné", width / 2, height / 2);
  }
}
