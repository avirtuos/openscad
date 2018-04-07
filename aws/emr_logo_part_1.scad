
union(){
    difference(){
        linear_extrude(height = 10)
        import("EMR_logo_pre_processed.dxf");
        translate([60,-10,-10])
        cube([300,300,30]);
    }
    
    color("blue")
    translate([39.4,65,0])
    cube([.6,15,.6]);
}