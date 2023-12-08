/*Name: Abbas Haidari
  Game Name: run4urlife/dodge4urlife
  Instructions: Dodge the obstacles using up and down arrow keys
                Collect bubbles to reset timer
*/
//classes being called
BubbleTimer timerStart= new BubbleTimer();
MainMenu menu=new MainMenu();
Player p1;
//different lanes for each class
//setting the different constructor parameters for each lane
Lanes lane1=new Lanes(0,150,400,50);//first  lane
Lanes lane2=new Lanes(0,250,400,50);//middle lane
Lanes lane3=new Lanes(0,200,400,50);//third lane

BackgroundDisplays backgroundImages=new BackgroundDisplays();

//arraylist classes for 
ArrayList<Lanes> laneDist;//used for distance traveled
ArrayList<Boulders> boulder;//used for boulders
ArrayList<Pits> pit;//used for pits.
bubbles [] bubble=new bubbles[20];//bubbles, can only take in 20 max.

int finaldistance;//used for the final distance when the player dies  (appears end game screen)
int choice;//iused for the switch cases and keypressed for starting the game 
void setup(){
  size(400,400);
  frameRate(60);//setting framerate to 60 to have smooth gameplay
p1=new Player(30,225);
//new arraylist for the "calculating" the distance
  for(int d=0;d<1;d++){//for loop used d is incremented 
    laneDist=new ArrayList<Lanes>();
    laneDist.add(new Lanes(0,0,0,0));
  }
  //three new pits, with their X positions randomized at the start.
  //three for each lane
  for(int i=0;i<3;i++){//incremented to three since there is three, one for each lane
    pit=new ArrayList<Pits>();
    //setting constructor parameters as well, first one is y, second is randomized X, the other two is width and height
    pit.add(new Pits(150,random(200,400),20,50));//top lane
    pit.add(new Pits(200,random(700,900),20,50));//middle lane
    pit.add(new Pits(250,random(400,500),20,50));//bottom lane
    for( i=0;i<bubble.length;i++){//bubble length (length is 10)
    bubble[i]=new bubbles();
  }
  
  }
  
    for(int i=0;i<3;i++){//three new boulders with their x values randomized.
    boulder=new ArrayList<Boulders>();
    //setting constructor parameters as well, first one is y, second is randomized X, the other two is width and height
    boulder.add(new Boulders(160,random(450,1200),60,60));//top
    boulder.add(new Boulders(210,random(470,1200),60,60));//middle
    boulder.add(new Boulders(260,random(490,1200),60,60));//bottom
   
  }
  
}

void draw(){
  background(160,105,0);//putting background in draw function so it renews
  //switch case using variable choice to increment and move through menus
  switch (choice){
    case 0://case one is startscreen
     menu.displayStartscreen();//calling start screen function in menu class
     break;
    case 1: 
    backgroundImages.pillars();
    backgroundImages.backgroundFloor();
    backgroundImages.torchHolder();
    backgroundImages.flame();
    timerStart.timerDown();//calling timerDown function in timerStart class to decrease time
    timerStart.displayTime();//displays time!
    lane1.laneDisplay();//lane 1 display
    lane2.laneDisplay();//lane 2 display
    lane3.laneDisplay();//lane 3 display
    
    p1.displayPlayer();//calling function displaying player character in player
    menu.gameStart();//calling function that starts game
    for(int i=0;i<boulder.size();i++){//arraylist moves boulders with update boulders and increments it 
      boulder.get(i).displayBoulders();//displays boulders
      boulder.get(i).updateBoulders();//updates boulder locations, 
      boulder.get(i).collisionBoulder();//calling collision function detect player
    for(int d=0;d<laneDist.size();d++){
        laneDist.get(d).laneDistance();//counts the distance the player has traveled, resets when game over
        
      }
  }
      fill(255);//white!
      text("DISTANCE: "+lane1.laneDistance(),160,15);//displays the distance the player is currently travelling
      
     for(int b=0;b<bubble.length;b++){//incremented until bubble length(10).
     bubble[b].updateBubbles();//calling update function to move bubbles (allows them to move)
     bubble[b].displayBubbles();//calling display function to show bubbles
     bubble[b].collectBubbles();//calling collect bubbles function to allow the bubbles to be collected
       }        
      
     
   for(int pitInc=0;pitInc<pit.size();pitInc++){
      pit.get(pitInc).displayPits();//calling display method to show pits
      pit.get(pitInc).updatePits();//calling update method to update positions etc. of pits and make them move 
      
      pit.get(pitInc).pitCollision(p1);//calling collision method to detect when player has collided
 }
   finaldistance=lane1.distance;//displays the final distance, takes the value from lane1.distance
   break;//break!
 case 2:
        timerStart.time=100;//time restart!
        menu.overGame=true;//game over menu is set to true when player is hit.
        lane1.distance=0;//distance is reset to 0
        menu.gameOverScreen();//game over function is called
        break;//break!
   }
  
 
  
  
}





void keyPressed(){//key pressed function detects well presses.
  //start screen when the player presses space it disappears
  if(key==' '){
   // print(choice); used for debugging
    if(choice==0){//if it is 0 it will increment to 1.
    choice+=1;
    }
    if(choice==2){//if it is two it will minus by 1.
      choice=choice-1;
      
    }
    if(choice>2){//if the choice is more than two it is set back to two, this is incase the player 
    //hit by both the boulder and the pit
      choice=2;
    }
    
  }
  if(key==CODED){
    if(keyCode==UP){//allows the player to move up 
    p1.moveUp();
  }
  if(keyCode==DOWN){//allows the player to move down
    p1.moveDown();
  }
}
}
