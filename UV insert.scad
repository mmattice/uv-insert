$fn=90;

// Diameter of hole we're piloting for
$centerholedia = 1;
// Inner diameter of pipe we need the extension to fit inside of
$pipedia = 2;
// Inner diameter of fitting we need the base to fit inside of
$fittingdia = 2.375;
// Height of the pipe insert
$exten = 1;
// Height of angled part of pilot
$pilotdepth = $exten - .25;
// thickness of rim to hold piece between pipe and fitting
$basethick = .125;
// pilot rim width
$pilotrimwidth = .1;


scale ([25.4, 25.4, 25.4]) {
  difference () {
    union () {
      cylinder (h=$basethick,
                r= $fittingdia/2);
      cylinder (h=$exten + $basethick,
                r=$pipedia/2);
    }
    union () {
      translate ([0,0,$exten - $pilotdepth + $basethick])
        cylinder (h=$pilotdepth,
                  r1 = $centerholedia/2,
                  r2 = $pipedia/2 - $pilotrimwidth);
      cylinder (h=$basethick + $exten,
                r=$centerholedia/2);
    }
  }
}
