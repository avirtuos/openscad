use <MCAD/boxes.scad>


empanada_dough_radius=25.4*3;
empanada_press_radius=empanada_dough_radius*1.1;
press_height=25.4*3;




difference(){
    cylinder(h = press_height, r1 = empanada_press_radius, r2 = empanada_press_radius, center = false);

    translate([0,0,-1])
    cylinder(h = press_height*.8, r1 = empanada_press_radius*.9, r2 = empanada_press_radius*.9, center = false);
    translate([0,0,press_height*.25]){
        for(i = [0:3]){
            color("black")
            rotate([90,0,45*i])
            roundedBox([40, press_height*.75,(2*empanada_press_radius)+5],  4, true, $fn=100);
        }
    }
}