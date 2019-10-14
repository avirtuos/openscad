

/*
Top Cube: 16"w x 11.75"d x 8"h
Middle Cubes (x4): 12.5"w x 11.75"d x 12.5”h.  ->.   
Bottom Cubes (x2): 9.75"w x 11.75"d x 13.75"h ->. 273mm (w) x 323mm (d) x 350mm (h)
*/

/* FULL
bookcase_wall_thickness=25.4*.50;
bookcase_depth=25.4*12;
bookcase_cube_width=25.4*9.75;
bookcase_cube_height=25.4*13.75;    
*/

scale_factor = 1;

wiring_conduit_r=6.5* scale_factor;
light_width=11* scale_factor;
light_depth=5* scale_factor;

bookcase_wall_thickness=25.4*.60;
bookcase_depth=25.4*12 * scale_factor;
bookcase_cube_width=25.4*9.75 * scale_factor;
bookcase_cube_height=25.4*13.75 * scale_factor;

L2_bookcase_wall_thickness=25.4*.60;
L2_bookcase_depth=25.4*12 * scale_factor;
L2_bookcase_cube_width=25.4*12.5 * scale_factor;
L2_bookcase_cube_height=25.4*12.5 * scale_factor;

//1 - bottom left
//2 - bottom right
//3 - Middle 1 Left
//4 - Middle 1 Right
//5 - Top 1 Right
//6 - Top 1 Left

part=6;

middle_offset = -1*(2*(L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness))/2) + bookcase_cube_width+(2*bookcase_wall_thickness);
        

