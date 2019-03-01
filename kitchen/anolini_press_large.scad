
anolini_radius=25.4*.4;
anolini_outter_radius=anolini_radius;
press_size=anolini_radius*2*1.5;

union(){
    for (i = [0:5]) {
        translate([0,(press_size-1)*i, 0]){
            for (i = [0:2]) {
                translate([i*(press_size-1),0,0])
                import("anolini_press_v5.stl");
            }
        }
    }
}
