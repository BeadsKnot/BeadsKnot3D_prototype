void SetReidemeister3() {
  thisSKnot = new SurfaceKnot();

  Knot knot0 = new Knot();
  int countID = 0;
  for (int i=0; i<6; i++) {
    knot0.beads.add(new Bead(500+400*cos(PI*i/3), 500+400*sin(PI*i/3), countID++));
  }
  for (int i=0; i<3; i++) {
    Bead b = new Bead(500+200*cos(PI*2*i/3+PI/6), 500+200*sin(PI*2*i/3+PI/6), countID++);
    b.Theta = PI * (2*i+1) / 3 +PI/12;
    knot0.beads.add(b);
  }
  knot0.CreateEdgeBtEndbeads(knot0.beads.get(0), knot0.beads.get(6), 3) ;
  knot0.CreateEdgeBtEndbeads(knot0.beads.get(1), knot0.beads.get(6), 0) ;
  knot0.CreateEdgeBtEndbeads(knot0.beads.get(2), knot0.beads.get(7), 3) ;
  knot0.CreateEdgeBtEndbeads(knot0.beads.get(3), knot0.beads.get(7), 0) ;
  knot0.CreateEdgeBtEndbeads(knot0.beads.get(4), knot0.beads.get(8), 3) ;
  knot0.CreateEdgeBtEndbeads(knot0.beads.get(5), knot0.beads.get(8), 0) ;

  knot0.CreateEdgeBtEndbeads(knot0.beads.get(6), 1, knot0.beads.get(7), 2) ;
  knot0.CreateEdgeBtEndbeads(knot0.beads.get(7), 1, knot0.beads.get(8), 2) ;
  knot0.CreateEdgeBtEndbeads(knot0.beads.get(8), 1, knot0.beads.get(6), 2) ;

  thisSKnot.section.add(knot0);
}
