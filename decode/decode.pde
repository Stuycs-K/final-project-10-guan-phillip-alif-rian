import java.util.*;

void setup(){
   size(800, 800);
   
   PImage img = loadImage("modifiedHacker.png");
   
   int[][] xKey = new int[2][2];
   xKey[0][0] = 3;
    xKey[0][1] = 3;
     xKey[1][0] = 2;
      xKey[1][1] = 5;
      
    int[][] grid = downloadGrid(img);
    print(Arrays.deepToString(grid));
   /*  new int[2][2];
   grid[0][0] = 7;
      grid[0][1] = 8;
        grid[1][0] = 0;
          grid[1][1] = 19;
    
*/      
  // println(Arrays.deepToString(decodeK(grid, xKey)));
  print(gridToMessage(decodeK(grid, xKey)));
   
  image(img, 0, 0);
}

int[][] downloadGrid(PImage img){
  
  String[] list = new String[img.pixels.length];
    int pIndex = 0;
    
   for (int i = 0; i < list.length; i++) {
     
     String red1 = toBinaryString((int) red(img.pixels[pIndex++]));
     String red2 = toBinaryString((int) red(img.pixels[pIndex++]));
     String red3 = toBinaryString((int) red(img.pixels[pIndex++]));
     String red4 = toBinaryString((int) red(img.pixels[pIndex++]));
     
    list[i] = "" + binaryToDec(red1.substring(red1.length()-2, red1.length())) + binaryToDec(red2.substring(red2.length()-2, red2.length())) + binaryToDec(red3.substring(red3.length()-2, red3.length())) + binaryToDec(red4.substring(red4.length()-2, red4.length()));
 // println(list[i]);
    if (list[i].equals("3333")) break;
    }
    
   int[] total = new int[(pIndex-4)/4];
   int[][] grid = new int[((pIndex-4)/4)/2][2];
   
   for (int i = 0; i < grid.length*2; i++){
   if (list[i].equals("3333")) break;
   int decimal = Integer.parseInt(arrayToMessage(list[i]), 2);
   total[i] += decimal;
  }

//print(Arrays.toString(total));

  int tracker = 0;
  for (int i = 0; i < total.length/2; i++){
    for (int j = 0; j < 2; j++){
      grid[i][j] = total[tracker++];
    }
   
  }
   
 
 return grid;
}


String toBinaryString(int x){
  String result = "";
  if (Integer.toBinaryString(x).length() < 8) {
    int track = 8 - Integer.toBinaryString(x).length();
//    println("toBinaryString " + track);
    for (int i = 0 ; i < track; i++){
      result = result + "0";
    }
  }
  return result + Integer.toBinaryString(x);
}


int binaryToDec(String s) {
        
        int finalValue;

        if (s.equals("01")) {
            finalValue = 1;
        } else if (s.equals("10")) {
            finalValue = 2;
        } else if (s.equals("11")) {
            finalValue = 3;
        } else {
            finalValue = 0;
        }

        return finalValue;
    }
    
    
String arrayToMessage(String s){
  String total = "";
  
      for (int i = 0; i < s.length(); i++){
         char c = s.charAt(i);
        if (c == '1'){
            total += "01";
        } else if (c == '2') {
            total += "10";
        } else if (c == '3') {
            total += "11";
        } else {
            total += "00";
        }
      }
  return total;
}

    
int[][] decodeK(int[][] grid, int[][] k){
  int[][] Final = new int[grid.length][grid[0].length];
  int[][] kInverse = new int[k.length][k[0].length];
  int[][] newK = new int[k.length][k[0].length];
  
  for (int i = 0; i < k.length; i++){
    for (int j = 0; j < k[0].length; j++){
      if (i == 0 && j == 0){
        newK[i][j] = k[i+1][j+1];
      }else if (i == 1 && j == 1){
        newK[i][j] = k[i-1][j-1];
      }else{
        newK[i][j] = -k[i][j] + 26;
      }
    }
  }
  
  int D = (k[0][0] * k[1][1]) - (k[0][1] * k[1][0]);
  int dMod = 27/D;
  
  for (int i = 0; i < k.length; i++){
    for (int j = 0; j < k[0].length; j++){
      kInverse[i][j] = (dMod * newK[i][j])%26;
    //  println(kInverse[i][j]);
    }
  }
  
  int kIndex = 0;
  int kIndex0 = 0;
  
  for (int i = 0; i < grid.length; i++){
     if (kIndex == 2) kIndex = 0;
    for (int j = 0; j < grid[i].length; j++){
      Final[i][j] = ((kInverse[kIndex][kIndex0] * grid[i][kIndex0]) + (kInverse[kIndex][kIndex0+1]* grid[i][kIndex0+1])) % 26;
    //  println(Final[i][j]);
      kIndex++;
    }
  }
    
  return Final;
}

String gridToMessage(int[][] grid){
  String Final = "";
  
  for (int i = 0; i < grid.length; i++){
    for (int j = 0; j < grid[i].length; j++){
      Final += (char)(grid[i][j] + 65);
    }
  }
  
  return Final;
}
