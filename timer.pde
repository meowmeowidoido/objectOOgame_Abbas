class BubbleTimer{
  //https://youtu.be/c8sc_w-g3-A?si=HOfD3rdYNICUHdXt video used for Timer class
 //added a timer because i felt like the bubbles felt useless.
  float time;
 
  BubbleTimer(){//
    
    time =100;//time is set to 100.
    
    
  }
  
 
  void displayTime(){//displays time put time variable in the width so it decreases like a bar!
    rect(10,15,time,10);
  }
  void timerDown(){
    //timer goes down by -20 each second 
    time-=20/frameRate;
    if(time<=0){//if the time is less than 0 or is 0 it will cause choice to increment to 1 and cause game over
      choice=choice+1;
    }
    
  }
  
  
  
}
