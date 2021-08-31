
_fn=100;

difference(){
    union(){
        cylinder(h=20, r1=33.5/2, r2=33.5/2,$fn=_fn);
        translate([0,0,20]){
            color("red")
            cylinder(h=25.4*2, r1=24/2, r2=19/2,$fn=_fn);
        }
    }


    translate([0,0,-.1]){
        color("green")
        cylinder(h=25.4*3, r1=19/2-1, r2=19/2-1,$fn=_fn);
    }
}