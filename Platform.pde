class Platform {
  float x, y, w, h;

  /**************Initiele waarden van Platform**************/
  void init(float startX, float startY, float startWidth) {
    x = startX;
    y = startY;
    w = startWidth;
    h = 20;
  }//End init

  /**************Teken Platform**************/

  void draw() {
    stroke(1);
    fill(230, 197, 92);
    rect(x, y, w, h);
  }//End draw
}//End Platform classs