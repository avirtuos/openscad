//import("DodecahedronTerarium_split_top.stl");


translate([221,229,0]){
    color("red")
    linear_extrude(height=1)
    circle(r=76, $fn=5);
}

difference(){
    translate([221,229,1]){
        color("blue")
        linear_extrude(height=3)
        circle(r=66, $fn=5);
    }


    translate([221,229,.9]){
        color("blue")
        linear_extrude(height=3.2)
        circle(r=65, $fn=5);
    }
}