difference(){
    union(){ 
        //bottom left cube 
        if(part == 1 || part == 0){
            difference(){
                color("green")
                cube([bookcase_cube_width+(2*bookcase_wall_thickness),
                      bookcase_depth + bookcase_wall_thickness,
                      bookcase_cube_height +(2*bookcase_wall_thickness)]);
                                  
                translate([bookcase_wall_thickness,-.1,bookcase_wall_thickness])
                color("white") 
                cube([bookcase_cube_width,
                      bookcase_depth,
                      bookcase_cube_height]);
                
                t_thickenss_dif = (bookcase_wall_thickness - light_width)/2;
                color("red")
                //Left
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        bookcase_cube_height+(2*(bookcase_wall_thickness-t_thickenss_dif))]);

                //Bottom
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([bookcase_cube_width+(2*(bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                
                //Right
                translate([t_thickenss_dif+bookcase_cube_width+bookcase_wall_thickness,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        bookcase_cube_height+(2*(bookcase_wall_thickness-t_thickenss_dif))]);
                        
                //Top
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif+bookcase_cube_height+bookcase_wall_thickness])
                cube([bookcase_cube_width+(2*(bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                        
                 
                 t2_thickenss_dif=bookcase_wall_thickness-(2*wiring_conduit_r);
                 //Bottom-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=bookcase_depth*1.2);
                 
                  //Bottom-Right
                 translate([wiring_conduit_r+bookcase_cube_width+bookcase_wall_thickness,
                            bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=bookcase_depth*1.2);
                 
                  //Top-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            bookcase_depth*1.1,
                            wiring_conduit_r+bookcase_cube_height+bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=bookcase_depth*1.2);
                 
                  //Top-Right
                 translate([wiring_conduit_r+bookcase_cube_width+bookcase_wall_thickness,
                            bookcase_depth*1.1,
                            wiring_conduit_r+bookcase_cube_height+bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=bookcase_depth*1.2);
            }
        }

        //bottom right cube 
        if(part == 2 || part == 0){
            translate([bookcase_cube_width+(2*bookcase_wall_thickness),0,0])
            difference(){
                color("blue")
                cube([bookcase_cube_width+(2*bookcase_wall_thickness),
                      bookcase_depth + bookcase_wall_thickness,
                      bookcase_cube_height +(2*bookcase_wall_thickness)]);
                                  
                translate([bookcase_wall_thickness,-.1,bookcase_wall_thickness])
                color("white") 
                cube([bookcase_cube_width,
                      bookcase_depth,
                      bookcase_cube_height]);
                
                t_thickenss_dif = (bookcase_wall_thickness - light_width)/2;
                color("red")
                //Left
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        bookcase_cube_height+(2*(bookcase_wall_thickness-t_thickenss_dif))]);

                //Bottom
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([bookcase_cube_width+(2*(bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                
                //Right
                translate([t_thickenss_dif+bookcase_cube_width+bookcase_wall_thickness,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        bookcase_cube_height+(2*(bookcase_wall_thickness-t_thickenss_dif))]);
                        
                //Top
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif+bookcase_cube_height+bookcase_wall_thickness])
                cube([bookcase_cube_width+(2*(bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                        
                 
                 t2_thickenss_dif=bookcase_wall_thickness-(2*wiring_conduit_r);
                 //Bottom-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=bookcase_depth*1.2);
                 
                  //Bottom-Right
                 translate([wiring_conduit_r+bookcase_cube_width+bookcase_wall_thickness,
                            bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=bookcase_depth*1.2);
                 
                  //Top-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            bookcase_depth*1.1,
                            wiring_conduit_r+bookcase_cube_height+bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=bookcase_depth*1.2);
                 
                  //Top-Right
                 translate([wiring_conduit_r+bookcase_cube_width+bookcase_wall_thickness,
                            bookcase_depth*1.1,
                            wiring_conduit_r+bookcase_cube_height+bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=bookcase_depth*1.2);
            }
        }
        
        //middle left cube 
        if(part == 3 || part == 0){
            translate([middle_offset,0, bookcase_cube_height +(2*bookcase_wall_thickness)])
            difference(){
                color("purple")
                cube([L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness),
                      L2_bookcase_depth + L2_bookcase_wall_thickness,
                      L2_bookcase_cube_height +(2*L2_bookcase_wall_thickness)]);
                                  
                translate([L2_bookcase_wall_thickness,-.1,L2_bookcase_wall_thickness])
                color("white") 
                cube([L2_bookcase_cube_width,
                      L2_bookcase_depth,
                      L2_bookcase_cube_height]);
                
                
                t_thickenss_dif = (L2_bookcase_wall_thickness - light_width)/2;
                color("red")
                //Left
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        L2_bookcase_cube_height+(2*(L2_bookcase_wall_thickness-t_thickenss_dif))]);

                //Bottom
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([L2_bookcase_cube_width+(2*(L2_bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                
                //Right
                translate([t_thickenss_dif+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        L2_bookcase_cube_height+(2*(L2_bookcase_wall_thickness-t_thickenss_dif))]);
                        
                //Top
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif+L2_bookcase_cube_height+L2_bookcase_wall_thickness])
                cube([L2_bookcase_cube_width+(2*(L2_bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                        
                 
                 t2_thickenss_dif=L2_bookcase_wall_thickness-(2*wiring_conduit_r);
                 //Bottom-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Bottom-Right
                 translate([wiring_conduit_r+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Top-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+L2_bookcase_cube_height+L2_bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Top-Right
                 translate([wiring_conduit_r+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+L2_bookcase_cube_height+bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
            }
        }
        
        //middle right cube 
        if(part == 4 || part == 0){
            translate([middle_offset+L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness),0, bookcase_cube_height +(2*bookcase_wall_thickness)])
            difference(){
                color("purple")
                cube([L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness),
                      L2_bookcase_depth + L2_bookcase_wall_thickness,
                      L2_bookcase_cube_height +(2*L2_bookcase_wall_thickness)]);
                                  
                translate([L2_bookcase_wall_thickness,-.1,L2_bookcase_wall_thickness])
                color("white") 
                cube([L2_bookcase_cube_width,
                      L2_bookcase_depth,
                      L2_bookcase_cube_height]);
                
                
                t_thickenss_dif = (L2_bookcase_wall_thickness - light_width)/2;
                color("red")
                //Left
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        L2_bookcase_cube_height+(2*(L2_bookcase_wall_thickness-t_thickenss_dif))]);

                //Bottom
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([L2_bookcase_cube_width+(2*(L2_bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                
                //Right
                translate([t_thickenss_dif+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        L2_bookcase_cube_height+(2*(L2_bookcase_wall_thickness-t_thickenss_dif))]);
                        
                //Top
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif+L2_bookcase_cube_height+L2_bookcase_wall_thickness])
                cube([L2_bookcase_cube_width+(2*(L2_bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                        
                 
                 t2_thickenss_dif=L2_bookcase_wall_thickness-(2*wiring_conduit_r);
                 //Bottom-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Bottom-Right
                 translate([wiring_conduit_r+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Top-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+L2_bookcase_cube_height+L2_bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Top-Right
                 translate([wiring_conduit_r+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+L2_bookcase_cube_height+bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
            }
        }


        //top right cube 
        if(part == 5 || part == 0){
            translate([middle_offset+L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness),0, bookcase_cube_height +(4*bookcase_wall_thickness) + L2_bookcase_cube_height])
            difference(){
                color("purple")
                cube([L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness),
                      L2_bookcase_depth + L2_bookcase_wall_thickness,
                      L2_bookcase_cube_height +(2*L2_bookcase_wall_thickness)]);
                                  
                translate([L2_bookcase_wall_thickness,-.1,L2_bookcase_wall_thickness])
                color("white") 
                cube([L2_bookcase_cube_width,
                      L2_bookcase_depth,
                      L2_bookcase_cube_height]);
                
                
                t_thickenss_dif = (L2_bookcase_wall_thickness - light_width)/2;
                color("red")
                //Left
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        L2_bookcase_cube_height+(2*(L2_bookcase_wall_thickness-t_thickenss_dif))]);

                //Bottom
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([L2_bookcase_cube_width+(2*(L2_bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                
                //Right
                translate([t_thickenss_dif+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        L2_bookcase_cube_height+(2*(L2_bookcase_wall_thickness-t_thickenss_dif))]);
                        
                //Top
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif+L2_bookcase_cube_height+L2_bookcase_wall_thickness])
                cube([L2_bookcase_cube_width+(2*(L2_bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                        
                 
                 t2_thickenss_dif=L2_bookcase_wall_thickness-(2*wiring_conduit_r);
                 //Bottom-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Bottom-Right
                 translate([wiring_conduit_r+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Top-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+L2_bookcase_cube_height+L2_bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Top-Right
                 translate([wiring_conduit_r+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+L2_bookcase_cube_height+bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
            }
        }
        
        
        //middle left cube 
        if(part == 6 || part == 0){
            translate([middle_offset,0, bookcase_cube_height +(4*bookcase_wall_thickness) + L2_bookcase_cube_height])
            difference(){
                color("purple")
                cube([L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness),
                      L2_bookcase_depth + L2_bookcase_wall_thickness,
                      L2_bookcase_cube_height +(2*L2_bookcase_wall_thickness)]);
                                  
                translate([L2_bookcase_wall_thickness,-.1,L2_bookcase_wall_thickness])
                color("white") 
                cube([L2_bookcase_cube_width,
                      L2_bookcase_depth,
                      L2_bookcase_cube_height]);
                
                
                t_thickenss_dif = (L2_bookcase_wall_thickness - light_width)/2;
                color("red")
                //Left
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        L2_bookcase_cube_height+(2*(L2_bookcase_wall_thickness-t_thickenss_dif))]);

                //Bottom
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif])
                cube([L2_bookcase_cube_width+(2*(L2_bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                
                //Right
                translate([t_thickenss_dif+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            -.1,
                           t_thickenss_dif])
                cube([light_width,
                        light_depth+.1,
                        L2_bookcase_cube_height+(2*(L2_bookcase_wall_thickness-t_thickenss_dif))]);
                        
                //Top
                translate([t_thickenss_dif,
                            -.1,
                           t_thickenss_dif+L2_bookcase_cube_height+L2_bookcase_wall_thickness])
                cube([L2_bookcase_cube_width+(2*(L2_bookcase_wall_thickness-t_thickenss_dif)),
                        light_depth+.1,
                        light_width]);
                        
                 
                 t2_thickenss_dif=L2_bookcase_wall_thickness-(2*wiring_conduit_r);
                 //Bottom-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Bottom-Right
                 translate([wiring_conduit_r+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+t2_thickenss_dif])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Top-Left
                 translate([wiring_conduit_r+t2_thickenss_dif,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+L2_bookcase_cube_height+L2_bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
                 
                  //Top-Right
                 translate([wiring_conduit_r+L2_bookcase_cube_width+L2_bookcase_wall_thickness,
                            L2_bookcase_depth*1.1,
                            wiring_conduit_r+L2_bookcase_cube_height+bookcase_wall_thickness])
                 rotate([90,0,0])
                 cylinder(r1=wiring_conduit_r,r2=wiring_conduit_r,h=L2_bookcase_depth*1.2);
            }
        }
        
    }
    
    //Bottom Left
    side_connector(bookcase_cube_width+bookcase_wall_thickness,
                   0,
                   0,
                   bookcase_depth + bookcase_wall_thickness,
                   bookcase_cube_height +(2*bookcase_wall_thickness));
    
    //bottom left
    top_connector(0,
                   0,
                   bookcase_cube_height +bookcase_wall_thickness,
                   bookcase_cube_width+(2*bookcase_wall_thickness),
                   bookcase_depth + bookcase_wall_thickness);
    
    //bottom right
    top_connector(bookcase_cube_width+(2*bookcase_wall_thickness),
                   0,
                   bookcase_cube_height +bookcase_wall_thickness,
                   bookcase_cube_width+(2*bookcase_wall_thickness),
                   bookcase_depth + bookcase_wall_thickness);
                   
    //middle left
    L2_z = bookcase_cube_height+(2*bookcase_wall_thickness);
    side_connector(L2_bookcase_cube_width+L2_bookcase_wall_thickness+middle_offset,
                   0,
                   L2_z,
                   L2_bookcase_depth + L2_bookcase_wall_thickness,
                   L2_bookcase_cube_height +(2*L2_bookcase_wall_thickness));
                   
    //middle left
    top_connector(middle_offset,
                   0,
                   L2_z+L2_bookcase_cube_height + L2_bookcase_wall_thickness,
                   L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness),
                   L2_bookcase_depth + L2_bookcase_wall_thickness);

    //middle right
    top_connector(L2_bookcase_cube_width+2*L2_bookcase_wall_thickness+middle_offset,
                   0,
                   L2_z+L2_bookcase_cube_height + L2_bookcase_wall_thickness,
                   L2_bookcase_cube_width+(2*L2_bookcase_wall_thickness),
                   L2_bookcase_depth + L2_bookcase_wall_thickness);
                   
    //Top left
    L3_z = bookcase_cube_height+(2*bookcase_wall_thickness) + L2_bookcase_cube_height;
    side_connector(L2_bookcase_cube_width+L2_bookcase_wall_thickness+middle_offset,
                   0,
                   L3_z,
                   L2_bookcase_depth + L2_bookcase_wall_thickness,
                   L2_bookcase_cube_height +(2*L2_bookcase_wall_thickness));
                   
}


module side_connector(x_offset, y_offset, z_offset, y_size, z_size){
    translate([x_offset-.01
                ,y_offset+(y_size/3)
                ,z_offset+(z_size/4)])
    rotate([0,90,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");
    
    translate([x_offset-.01
                ,y_offset+(2*y_size/3)
                ,z_offset+(z_size/4)])
    rotate([0,90,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");
    
    translate([x_offset-.01
                ,y_offset+(y_size/3)
                ,z_offset+(3*z_size/4)])
    rotate([0,90,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");
    
    translate([x_offset-.01
                ,y_offset+(2*y_size/3)
                ,z_offset+(3*z_size/4)])
    rotate([0,90,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");
}



module top_connector(x_offset, y_offset, z_offset, x_size, y_size){
    translate([x_offset + x_size/4,
               y_offset +(y_size/3),
               z_offset - .01])
    rotate([0,0,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");
    
    translate([x_offset + 2*(x_size/4),
               y_offset +(y_size/3),
               z_offset - .01])
    rotate([0,0,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");

    translate([x_offset + 3*(x_size/4),
               y_offset +(y_size/3),
               z_offset - .01])
    rotate([0,0,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");
    
    translate([x_offset + x_size/4,
               y_offset +(2*y_size/3),
               z_offset - .01])
    rotate([0,0,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");
    
    translate([x_offset + 2*(x_size/4),
               y_offset +(2*y_size/3),
               z_offset - .01])
    rotate([0,0,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");

    translate([x_offset + 3*(x_size/4),
               y_offset +(2*y_size/3),
               z_offset - .01])
    rotate([0,0,0])
    scale([1.05,1,1.05])
    #import("Nut_Job.stl");
}