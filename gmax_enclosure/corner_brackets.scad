
bracket_thickness=7;
screw_radius=3;
outter_bracket_base_height=2;
bracket_height=180;
bracket_underhang=40;
bracket_width=80;
plexi_thickness=3.4;


!difference(){
    color("blue")
    union(){
        translate([0,0,-bracket_underhang]){
            cube([bracket_thickness,bracket_width,bracket_height]);
            cube([bracket_width,bracket_thickness,bracket_height]);
        }
        cube([bracket_width,35+bracket_thickness,outter_bracket_base_height]);
        cube([35+bracket_thickness,bracket_width,outter_bracket_base_height]);
    }

    translate([29,bracket_width*.7,-10])
    cylinder (h=20, r=screw_radius,$fn=100);

    translate([29,bracket_width*.30,-10])
    cylinder (h=20, r=screw_radius,$fn=100);

    translate([bracket_width*.75,bracket_width*.30,-10])
    cylinder (h=20, r=screw_radius,$fn=100);
    
    

 translate([-10,bracket_width*.30,bracket_height*.1])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([-10,bracket_width*.30,bracket_height*.6])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([-10,bracket_width*.70,bracket_height*.1])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([-10,bracket_width*.70,bracket_height*.6])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);
 
 translate([bracket_width*.30,25,bracket_height*.1])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([bracket_width*.30,bracket_height*.1,bracket_height*.6])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([bracket_width*.70,25,bracket_height*.1])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([bracket_width*.70,bracket_height*.1,bracket_height*.6])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);
 
 
 //Lower Outter Table Holes
 
 translate([bracket_width*.30,25,-(bracket_height*.15)])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);
 
 translate([bracket_width*.70,25,-(bracket_height*.15)])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);
 
 translate([-10,bracket_width*.70,-(bracket_height*.15)])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([-10,bracket_width*.30,-(bracket_height*.15)])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);
 
}




difference(){
    color("red")
    translate([bracket_thickness+plexi_thickness,bracket_thickness+plexi_thickness,outter_bracket_base_height]){
        union(){
            cube([bracket_thickness,bracket_width-bracket_thickness-plexi_thickness,bracket_height-bracket_underhang]);
            cube([bracket_width-bracket_thickness-plexi_thickness,bracket_thickness,bracket_height-bracket_underhang]);
            cube([bracket_width-bracket_thickness-plexi_thickness,35,2]);
            cube([35,bracket_width-bracket_thickness-plexi_thickness,2]);
        }
    }

translate([29,bracket_width*.7,-10])
    cylinder (h=20, r=screw_radius,$fn=100);

    translate([29,bracket_width*.30,-10])
    cylinder (h=20, r=screw_radius,$fn=100);

    translate([bracket_width*.75,bracket_width*.30,-10])
    cylinder (h=20, r=screw_radius,$fn=100);
    
    

 translate([-10,bracket_width*.30,bracket_height*.1])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([-10,bracket_width*.30,bracket_height*.6])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([-10,bracket_width*.70,bracket_height*.1])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([-10,bracket_width*.70,bracket_height*.6])
 rotate([0,90,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([bracket_width*.30,25,bracket_height*.1])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([bracket_width*.30,25,bracket_height*.6])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([bracket_width*.70,25,bracket_height*.1])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);

 translate([bracket_width*.70,25,bracket_height*.6])
 rotate([90,0,0])
 cylinder (h=40, r=screw_radius,$fn=100);
}







