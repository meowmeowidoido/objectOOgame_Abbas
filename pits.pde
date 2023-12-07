class Pits
{
  
  PVector position=new PVector();//pvector class called for the position
  PVector velocity=new PVector();//pvector class called for the velocity
  float pitWidth;//pit width used for putting in the rect for the width
  float pitHeight;//pit height used for putting in the rect for the height

  
    Pits(float y, float x, float pWidth, float pHeight){//constructor  with parameters.
     //setting the pvector x and y and the width and height to the values of the constructor parameters which are set in the main class
      position.x=x;
      position.y=y;
      pitWidth=pWidth;
      pitHeight=pHeight;
    }
   
   //displays the pits.
   void displayPits(){
     fill(200,180,50);
     rect(position.x,position.y,pitWidth,pitHeight);
     
   }
   
   //updates the pits positions
   void updatePits(){
     position.x-=3;//decrements the position x by -3.
     position.y+=velocity.y;//velocity y plus the position y
    
     
   
     if(position.x<60){//if the position x is less then it will reset.
      position.x=random(1200,1900);

    
        
 
   }

   } 
   
   //pit collision class.
   void pitCollision(Player player){//takes in player class as a parameter
  
    //if the distance of the position x of the rect and its width/2, pit y position plus the pit height/2
    //and the player position x and player position y is less than the player radius it detects the player
   if(dist(player.position.x,player.position.y,position.x+pitWidth/2,position.y+pitHeight/2)<p1.playerRadius(10,10)){
     //player is not detected when they are boulder overlaps them when they are on a different lane
     position.x=random(500,1200); //position is reset when they are hit.
     choice=choice+1;//increases choice to 2, prompts game over screen
     //print("hi"); debug
     //print(choice); debug
           
     
     
}

   }
   
}
     
 

   
  
