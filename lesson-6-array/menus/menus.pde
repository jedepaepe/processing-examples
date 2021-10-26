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
  println(days[0]);
}

void draw() {}

String[] days = { "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche" };

void keyPressed() {
  if (key >= '1' && key <= '7') {
    background(0);
    int index = key - '1';
    text(days[index], width / 2, height / 2 - 12);
  }
  println(key, (int) key, key - '1');
}
