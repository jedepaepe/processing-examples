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
  println(months[0]);
}

void draw() {}
//                   1      2      3      4      5      6      7      8      9      a      b      c  
//                   0      1      2      3      4      5      6      7      8      9      10     11
String[] months = { "jan", "fev", "mar", "avr", "mai", "jui", "jui", "aou", "sep", "oct", "nov", "dec" };

void keyPressed() {
  if (key >= '1' && key <= '9') {
    background(0);
    int index = key - '1';
    text(months[index], width / 2, height / 2 - 12);
  }
  if (key >= 'a' && key <= 'c') {
    background(0);
    int index = key - 'a' + 9;
    text(months[index], width / 2, height / 2 - 12);
  }
  println(key, (int) key, key - 'A');
}
