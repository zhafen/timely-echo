// Module for extracting a set of waypoints for guiding souls

//////////////////////////////////////////////////////////

// Malleable Global Variables

int seconds_to_display_for = 30;

boolean set_time = true;
int specified_time = 40090;

///////////////////////////////////////////////

// Fixed Global Variables

int time;

MessageDisplayer z_display;
MessageDisplayer t_display;

///////////////////////////////////////////////////////

void setup() {
  size(1200, 700);
  frameRate(1);
  colorMode(RGB, 100);

  textAlign( LEFT );
  textSize( 18 );

  frameRate( 1 );

  time = get_current_second();

  z_display = new MessageDisplayer( "../../z_messages_texts.csv", "../../z_messages_seconds.csv" );
  t_display = new MessageDisplayer( "../../t_messages_texts.csv", "../../t_messages_seconds.csv" );
  t_display.text_color = color( 25.1, 55.7, 18.4 );
}

void draw() {
  background(0);

  time = get_current_second();

  println( time );


  z_display.display_messages();
  t_display.display_messages();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

int get_current_second() {

  if ( set_time ) {
    return millis()/1000 + specified_time;
  }

  return  hour()*60*60 + minute()*60 + second();
}