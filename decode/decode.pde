import java.util.*;

void setup(){
   size(1200, 600);
   
   int[][] xKey = new int[2][2];
   xKey[0][0] = 3;
    xKey[0][1] = 3;
     xKey[1][0] = 2;
      xKey[1][1] = 5;
      
    int[][] grid = new int[2][2];
    grid[0][0] = 7;
      grid[0][1] = 8;
        grid[1][0] = 0;
          grid[1][1] = 19;
    
      
  // println(Arrays.deepToString(decodeK(grid, xKey)));
  print(gridToMessage(decodeK(grid, xKey)));
   

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
