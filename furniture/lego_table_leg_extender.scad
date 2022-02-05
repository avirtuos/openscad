leg_x = 43;
leg_y = 43;
extender_thickness = 10;
extender_overlap = 3 * 25.4;
extender_z = extender_overlap + (4.5 * 25.4);


echo(extender_z);

difference() {
    cube([leg_x + extender_thickness, leg_y + extender_thickness, extender_z]);
    translate([extender_thickness/2, extender_thickness/2, extender_z - extender_overlap]){
        color("red")
        cube([leg_x+.5, leg_y+.5, extender_z]);
    }
}