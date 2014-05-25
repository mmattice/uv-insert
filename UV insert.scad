$fn=180;
difference () {
  union () {
    cylinder (h=.125, r= 2.375/2, center=true);
    translate ([0,0,.5]) cylinder (h=1, r=1, center=true);
  }
  union () {
    translate ([0,0,.75]) cylinder (h=.75, r1 = 7/16, r2 = .95, center=true);
    cylinder (h=2, r=7/16, center=true);
  }
}
