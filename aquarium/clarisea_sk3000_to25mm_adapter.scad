//33.16 clarisea elbow
//25mm drain outter
//33.5mm outter to 19-24 (return line) 20mm deep to 2 inch sleeve

_fn=100;

difference(){
    cylinder(h=30, r1=33.16/2, r2=33.16/2, $fn=_fn);
    translate([0,00,-1]){
        color("green")
        cylinder(h=32, r1=25.6/2, r2=26/2, $fn=_fn);
    }
}

