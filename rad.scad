
raddurchmesser=12;
radinnendurchmesser=11.8;
achsendurchmesser=1.3;
laufkranzdicke = 1;
laufkranzhoehe = 1.3;
radgesamthoehe = laufkranzhoehe*2 + raddurchmesser;
radabstand = 14;
laufflaeche=2;
$fn=100;
module rad()
{
    union()
    {
        //union(){
        cylinder(d1=radgesamthoehe,d2=raddurchmesser,h=laufkranzdicke);
        translate([0,0,laufkranzdicke]) cylinder(d1=raddurchmesser,d2=radinnendurchmesser,h=laufflaeche);
        //cylinder(d=3.2,h=18);
    }

}

module achse()
{
   translate([0,radabstand/2,0])rotate([90,0,0])cylinder(d=achsendurchmesser,h=radabstand);
   translate([0,-radabstand/2,0])rotate([90,0,0])rad();
   translate([0,radabstand/2,0])rotate([-90,0,0])rad();
   
}
ueberstand=2;
difference()
{
   union()
    {
        translate([-radgesamthoehe/2,-12,0])
        {
            translate([-ueberstand,-ueberstand,2])
            {
                cube([38+radgesamthoehe+2*ueberstand,24+ueberstand*2,radgesamthoehe/4-2]);
            }
            cube([36+radgesamthoehe,24,radgesamthoehe/4]);
        }

    };
translate([0,0,radgesamthoehe/2]){
  achse();
}
translate([36,0,radgesamthoehe/2]){
   achse();
}

}
