boolean Reidemeister3 = true;

SurfaceKnot thisSKnot;

void setup() {
  size(1000, 1000, P3D);
  SetReidemeister3();
  Reidemeister3 = true;
}

float t= -3;

void draw() {
  if (Reidemeister3) {
    Knot k = thisSKnot.section.get(0);
    for (int i=0; i<k.beads.size(); i++) {
      Bead b = k.beads.get(i);
      pushMatrix();
      translate(b.X, b.Y, 0);
      fill(255,0,0);
      noStroke();
      sphere(4f);
      popMatrix();
    }
  }
}
