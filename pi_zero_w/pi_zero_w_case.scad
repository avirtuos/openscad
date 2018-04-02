use <MCAD/boxes.scad>

pi_x=65;
pi_x_pad=4.5;
pi_y=30;
pi_y_pad=1.5;
pi_z=5;
pi_z_pad=2.25;
pi_board_z=1.4;

pi_screw_r=2.75/2;
pi_screw_inset=2.25;

pi_usb_overhang=1.5;
pi_usb_x=8;
pi_usb_y=8;
pi_usb_z=3.1;

pi_hdmi_overhang=1.5;
pi_hdmi_x=11.25;
pi_hdmi_y=8;
pi_hdmi_z=3.6;

pi_cam_overhang=2;
pi_cam_x=12;
pi_cam_y=8;
pi_cam_z=2;

pi_sd_overhang=2.5; 
pi_sd_x=12;
pi_sd_y=8;
pi_sd_z=2;

union(){
    //color("green") cube([pi_x,pi_y,pi_z]);
    /*
     *  PCB Base
     */
    translate([pi_x/2,pi_y/2,pi_z/2]){
        difference(){
            roundedBox([pi_x, pi_y, pi_z], 5, true, $fn=100); 
           
            translate([(pi_x/2)-pi_screw_inset-pi_screw_r,
                        (pi_y/2)-pi_screw_inset-pi_screw_r,
                        -(pi_z/2)-.25]){
                color("cyan")
                cylinder (h=pi_z+.5, r=pi_screw_r,$fn=100);
            }
            
            translate([(pi_x/2)-pi_screw_inset-pi_screw_r,
                       -(pi_y/2)+pi_screw_inset+pi_screw_r,
                       -(pi_z/2)-.25]){
                color("cyan")
                cylinder (h=pi_z+.5, r=pi_screw_r,$fn=100);
            }
            
            translate([(-pi_x/2)+pi_screw_inset+pi_screw_r,
                        (pi_y/2)-pi_screw_inset-pi_screw_r,
                        -(pi_z/2)-.25]){
                color("cyan")
                cylinder (h=2*pi_z+.5, r=pi_screw_r,$fn=100);
            }
        
            translate([(-pi_x/2)+pi_screw_inset+pi_screw_r,
                        -(pi_y/2)+pi_screw_inset+pi_screw_r,
                        -(pi_z/2)-.25]){
                color("cyan")
                cylinder (h=2*pi_z+.5, r=pi_screw_r,$fn=100);
            }
        }
    }


    /*
     *      PORTS
     */
    translate([pi_x-6.75-pi_usb_x,-pi_usb_overhang,pi_board_z]){
        color("red")
        //USB Port 1
        cube([pi_usb_x,pi_usb_y,pi_usb_z]);
        translate([-pi_usb_x-4.55,0,0]){
            color("red")
            //USB Port 2
            cube([pi_usb_x,pi_usb_y,pi_usb_z]);
        }
    }

    translate([6.75,-pi_hdmi_overhang,pi_board_z]){
        color("green")
        //HDMI Port
        cube([pi_hdmi_x,pi_hdmi_y,pi_hdmi_z]);
    }
    
    translate([pi_x+pi_cam_overhang-pi_cam_x,(pi_y-pi_cam_y)/2,pi_board_z]){
        color("blue")
        //Camera Port
        cube([pi_cam_x,pi_cam_y,pi_cam_z]);
    }
    
    translate([-pi_sd_overhang,(pi_y-pi_sd_y)/2,pi_board_z]){
        color("purple")
        //MicroSD Port
        cube([pi_sd_x,pi_sd_y,pi_sd_z]);
    }
}