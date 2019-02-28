vent_width=5;
vent_spacing=10;
vent_height=60;


difference(){
    import("espressobin_1.stl");
    
    color("purple")
    for(vent = [0 : 1 : 9]){
        translate([(vent_spacing * vent)-48, -26, 0])
        cube([vent_width, vent_height, 35]);
    }
    
    color("purple")
    translate([50, -22, 0])
    cube([10, vent_height-10, 15]);
}