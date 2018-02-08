// Module for extracting a set of waypoints for guiding souls

//////////////////////////////////////////////////////////

// Malleable Global Variables

int seconds_to_display_for = 30;

///////////////////////////////////////////////

// Fixed Global Variables

int time;

int i_DEBUG = 0;


float frame_rate = 60.;
float dt = 1./frame_rate;

MessageDisplayer z_display;
MessageDisplayer t_display;

///////////////////////////////////////////////////////

void setup() {
  size(1200, 700);
  frameRate(frame_rate);
  colorMode(RGB, 100);

  textAlign( LEFT );
  textSize( 18 );

  time = get_current_second();
  
  z_display = new MessageDisplayer( "../../z_messages_texts.csv", "../../z_messages_seconds.csv" );
  t_display = new MessageDisplayer( "../../t_messages_texts.csv", "../../t_messages_seconds.csv" );
  t_display.text_color = color( 25.1, 55.7, 18.4 );

}

void draw() {
  background(0);

  time = get_current_second();
  
  z_display.display_messages();
  t_display.display_messages();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

int get_current_second() {

  return  hour()*60*60 + minute()*60 + second();
}