
difference(){
    scale([0.35, 0.35,1])
    linear_extrude(height = 3)
    import("EMR_keychain_pre_processed.dxf");

    color("red")
    translate([1.5,21.5,1])
    linear_extrude(height = 3)
    scale([1.05, 1.05, 1])
    text("EMR", size=5, font="Liberation Sans:style=Bold");
    
    translate([2.5,30.5,-1])
    cylinder(r=1.25, h=5, $fn=100);
}

translate([16,5,0])
linear_extrude(height = 2.2)
rotate([0,180,0])
scale([1, 1, 1])
text("EMR", size=5, font="Liberation Sans:style=Bold");