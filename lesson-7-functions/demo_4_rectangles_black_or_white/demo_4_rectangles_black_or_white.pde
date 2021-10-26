int nr = 4;
boolean[] isWhites;

void setup() {
  size(400, 400);
  initIsWhites();
}

void draw() {
  for (int i = 0; i < nr; ++i) {
    drawRectangle(isWhites[i], i * width / nr, width / nr);
  }
}

void mousePressed() {
  updateWhites(mouseX);
}

void keyPressed() {
  updateNr(key);
}

void initIsWhites() {
  isWhites = new boolean[nr];
  for (int i = 0; i < nr; ++i) {
    isWhites[i] = true;
  }
}

void updateWhites(int x) {
  int i = getIndexFromPixels(mouseX);
  isWhites[i] = ! isWhites[i];
}

int getIndexFromPixels(int x) {
  return x * nr / width;
}

void drawRectangle(boolean isWhite, int x, int deltaX) {
    if (isWhite) {
      fill(255);
    } else {
      fill(0);
    }
    rect(x, 0, deltaX, height);
}

void updateNr(char k) {
  int value = k - '0';
  if (0 < value && value <= 9) {
    nr = value;
    initIsWhites();
  }
}
