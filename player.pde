class Player{
  boolean playerAlive=false;
  boolean playerHit=false;
  float playerX=30;
  float playerY=225;
  float blobW,blobH;
 
 
 float getPositionX(){
   return playerX;
 }
 
 float getPositionY(){
   return playerY;
 }
 
 float blobWidth(){
   return blobW;
   
 } 
 float blobHeight(){
   return blobH;
   
 } 
 
 
 void displayBlob(){
   
   if(playerAlive==true){
   fill(150);
   ellipse(playerX,playerY,20,20);
   
   }
 
 }
 void moveUp(){
   

   if(playerY>170){
      playerY-=50;
   
    
}
 }
void moveDown(){
    if(playerY<250){
      playerY+=50;
   }

   
  
  
  
}

}
