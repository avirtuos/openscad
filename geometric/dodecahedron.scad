
lattice_thickness=1/8 * 25.4;
radius=4*25.4;





module panel(){
    linear_extrude(height=lattice_thickness){
        difference(){
            circle($fn = 5, r = radius);
            circle($fn = 5, r = radius-lattice_thickness);
        }
    }
}