// nr de cellules par ligne et par colonne
int nr;

// marge autour du damier (plan de jeu)
int margin;

// largeur d'une case
int cellWidth;

// variable contenant la hauteur d'une case
int cellHeight;

// indique quel est le joueur actif: true => X, false => O
boolean isPlayerX;  

// contient l'état du damier
String cells;

// appelé par processing au démarrage de l'application
void setup() {
  size(400, 400);
  initState();
  drawGame();
}

// applelé par processing pour afficher (doit être présent, même vide)
void draw() {
}

// appelé par processing lorsque la souris est pressée
void mousePressed() {
  updateState();
  drawGame();
}

/**
* initialise l'état de l'application
**/
void initState() {
  nr = 3;
  margin = 50;
  cellWidth = (width - 2 * margin) / nr;
  cellHeight = (height - 2 * margin) / nr;
  isPlayerX = true;
  cells = "         ";  // toutes les cellules sont vides (=> 9 espaces)
}

/**
 * update the state of the application
**/
void updateState() {
  if (! isTerminated()) {
    if (isCellFree(mouseX, mouseY)) {
      setCase(getCurrentPlayerChar(), mouseX, mouseY);
      isPlayerX = ! isPlayerX;
    }
  } else {
    initState();
  }
}

/**
* indique si le jeu est terminé
**/
boolean isTerminated() {
  return areCellsFull() || hasWin(true) || hasWin(false);
}

/**
* indique si toutes les cases sont remplies
* @return true si toutes les cases sont remplies et false dans le cas contraire
*/
boolean areCellsFull() {
  return ! cells.contains(" ");
}

/**
 * indique si le joueur a gagné
 * @return true si le joueur a gagné, false si le joueur a perdu
 **/
boolean hasWin(boolean isPlayerX) {
  char player = getPlayerChar(isPlayerX);
  // lignes & colonnes
  for (int i = 0; i < nr; ++i) {
    if (getCellChar(0, i) == player && getCellChar(1, i) == player && getCellChar(2, i) == player) return true;
    if (getCellChar(i, 0) == player && getCellChar(i, 1) == player && getCellChar(i, 2) == player) return true;
  }
  // diagonales
  if (cells.charAt(0) == 'X' && cells.charAt(4) == 'X' && cells.charAt(8) == 'X') return true;
  if (cells.charAt(2) == 'X' && cells.charAt(4) == 'X' && cells.charAt(6) == 'X') return true;
  if (getCellChar(0, 0) == player && getCellChar(1, 1) == player && getCellChar(2, 2) == player) return true;
  if (getCellChar(0, 2) == player && getCellChar(1, 1) == player && getCellChar(2, 0) == player) return true;
  return false;
}

/**
 * indique si une cellule est libre
 * @param x est la position x en pixels
 * @param y est la position y en pixels
 * @return true si la cellule est libre, false si la cellule n'est pas libre, false si x,y est en dehors du damier
 **/
boolean isCellFree(int x, int y) {
  int indexX = getIndexX(x);
  int indexY = getIndexY(y);
  if (indexX < 0 || indexY < 0) return false;
  return getCellChar(indexX, indexY) == ' ';
}

/**
 * @return le caractère du joueuer courant (X ou O)
 **/
char getCurrentPlayerChar() {
  return getPlayerChar(isPlayerX);
}

void setCase(char player, int x, int y) {
  int indexX = getIndexX(x);
  int indexY = getIndexY(y);
  setCellChar(player, indexX, indexY);
}

/**
* met le caractère c dans la String cells à la position (indexX, indexY)
* @param c est le caractère à placer dans la String cells
* @param indexX est l'index horizontal d'une cellule
* @param indexY est l'index vertical d'une cellule
**/
void setCellChar(char c, int indexX, int indexY) {
  int cellIndex = getCellIndex(indexX, indexY);
  cells = cells.substring(0, cellIndex) + c + cells.substring(cellIndex + 1);
}

/**
 * dessine le damier
 **/
void drawGame() {
  drawHeader();
  drawBoard();
  drawCells();
}

/**
 * dessine l'entête
**/
void drawHeader() {
  if (hasWin(true)) writeWinner(true);
  else if (hasWin(false)) writeWinner(false);
  else if (areCellsFull()) writeEgalityGame();
  else writePlayer(isPlayerX);
}

/**
 * affiche l'information relative au joeur
 **/
void writePlayer(boolean isPlayer) {
  writeHeaderText("joueur " + getPlayerChar(isPlayer));
}

void writeWinner(boolean isPlayer) {
  writeHeaderText(getPlayerChar(isPlayer) + " a gagné");
}

void writeEgalityGame() {
  writeHeaderText("Match null");
}

void writeHeaderText(String message) {
    stroke(0);
  fill(0);
  rect(0, 0, width, margin - 1);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(margin * 0.6);
  text(message, width / 2, margin * 0.4);
}

/**
 * dessine le damier 
**/
void drawBoard() {
  stroke(255);
  fill(0);
  for (int i = 0; i <= nr; ++i) {
    line(margin + i * cellWidth, margin, margin + i * cellWidth, height - margin);
    line(margin, margin + i * cellHeight, width - margin, margin + i * cellHeight);
  }
}

/**
* dessine les cases, plus exactement les caractères (X ou O) dans les cases
**/
void drawCells() {
  for (int x = 0; x < nr; ++x) {
    for (int y = 0; y < nr; ++y) {
      drawCase(x, y);
    }
  }
}

/**
 * dessine une case, plus exactement le caractère (X ou O) dans la case
 * @param x est la position x en pixels
 * @param y est la position y en pixels
 **/
void drawCase(int indexX, int indexY) {
  textSize(cellHeight * 0.6);
  fill(255);
  text(getCellChar(indexX, indexY), margin + cellWidth / 2 + indexX * cellWidth, margin + cellHeight / 2 + indexY * cellHeight);
}

/**
* retourne le caractère du joueur (X ou O)
* @param isPlayerX est true si le joueur est X, sinon O
* @return X ou O
**/
char getPlayerChar(boolean isPlayerX) {
  return isPlayerX ? 'X' : 'O';
}

/**
* retourne le caractère dans la cellule d'indexX et indexY
* @param indexX est l'index x de la cellule
* @param indexY est l'index y de la cellule
* @return le caractère dans la cellule (indexX, indexY)
**/
char getCellChar(int indexX, int indexY) {
  return cells.charAt(getCellIndex(indexX, indexY));
}

/**
* retoune l'index du caractère dans la String cells correspondant à l'indexX,indexY
* exemple getCellIndex(1, 1) retourne 4
* @param indexX est l'index x de la cellule
* @param indexY est l'index y de la cellule
* @return l'index du caractère correspondant
*/
int getCellIndex(int indexX, int indexY) {
  return indexX + indexY * 3;
}
 //<>//
/**
 * retourne l'index horizontal (x) de la cellule pointée par la position x
 * @param x est la position horizontale (x) en pixels
 * @return l'index horizontal (x) de la cellule (0, 1 ou 2)
 **/
int getIndexX(int x) {
  if (x < 0) return -1;
  return (x - margin) / cellWidth;
}

/**
 * retourne l'index vertical (y) de la cellule pointée par la position y
 * @param y est la position verticale (y) en pixels
 * @return l'index vertical (y) de la cellule (0, 1 ou 2)
 **/
int getIndexY(int y) {
  if (y < 0) return -1;
  return (y - margin) / cellHeight;
}
