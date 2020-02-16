class Knot {
  ArrayList<Bead> beads;

  Knot() {
    beads = new ArrayList<Bead>();
  }

  float GetBezier2(float x1, float x2, float x3, float t1) {
    float x12 = GetDivision(x1, x2, t1);
    float x23 = GetDivision(x2, x3, t1);
    return GetDivision(x12, x23, t1);
  }
  
  float GetDivision(float x1, float x2, float t) {
    return (x1 * (1f - t) + x2 * t);
  }

  float GetLengthOfBezier2(float x1, float y1, float x2, float y2, float x3, float y3) {
    float ret = 0;
    float t1 = 0f, t2 = 0.01f;
    for (int i=0; i<100; i++) {
      if (i==0) {
        t1 = 0f;
        t2 = 0.01f;
      } else {
        t1 = t2;
        t2 = 0.01f * (i+1);
      }
      float vx1 = GetBezier2(x1, x2, x3, t1);
      float vy1 = GetBezier2(y1, y2, y3, t1);
      float vx2 = GetBezier2(x1, x2, x3, t2);
      float vy2 = GetBezier2(y1, y2, y3, t2);
      ret += dist(vx1, vy1, vx2, vy2);
    }
    return ret;
  }

  void MakeEdgeBtEndbeads(Bead _b1, PVector _v1, Bead _b2, PVector _v2) {
    if (_v1.mag() == 0) {
      float lengthOfBezier = GetLengthOfBezier2(_b1.X, _b1.Y, _b2.X+_v2.x, _b2.Y+_v2.y, _b2.X, _b2.Y);
    } else {
    }
  }
};
