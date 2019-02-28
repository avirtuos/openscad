
fan_x=120;
fan_y=120;

brace_z=7;
brace_y_offset = 125;
brace_x= 2 * fan_x + 3*brace_z;
brace_y = fan_y + 15;

brace_base=50;


difference(){
    
    union(){

        difference(){
            color("purple")
            cube([brace_x,1.5*brace_base,brace_z/2]);
            for(vent = [0 : 1 : 11]){
                translate([ 138 + 10 * vent ,brace_z + 10, -5])
                cube([5, brace_base, 2 * brace_z]);
            }
        }
            
        difference(){
            color("red")
            cube([brace_x,brace_z, 100]);
            for(vent = [0 : 1 : 11]){
                translate([ 138 + 10 * vent ,-5 , brace_z+3])
                cube([5,2 * brace_z, fan_y/1.5]);
            }
        }


        rotate([-10,0,0]){
            translate([0,-22,-5])
            translate([0,0,brace_y_offset]) {
                union(){
                    translate([35,0,5]){
                        rotate([270, 180, 0]) {
                            difference(){
                                cube([30,30,7]);
                                translate([0,0,-5])
                                rotate([0,0,45])
                                cube([60,60,14]);
                            }
                        }
                    }
                    
                    translate([35,7,125]){
                        rotate([90, 180, 0]) {
                            difference(){
                                cube([30,30,7]);
                                translate([0,0,-5])
                                rotate([0,0,45])
                                cube([60,60,14]);
                            }
                        }
                    }
                    
                    translate([98,0,125]){
                        rotate([270, 0, 0]) {
                            difference(){
                                cube([30,30,7]);
                                translate([0,0,-5])
                                rotate([0,0,45])
                                cube([60,60,14]);
                            }
                        }
                    }
                    
                    translate([98,7,5]){
                        rotate([90, 0, 0]) {
                            difference(){
                                cube([30,30,7]);
                                translate([0,0,-5])
                                rotate([0,0,45])
                                cube([60,60,14]);
                            }
                        }
                    }
                    
                    
                    translate([225,0,125]){
                        rotate([270, 0, 0]) {
                            difference(){
                                cube([30,30,7]);
                                translate([0,0,-5])
                                rotate([0,0,45])
                                cube([60,60,14]);
                            }
                        }
                    }
                    
                    translate([225,7,5]){
                        rotate([90, 0, 0]) {
                            difference(){
                                cube([30,30,7]);
                                translate([0,0,-5])
                                rotate([0,0,45])
                                cube([60,60,14]);
                            }
                        }
                    }
                    
                    translate([163,0,5]){
                        rotate([270, 180, 0]) {
                            difference(){
                                cube([30,30,7]);
                                translate([0,0,-5])
                                rotate([0,0,45])
                                cube([60,60,14]);
                            }
                        }
                    }
                    
                    translate([163,7,125]){
                        rotate([90, 180, 0]) {
                            difference(){
                                cube([30,30,7]);
                                translate([0,0,-5])
                                rotate([0,0,45])
                                cube([60,60,14]);
                            }
                        }
                    }
                    
                    
                    difference(){
                        color("blue")
                        cube([brace_x,brace_z, brace_y]);

                        color("green")
                        translate([brace_z,-20,5]) 
                        cube([fan_x,60, 120]);
                        
                        color("green")
                        translate([fan_x+ (2*brace_z),-20,5]) 
                        cube([fan_x,60, 120]);
                    }
                }
            }
        }
    }
    
    translate([-170,-100,-6])
    cube([300,300, 300]);
    
    translate([-10,-100,120])
    cube([400,300, 300]);
}