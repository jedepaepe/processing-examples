int nr = 4;
boolean[] isWhites = new boolean[nr];

void setup() {
  size(400, 400);
  for (int i = 0; i < nr; ++i) {
    isWhites[i] = true;
  }
}

void draw() {
  for (int i = 0; i < nr; ++i) {
    if (isWhites[i]) {
      fill(255);
    } else {
      fill(0);
    }
    int deltaX = width / nr;
    rect(i * deltaX, 0, deltaX, height);
  }
}

void mousePressed() {
  int i = mouseX * nr / width;
  isWhites[i] = ! isWhites[i];
}
