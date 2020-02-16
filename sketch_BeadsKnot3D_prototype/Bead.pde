class Bead{
  float X, Y;
  float Theta;
  int ID;
  Bead N1,N2,U1,U2;
  boolean Joint;
  
  Bead(float _X, float _Y, int _ID){
    X = _X;
    Y = _Y;
    ID = _ID;
    N1 = N2 = U1 = U2 = null;
    Joint = false;
  }
  
  void Set_NU12(int R, Bead b){
    if(R == 0){
      N1 = b;
    }
    else if(R==1){
      U1 = b;
    }
    else if (R == 2){
      N2 = b;
    }
    else {
      U2 = b;
    }
  }
  
  void Set_N12(Bead _b1, Bead _b2){
    N1 = _b1;
    N2 = _b2;
  }

  
};
