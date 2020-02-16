class Knot {
  ArrayList<Bead> beads;
  float interval = 25f;

  Knot() {
    beads = new ArrayList<Bead>();
  }

  void CreateEdgeByEndbeads(Bead b1, Bead b2, int R) {
    float distance = dist(b1.X, b1.Y, b2.X, b2.Y) *0.4f;
    float x1 = b1.X;
    float y1 = b1.Y;
    float x2 = b2.X + distance * cos(b2.Theta + PI * R * 0.5);
    float y2 = b2.Y + distance * sin(b2.Theta + PI * R * 0.5);
    float x3 = b2.X;
    float y3 = b2.Y;
    float lengthOfBezier = GetLengthOfBezier2(x1, y1, x2, y2, x3, y3);
    int numberOfInterval = int( lengthOfBezier / interval );
    float realInterval = lengthOfBezier / numberOfInterval;
    float arclength = 0f; 
    int countIntervals = 1;
    float t1 = 0f, t2 = 0.01f;
    int newID = GetMaxID() + 1;
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
      arclength += dist(vx1, vy1, vx2, vy2);
      if (countIntervals < numberOfInterval && arclength > realInterval * countIntervals) {
        // addBead();
        beads.add(new Bead(vx2, vy2, newID));
        countIntervals++;
        newID++;
      }
    }
    return;
  }

  void CreateEdgeByEndbeads(Bead b1, int R1, Bead b2, int R2) {
    float distance = dist(b1.X, b1.Y, b2.X, b2.Y) *0.3f;
    float x1 = b1.X;
    float y1 = b1.Y;
    float x2 = b1.X + distance * cos(b1.Theta + PI * R1 * 0.5);
    float y2 = b1.Y + distance * sin(b1.Theta + PI * R1 * 0.5);
    float x3 = b2.X + distance * cos(b2.Theta + PI * R2 * 0.5);
    float y3 = b2.Y + distance * sin(b2.Theta + PI * R2 * 0.5);
    float x4 = b2.X;
    float y4 = b2.Y;
    float lengthOfBezier = GetLengthOfBezier3(x1, y1, x2, y2, x3, y3, x4, y4);
    int numberOfInterval = int( lengthOfBezier / interval );
    float realInterval = lengthOfBezier / numberOfInterval;
    float arclength = 0f; 
    int countIntervals = 1;
    float t1 = 0f, t2 = 0.01f;
    int newID = GetMaxID() + 1;
    for (int i=0; i<100; i++) {
      if (i==0) {
        t1 = 0f;
        t2 = 0.01f;
      } else {
        t1 = t2;
        t2 = 0.01f * (i+1);
      }
      float vx1 = GetBezier3(x1, x2, x3, x4, t1);
      float vy1 = GetBezier3(y1, y2, y3, y4, t1);
      float vx2 = GetBezier3(x1, x2, x3, x4, t2);
      float vy2 = GetBezier3(y1, y2, y3, y4, t2);
      arclength += dist(vx1, vy1, vx2, vy2);
      if (countIntervals < numberOfInterval && arclength > realInterval * countIntervals) {
        // addBead();
        beads.add(new Bead(vx2, vy2, newID));
        countIntervals++;
        newID++;
      }
    }
    return;
  }

  float GetBezier2(float x1, float x2, float x3, float t1) {
    float x12 = GetDivision(x1, x2, t1);
    float x23 = GetDivision(x2, x3, t1);
    return GetDivision(x12, x23, t1);
  }

  float GetBezier3(float x1, float x2, float x3, float x4, float t1) {
    float x12 = GetDivision(x1, x2, t1);
    float x23 = GetDivision(x2, x3, t1);
    float x34 = GetDivision(x3, x4, t1);
    return GetBezier2(x12, x23, x34, t1);
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

  float GetLengthOfBezier3(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
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
      float vx1 = GetBezier3(x1, x2, x3, x4, t1);
      float vy1 = GetBezier3(y1, y2, y3, y4, t1);
      float vx2 = GetBezier3(x1, x2, x3, x4, t2);
      float vy2 = GetBezier3(y1, y2, y3, y4, t2);
      ret += dist(vx1, vy1, vx2, vy2);
    }
    return ret;
  }

  int GetMaxID() {
    int maxID = -1;
    for(int i=0; i<beads.size(); i++){
      Bead bd = beads.get(i);
      if(maxID < bd.ID){
        maxID = bd.ID;
      }
    }
    return maxID;
  }
};
