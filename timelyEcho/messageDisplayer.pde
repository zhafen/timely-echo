// Class for displaying messages

/////////////////////////////

class MessageDisplayer {
  String[] messages;
  String[] seconds;
  int[] inds_to_display = {};
  float[] x_positions = {};
  float[] y_positions = {};
  int current_ind;
  float text_width = 300;
  color text_color = color( 46.3, 53.7, 66.3 );
  

  //Constructor
  MessageDisplayer( String messages_file, String seconds_file ) {

    messages = loadStrings( messages_file );
    seconds = loadStrings( seconds_file );

    initialize_current_ind();
  }

  ////////////////////////////////////////////

  // Master function for displaying messages.
  void display_messages() {

    get_inds_to_display();

    display_selected_messages();

    stop_displaying_inds();
  }

  //Figure out what messages to display.
  void get_inds_to_display() {

    if ( time > int( seconds[current_ind] ) ) {

      inds_to_display = append( inds_to_display, current_ind );

      x_positions = append( x_positions, random( width - text_width ) );
      y_positions = append( y_positions, random( height - text_width ) );

      current_ind += 1;
    }
  }

  // Figure out when to stop displaying ids.
  void stop_displaying_inds() {

    int[] new_inds_to_display = {};
    float[] new_x_positions = {};
    float[] new_y_positions = {};

    for (int j=0; j < inds_to_display.length; j += 1 ) {
      int ind = inds_to_display[j];
      if ( time < int( seconds[ind] ) + seconds_to_display_for ) {
        new_inds_to_display = append( new_inds_to_display, ind );
        new_x_positions = append( new_x_positions, x_positions[j] );
        new_y_positions = append( new_y_positions, y_positions[j] );
      }
    }

    inds_to_display = new_inds_to_display;
    x_positions = new_x_positions;
    y_positions = new_y_positions;
  }

  void display_selected_messages() {

    // Account for an empty list
    if ( inds_to_display.length == 0 ) {
      return;
    }

    for (int j=0; j < inds_to_display.length; j += 1 ) {

      int ind = inds_to_display[j];

      fill( text_color );
      text( messages[ind], x_positions[j], y_positions[j], text_width, height );
      
    }
  }

  ////////////////////////////////////////////////////

  void initialize_current_ind() {

    for ( int j=0; j < seconds.length; j += 1 ) {

      if ( time > int( seconds[j] ) ) {
        current_ind = j;
      }
    }
  }
}