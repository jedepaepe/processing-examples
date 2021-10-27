// écrire le jour de la semaine en fonction du chiffre tapé par l'utilisateur
// 1 => lundi
// 2 => mardi
// ...
// 7 => dimanche

void setup() {
  size(600, 200);
  background(0);
  fill(255);
  textSize(40);
  textAlign(CENTER, CENTER);
}

void draw() {}

void keyPressed() {
  if (key >= '1' && key <= '7') {
    background(0);
    switch (key) {
      case '1':
        text("lundi", width / 2, height / 2);
        break;
      case '2':
        text("mardi", width / 2, height / 2);
        break;
      case '3':
        text("mercredi", width / 2, height / 2);
        break;
      case '4':
        text("jeudi", width / 2, height / 2);
        break;
      case '5':
        text("vendredi", width / 2, height / 2);
        break;
      case '6':
        text("samedi", width / 2, height / 2);
        break;
      case '7':
        text("dimanche", width / 2, height / 2);
    }
  }
  println(key);
}
