//Frontplatte Spotwelder

//rounds complexity
$fn = 100;

//Margin
margin = 0.0;

//dimension of the hole plate
Length          = 210.5;
Width           = 130;

// LCD measurements
LCD_holes_dia   = 3.2 + margin;
LCD_holes_wd    = 0;
LCD_length      = 32.5;
LCD_width       = 14 ;
LCD_fillet      = 1.9 + margin;

//distance of LCD from the edges
LCD_or_left     = 40;
LCD_or_down     = 55;

//placement of the LCD holes
LCD_h1_left     = LCD_or_left+((LCD_length/2)-(29/2));
LCD_h1_down     = LCD_or_down-16.25;
LCD_h2_left     = 29 + LCD_h1_left;
LCD_h2_down     = LCD_h1_down;
LCD_h3_left     = LCD_h1_left;
LCD_h3_down     = LCD_or_down+LCD_width+3.75;
LCD_h4_left     = LCD_h2_left;
LCD_h4_down     = LCD_h3_down;


//potis
pot_dia         = 7;
//dist to LCD upper holes
pot_dist_down   = 15;
pot_dist_btwn   = 20;
pot_dist_left   = LCD_or_left+((LCD_length/2)-(pot_dist_btwn/2));
pot_dist_down_total = pot_dist_down + LCD_h3_down;


//LEDS
LED_dia       = 6.2;
LED_dist_btwn = 20;

LED_down1   = 30;
LED_down2   = LED_down1+LED_dist_btwn;
LED_down3   = LED_down2+LED_dist_btwn;
LED_down4   = LED_down3+LED_dist_btwn;

LED_left    = 110;

//Power

power_dia = 12;
power_down = 95;
power_left = 180;


//LCD text
LCD_text1_left = pot_dist_left;
LCD_text1_down = pot_dist_down_total +12;
text1_str = "Zeit";

LCD_text2_left = pot_dist_btwn + pot_dist_left;
LCD_text2_down = pot_dist_down_total +12;
text2_str = "Strom";

//LED text
dist2LED  = 7;

LED_text1_left = LED_left + dist2LED;
LED_text1_down = LED_down1;
LED_text1_str = "Trigger";

LED_text2_left = LED_left+ dist2LED;
LED_text2_down = LED_down2;
LED_text2_str = "Pedal";

LED_text3_left = LED_left+ dist2LED;
LED_text3_down = LED_down3;
LED_text3_str = "Status";

LED_text4_left = LED_left+ dist2LED;
LED_text4_down = LED_down4;
LED_text4_str = "Power";


//power text

pow_dist = 20;
pow_marg = 10;

pow_text1_left = power_left-pow_marg;
pow_text1_down = power_down-pow_dist/2;
pow_text1_str = "Aus";

pow_text2_left = power_left-pow_marg;
pow_text2_down = power_down+pow_dist/2;
pow_text2_str = "Ein";



difference(){
  
  //baseplate
  square([Length,Width],false);
  
  //LCD
  translate([LCD_or_left,LCD_or_down])
  difference(){
    square([LCD_length,LCD_width],false);
    translate([(LCD_length/2)-(LCD_fillet/2),0])
      square([LCD_fillet,LCD_width]);
  }
  
  //LCD mounting holes
  translate([LCD_h1_left,LCD_h1_down])
    circle(d=LCD_holes_dia);  
  translate([LCD_h2_left,LCD_h2_down])
    circle(d=LCD_holes_dia);  
  translate([LCD_h3_left,LCD_h3_down])
    circle(d=LCD_holes_dia);  
  translate([LCD_h4_left,LCD_h4_down])
    circle(d=LCD_holes_dia);
  //LCD text
  translate([LCD_text1_left,LCD_text1_down])
    text(text1_str, 5,halign="center");
  translate([LCD_text2_left,LCD_text2_down])
    text(text2_str, 5,halign="center");
  
  //Pots
  translate([pot_dist_left,pot_dist_down_total])
    circle(d=pot_dia);  
  translate([pot_dist_left+pot_dist_btwn,pot_dist_down_total])
    circle(d=pot_dia);
  
  
  //LED
  translate([LED_left,LED_down1])
    circle(d=pot_dia);  
  translate([LED_left,LED_down2])
    circle(d=pot_dia);  
  translate([LED_left,LED_down3])
    circle(d=pot_dia);
  translate([LED_left,LED_down4])
    circle(d=pot_dia);
   //LED text
    translate([LED_text1_left,LED_text1_down])
    text(LED_text1_str, 5,halign="left",valign="center");
     translate([LED_text2_left,LED_text2_down])
    text(LED_text2_str, 5,halign="left",valign="center");
     translate([LED_text3_left,LED_text3_down])
    text(LED_text3_str, 5,halign="left",valign="center");
     translate([LED_text4_left,LED_text4_down])
    text(LED_text4_str, 5,halign="left",valign="center");
    
    
  
  //power
    translate([power_left,power_down])
    circle(d=power_dia);
  
  //power text
   translate([pow_text1_left,pow_text1_down])
    text(pow_text1_str, 5,halign="right",valign="center");
   translate([pow_text1_left,pow_text2_down])
    text(pow_text2_str, 5,halign="right",valign="center");

  
    
}