 
 $fn=100;

 
     translate([3,-100,4])
     rotate([0,90,0])
     connector(69);

     translate([3,-80,4])
     rotate([0,90,0])
     connector(69);
     
     translate([3,-60,4])
     rotate([0,90,0])
     connector(69);
     
     translate([3,-40,4])
     rotate([0,90,0])
     connector(69);
     
     translate([3,-20,4])
     rotate([0,90,0])
     connector(69);
     

     translate([80,-100,4])
     rotate([0,90,0])
     connector(69);

     translate([80,-80,4])
     rotate([0,90,0])
     connector(69);
     
     translate([80,-60,4])
     rotate([0,90,0])
     connector(69);
     
     translate([80,-40,4])
     rotate([0,90,0])
     connector(69);
     
     translate([80,-20,4])
     rotate([0,90,0])
     connector(69);
 
 
     translate([155,-100,4])
     rotate([0,90,0])
     connector(69);

     translate([155,-80,4])
     rotate([0,90,0])
     connector(69);
     
     translate([155,-60,4])
     rotate([0,90,0])
     connector(69);
     
     translate([155,-40,4])
     rotate([0,90,0])
     connector(69);
     
     translate([155,-20,4])
     rotate([0,90,0])
     connector(69);
 
 difference(){
     union(){
         wall(1);
         translate([3*25.4,0,0])
         wall(1);
         translate([6*25.4,0,0])
         wall(1);
         translate([9*25.4,0,0])
         wall(1);
     }
     
     
      translate([0,-100,4])
     rotate([0,90,0])
     cylinder(r1=1.5,r2=1.5,h=231);
     
     
      translate([0,-80,4])
     rotate([0,90,0])
     cylinder(r1=1.5,r2=1.5,h=231);
     
     
      translate([0,-60,4])
     rotate([0,90,0])
     cylinder(r1=1.5,r2=1.5,h=231);
     
     
       translate([0,-40,4])
     rotate([0,90,0])
     cylinder(r1=1.5,r2=1.5,h=231);
     
       translate([0,-20,4])
     rotate([0,90,0])
     cylinder(r1=1.5,r2=1.5,h=231);
 }
 
 module connector(height){
          difference(){
     cylinder(r1=2.5,r2=2.5,h=height);
              translate([0,0,-.1])
     cylinder(r1=1.5,r2=1.5,h=height+3);
     }
 }
 module wall(inlet){
     difference(){
         union(){
             difference(){
                 union(){
                    rotate([90,0,0])
                    cylinder(r1=10,r2=10,h=5*25.4);
                     if(inlet > 0){
                        rotate([90,0,0]) 
                        translate([0,4,(5*25.4) - 12])
                        cylinder(r1=3.5,r2=2,h=40);
                     }
                 }
                 
                 rotate([90,0,0])
                 color("red")
                 translate([0,0,2])
                 cylinder(r1=7.5,r2=7.5,h=(5*25.4) - 4);
                 
                if(inlet > 0){
                    rotate([90,0,0])
                    translate([0,4,5])
                    cylinder(r1=1.5,r2=1.5,h=8*25);
                }
                 
                translate([-25,-7*25.4,-18])
                cube([50,7*25.4,18]);
                 
                 for (i=[0:8]) {
                     color("red")
                    translate([0,5 -13 * i,.1])
                    cylinder(r1=.6,r2=.6,h=13);
                }
            }

            translate([-9.5,-5*25.4,0])
            cube([19,5*25.4,1]);
        }  
    }
}