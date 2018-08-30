
raddurchmesser=12;
radinnendurchmesser=11.8;
achsendurchmesser=1.3;
laufkranzdicke = 1;
laufkranzhoehe = 1.3;
radgesamthoehe = laufkranzhoehe*2 + raddurchmesser;
radabstand = 14;
laufflaeche=2;
spiel=1;
$fn=100;
module rad()
{
    union()
    {
        //union(){
        cylinder(d=radgesamthoehe+spiel,h=spiel);
        translate([0,0,spiel]) cylinder(d1=radgesamthoehe+spiel,d2=raddurchmesser+spiel,h=laufkranzdicke);
        translate([0,0,laufkranzdicke+spiel]) cylinder(d1=raddurchmesser+spiel,d2=radinnendurchmesser+spiel,h=laufflaeche+spiel);
        //cylinder(d=3.2,h=18);
    }

}

module achse()
{
   translate([0,(radabstand-spiel)/2,0])rotate([90,0,0])cylinder(d=achsendurchmesser,h=radabstand);
   translate([0,-(radabstand-spiel)/2,0])rotate([90,0,0])rad();
   translate([0,radabstand/2,0])rotate([-90,0,0])rad();
   
}
ueberstand=2;
difference()
{
   union()
    {
        translate([-radgesamthoehe/2,-13,0])
        {
            translate([-ueberstand,-ueberstand,2])
            {
                cube([38+radgesamthoehe+2*ueberstand,26+ueberstand*2,radgesamthoehe/4-2]);
            }
            cube([36+radgesamthoehe,26,radgesamthoehe/4]);
        }

    };
translate([0,0,radgesamthoehe/2]){
  achse();
}
translate([36,0,radgesamthoehe/2]){
   achse();
}

}
