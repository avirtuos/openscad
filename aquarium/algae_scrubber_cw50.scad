
_fn=200;

translate([-15,-15,0]){
    difference(){
        union(){
            translate([15,15,30]){
                color("green")
                cylinder(h=35, r1=21/2, r2=21/2, $fn=_fn);

                color("green")
                translate([0,35.7+21,0])
                cylinder(h=35, r1=21/2, r2=21/2, $fn=_fn);
                
                translate([0,21/2,0])
                %cube([5,35.7,5]);
            }

            cube([30,200,30]);
            translate([0,180,0])
            rotate([0,0,45])
            cube([30,100,30]);
        }
     
        
        union(){
            translate([15,15,30]){
                translate([0,0,-5])
                cylinder(h=41, r1=21/2-1.2, r2=21/2-1.2, $fn=_fn);

                translate([0,35.7+21,-5])
                cylinder(h=41, r1=21/2-1.2, r2=21/2-1.2, $fn=_fn);
            }
            
            translate([1,1,1]){
                color("red")
                cube([28,120,28]);
            }
            
            translate([0,180,0]){
                rotate([0,0,45]){
                    translate([1,1,1]){
                        color("blue")
                        cube([28,111,28]);
                    }
                    
                }
            }
        }
    }
    
    
            color("yellow")
            translate([15,0,0])
            cube([3,180,30]);
            color("yellow")
            translate([10,190,00])
            rotate([0,0,45])
            cube([3,100,30]);
}