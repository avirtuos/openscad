inner_diameter = 10.6;
outter_diameter= (1.2*2)+inner_diameter;
height=165;

difference(){
cylinder(r1=outter_diameter/2, r2=outter_diameter/2, h=height, $fn=100);
    translate([0,0,-1])
cylinder(r1=inner_diameter/2, r2=inner_diameter/2, h=height+2, $fn=100);
}