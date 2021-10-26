// écrire le jour de la semaine en fonction du chiffre tapé par l'utilisateur
// 1 => lundi
// 2 => mardi
// ...
// 7 => dimanche

// clavier         a          b         c                    d           e
// index           0          1         2                    3           4
String[] days = { "entrées", "soupes", "plats consistants", "desserts", "boissons" };

void setup() {
  size(600, 200);
  background(0);
  fill(255);
  textSize(40);
  textAlign(CENTER, CENTER);
  println(days[0]);
}

void draw() {}

void keyPressed() {
  if (key >= 'a' && key <= 'e') {
    background(0);
    int index = key - 'a';
    text(days[index], width / 2, height / 2 - 12);
  }
  println(key, (int) key, key - '1');
}
