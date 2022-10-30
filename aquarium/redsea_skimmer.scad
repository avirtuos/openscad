width=145;
depth=80;
height=43;
thickness=5;

//large - 145x43x80
//small - 81x43x100

strain_size=3;
strain_spacing=2;

strain_size_bottom=6;
strain_spacing_bottom=1;

difference(){
    cube([width, depth, height]);
    translate([thickness, thickness, thickness]){
        cube([width-(2*thickness), depth+(2*thickness), height+thickness]);
    }
    
    //side faces
    for (j = [0 : ((height-thickness)/(strain_spacing+strain_size))-1] ){
        for ( i = [0 : ((depth-(2*thickness))/(strain_spacing+strain_size))-1] ){
            translate([ -1, 
                        (thickness+(i*(strain_spacing+strain_size))) , 
                        thickness+(j*(strain_spacing+strain_size))]){
                cube([width+2, strain_size, strain_size]);
            }
        }
    }
    
    //wide face
    for (j = [0 : ((height-thickness)/(strain_spacing+strain_size))-1] ){
        for ( i = [0 : ((width-(2*thickness))/(strain_spacing+strain_size))-1] ){
            translate([(thickness+(i*(strain_spacing+strain_size))) , 
                        -1,
                        thickness+(j*(strain_spacing+strain_size))]){
                cube([strain_size,depth+2, strain_size]);
            }
        }
    }
    
    //bottom face
    for (j = [0 : ((depth-(2*thickness))/(strain_spacing_bottom+strain_size_bottom))-1] ){
        for ( i = [0 : ((width-(2*thickness))/(strain_spacing_bottom+strain_size_bottom))-1] ){
            translate([(thickness+(i*(strain_spacing_bottom+strain_size_bottom))) , 
                        thickness+(j*(strain_spacing_bottom+strain_size_bottom)),
                        -1]){
                cube([strain_size_bottom,strain_size_bottom,height+2]);
            }
        }
    }
}
