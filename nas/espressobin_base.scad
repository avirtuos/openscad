

union() {

    translate([15,27.5,20]) {
        import("Espressobin_HDD.stl");
    }

    difference(){
        translate([0,0,0]) {
            color("purple")
            cube([130,130,3]);
        }
     
        translate([65,65,0]) {
          cylinder(h=20, r1 = 60, r2 = 60, center = true);
        }
        
            translate([117,117,0]) {
          color("red")
          cylinder(h=20, r1 = 2.5, r2 = 2.5, center = true);
        }
        
        translate([15,117,0]) {
          color("red")
            cylinder(h=20, r1 = 2.5, r2 = 2.5, center = true);
        }
        
        translate([15,15,0]) {
          color("red")
           cylinder(h=20, r1 = 2.5, r2 = 2.5, center = true);
        }
        
        translate([117,15,0]) {
          color("red")
           cylinder(h=20, r1 = 2.5, r2 = 2.5, center = true);
        }
    }

    translate([15,30,0]) {
         color("red")
     cylinder(h=20, r1 = 3, r2 = 3, center = false);
    }

    translate([15,100,0]) {
         color("red")
     cylinder(h=20, r1 = 3, r2 = 3, center = false);
    }

    translate([115,30,0]) {
         color("red")
     cylinder(h=20, r1 = 3, r2 = 3, center = false);
    }

    translate([115,100,0]) {
         color("red")
     cylinder(h=20, r1 = 3, r2 = 3, center = false);
    }
}