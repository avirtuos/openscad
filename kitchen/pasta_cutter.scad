
cut_edge=0.5;
cut_girddle=2;
cut_size = 25.4 * 0.5;
press_hieght=25.4*0.4;

rows=14;
columns=6;

side = (2*cut_girddle) + cut_size - cut_edge;
for ( y = [0 : rows-1] ){
    for ( x = [0 : columns-1] ){
        translate([side*x, side*y, 0]){
            single_press();
        }
    }
}


module single_press() {
    union(){
        translate([0,0,press_hieght]){
            difference(){
                cutting_edge_size = (2*cut_girddle)+cut_size ;
                cutting_edge_height = 2;
                cube([cutting_edge_size, 
                      cutting_edge_size, 
                      cutting_edge_height]);
                translate([cut_edge,cut_edge,-1]){
                    cube([cutting_edge_size-(2*cut_edge), 
                          cutting_edge_size-(2*cut_edge), 
                          cutting_edge_height+2]);
                }
            }
        }

        color("red"){
            difference(){
                cube([(2*cut_girddle)+cut_size, (2*cut_girddle)+cut_size, press_hieght]);
                translate([cut_girddle,cut_girddle,-1]){
                    cube([cut_size, cut_size, press_hieght+2]);
                }
                
                translate([cut_size-4.3,cut_size-4.3,-4]){
                    rotate([0,0,45])
                    cylinder(r2=cut_size-2,r1=0, h=press_hieght+5,$fn=4);
                }
            }
        }
    }
}