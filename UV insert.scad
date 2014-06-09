$fn=90;

// Diameter of hole we're piloting for
$centerholedia = 1;
// Inner diameter of pipe we need the extension to fit inside of
$nompipesize = 5; // [ 0: 1/2", 1: 3/4", 2: 1", 3: 1 1/4", 4: 1 1/2", 5: 2", 6: 2 1/2", 7: 3", 8: 4"]
// Schedule of pipe
$schedule = 3;  // [1: Schedule 10, 2: Normal, 3: Schedule 40, 4: Schedule 80]
// Pipe fit tolerance in thousandths
$pfittol = 20; // [0:40]
// Height of the pipe insert
$exten = 1;
// Height of angled part of pilot
$pilotdepth = $exten - .25;
// thickness of rim to hold piece between pipe and fitting
$basethick = .125;
// pilot rim width
$pilotrimwidth = .1;

// pipe data - outside dia, schedule 10, normal, schedule 40, schedule 80 wall thicknesses
$pipedata =  [[ 0.840, 0.083, 0.109, 0.109, 0.147 ],
              [ 1.050, 0.083, 0.113, 0.113, 0.154 ],
              [ 1.315, 0.109, 0.133, 0.133, 0.179 ],
              [ 1.660, 0.109, 0.140, 0.140, 0.191 ],
              [ 1.900, 0.109, 0.145, 0.145, 0.200 ],
              [ 2.375, 0.109, 0.154, 0.154, 0.218 ],
              [ 2.875, 0.120, 0.203, 0.203, 0.276 ],
              [ 3.500, 0.120, 0.216, 0.216, 0.300 ],
              [ 4.500, 0.120, 0.237, 0.237, 0.337 ],
             ];

$fittingdia = $pipedata[ $nompipesize ][ 0 ];
$pipedia = $fittingdia - ( $pipedata[ $nompipesize ][ $schedule ] * 2 ) - 2 * ( $pfittol / 1000 );
echo ("Fitting inner diameter: ", $fittingdia, "  Pipe inner diameter: ", $pipedia);

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
