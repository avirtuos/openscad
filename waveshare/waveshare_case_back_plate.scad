use <MCAD/boxes.scad>
use <virtuoso/utils.scad>

/*
 * settings
 */
 
isDraft = false;

//display_x=170.2;
//display_y=111.2;
//display_z=1;

case_pad_x=3;
case_pad_y=3;
case_pad_z=1;

case_logic_board_x=30;
case_logic_board_overlap_x=30;
case_logic_board_z=17;
logic_bracket_pad=2;

display_view_x=164.5;
display_view_y=99;
display_view_z=1;

display_view_y_top_offset=4;
display_view_y_bottom_offset=11;
display_view_x_left_offset=4;
display_view_x_right_offset=4;


/*
 * Setting Calculations
 */
case_real_x=display_view_x+case_logic_board_x+(2*case_pad_x)+ display_view_x_left_offset + display_view_x_right_offset;
case_real_y=display_view_y+(2*case_pad_y)+ display_view_y_top_offset + display_view_y_bottom_offset;
case_real_z=case_pad_z;

display_real_x = display_view_x + display_view_x_left_offset + display_view_x_left_offset;
display_real_y = display_view_y+ display_view_y_top_offset + display_view_y_bottom_offset;

display_bracket_x = case_real_x - case_logic_board_x;
display_bracket_y = case_real_y;
display_bracket_z = 4;

case_hump_x=case_logic_board_x + case_logic_board_overlap_x + display_view_x_left_offset + display_view_x_left_offset;
case_hump_y=case_real_y;
case_hump_z=case_logic_board_z+case_pad_z;

cover_z=2;
cover_offset_z = case_pad_z + display_bracket_z;

 union(){
    translate([(case_real_x)/2,(case_real_y)/2,(case_real_z)/2]){
      
        //e-ink cover
        color("purple")
        difference(){
            roundedBox([case_real_x, case_real_y, case_real_z],  5, true, $fn=100);
                
            translate([case_real_x/2 - case_hump_x/2 + logic_bracket_pad,0,0]) 
            roundedBox([case_hump_x+logic_bracket_pad, case_hump_y, cover_z],  5, true, $fn=100);
            
            //Display Fasteners & Cover Screw Plates
            translate([-(case_real_x)/2 + 3,-(case_real_y)/2 + display_bracket_y*.25, 0])
            screw_plate_hole(5,1,10, $fn=100);
            
            translate([-(case_real_x)/2 + 3,-(case_real_y)/2 + display_bracket_y*.75, 0])
            screw_plate_hole(5,1,10, $fn=100);
            
            translate([-(case_real_x)/2 + display_bracket_x*.25, -(case_real_y)/2 + 3,0])
            screw_plate_hole(5,1,10, $fn=100);
            
            translate([-(case_real_x)/2 + display_bracket_x*.75, -(case_real_y)/2 + 3, 0])
            screw_plate_hole(5,1,10, $fn=100);
        }
            

        
        //logic board hump cover
        color("yellow")
        translate([(case_real_x-case_hump_x)/2,0,(case_real_z+case_hump_z-cover_offset_z)/2]){
     
            difference(){
                translate([0,0,cover_offset_z+cover_z]) roundedBox([case_hump_x, case_hump_y, cover_z],  5, true, $fn=100);
            
                translate([case_logic_board_overlap_x-7,case_hump_y/2-3-logic_bracket_pad,case_hump_z/2-2])  screw_plate_hole(5,1,10, $fn=100);
                translate([case_logic_board_overlap_x-7,-case_hump_y/2+logic_bracket_pad/2,case_hump_z/2-2])  screw_plate_hole(5,1,10, $fn=100);
                translate([-case_logic_board_overlap_x,case_hump_y/2-3-logic_bracket_pad,case_hump_z/2-2])  screw_plate_hole(5,1,10, $fn=100);
                translate([-case_logic_board_overlap_x,-case_hump_y/2+logic_bracket_pad/2,case_hump_z/2-2])  screw_plate_hole(5,1,10, $fn=100);

            }

            //logic board hump cover
            difference(){
                roundedBox([case_hump_x, case_hump_y, case_hump_z-cover_offset_z],  5, true, $fn=100);
                translate([+10,0,0]){
                    
                    roundedBox([case_hump_x-logic_bracket_pad+20, 
                                case_hump_y-logic_bracket_pad+20, 
                                case_hump_z+10],  5, true, $fn=100);
                }
            }
        }
    }
}