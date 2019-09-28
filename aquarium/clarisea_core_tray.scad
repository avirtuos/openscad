
x=25.4*9.25;
y=25.4*9.25;
z=25.4*.3;
cutout_x=176.1;
cutout_y=199;
spill_bar_z=25.4*2;
spill_bar_x=25.4*.25;
spacer_y=18;

difference(){
    union(){
        cube([x,y,z]);
        
        difference(){
        cube([spill_bar_x,y,spill_bar_z]);
        
        translate([-1,0,z])
        color("blue")
        cube([spill_bar_x+2, spacer_y, spill_bar_z]);
        }
    }

    translate([(x-cutout_x)/2,(y-cutout_y)/2,-1])
    color("red")
    cube([cutout_x, cutout_y, z +2]);
}