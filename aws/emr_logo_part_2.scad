difference(){
    difference(){
        linear_extrude(height = 10)
        import("EMR_logo_pre_processed.dxf");
        translate([0,-10,-10])
        cube([60,300,30]);
    }
    
     translate([0,70,-10])
        cube([300,300,30]);
}