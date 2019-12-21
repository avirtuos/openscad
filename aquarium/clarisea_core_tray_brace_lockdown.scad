
screw_guide=10;
brace_lock_down_y=25.4;
brace_lock_down_x=25.4*.25;
brace_lock_down_z=25.4*1.25;


latch_x=2;
latch_z=25.4*1.25;

cube([brace_lock_down_x, brace_lock_down_y, brace_lock_down_z]);
translate([brace_lock_down_x-2,0,brace_lock_down_z]){
    difference(){
        color("green")
        cube([latch_x, brace_lock_down_y, latch_z]);
        
        translate([-1,brace_lock_down_y/2 - screw_guide/2, latch_z - 25.4*.5])
        color("red")
        cube([latch_x+2, screw_guide, 25.4*.5+1]);
    }

}