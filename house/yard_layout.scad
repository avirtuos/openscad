
foot = 25.4*12;

color("green")
cube([foot*50,foot*50,foot]);

//garage
translate([0,foot*26.5,25.4]){
color("white")
cube([foot*5,foot*23.5,foot]);
}

//patio
translate([foot*10,0,25.4]){
color("brown")
cube([foot*30,foot*12,foot]);
}

translate([foot*47,foot*45,0])
cube([foot*3, foot*5, foot*5]);

translate([foot*35,foot*12,0])
color("brown")
cube([foot*3, foot*21, foot*5]);

translate([foot*38,foot*12,0])
color("yellow")
cube([foot*3, foot*20, foot*5]);

translate([foot*41,foot*12,0])
color("cyan")
cube([foot*3, foot*15, foot*5]);

translate([foot*25,foot*38,0])
color("pink")
cube([foot*3, foot*12, foot*5]);
    

translate([foot*29, foot*33,0]){
    
    translate([-foot*6,foot*-13.5, foot])
    color("blue")
    cube([foot*32, foot*32, foot*1.1]);
    
    translate([-foot*6,foot*-10.5, foot])
    color("red")
    cube([foot*29, foot*25.5, foot*1.11]);
    
    translate([0,foot*1, foot])
    color("purple")
    cube([foot*9, foot*9, foot*1.12]);
    
    translate([0,-foot*7, foot])
    color("orange")
    cube([foot*21, foot*24, foot*1.11]);
    
    //slide
    translate([foot*14, -foot*5, foot])
    cube([foot*2,foot*9,foot*5]);
    
    //ladder
    translate([foot*10,0, foot])
    cube([foot*2,foot*4,foot*5]);
    
    //club house
    translate([foot*9, foot*4, foot]){
        cube([foot*9, foot*8,foot*13]);
    }
    //swings
    translate([0,foot*5,foot])
    cube([foot*10, foot,foot*9]);
        translate([0,0,foot])
        cube([foot, foot*12,foot*9]);
   
}