import java.util.*;

void setup() {
  //size(1200,600);
  String text = "he";
  String keyText = "help";
  int[] Ttext = letterToNumber(text);
  int[][] TkeyText = {{3,3},{2,5}};//getkey(keyText, text);
  println(Arrays.toString(letterToNumber(text)));
  println(Arrays.deepToString((getkey(keyText, text))));
  println(encrypt(Ttext, TkeyText));
}

int[] letterToNumber(String text) {
  int[] result = new int[text.length()];
  String newText = text.toUpperCase();
  for (int i = 0; i < newText.length(); i++) {
    result[i] = newText.charAt(i) % 65;
  }
  return result;
}

int[][] getkey(String keyText, String text) {
  int[][] result = new int[text.length()][text.length()];
  int[] track = letterToNumber(keyText);
  int counter = 0;
  for (int i = 0; i < result.length; i++) {
    for (int j = 0; j < result[i].length; j++) {
      result[i][j] = track[counter];
      counter++;
    }
  }
  return result;
}

String encrypt(int[] textMatrix, int[][] keyMatrix) {
  String result = "";
  
  int kIndex = 0;
  int kIndex0 = 0;
  
  for (int i = 0; i < textMatrix.length; i+=2){
     if (kIndex == 2) kIndex = 0;
    for (int j = 0; j < textMatrix.length; j++){
      result += (char)((keyMatrix[kIndex][kIndex0] * textMatrix[i]) + (keyMatrix[kIndex][kIndex0+1]* textMatrix[i+1])) % 26;
    //  println(Final[i][j]);
      kIndex++;
    }
  }

  /*
  int[] preResult = new int[textMatrix.length];
  for (int i = 0; i < textMatrix.length; i++) {
    println("TextMatrix length: " + textMatrix.length);
    //for (int j = 0; j < keyMatrix[i].length; j++) {
      //println("KeyMatrix length: " + keyMatrix[i].length);
       /// FOUND THE ERROR: I need to add them and then mod 26, right now, it will replace its number in the result an dgo out of bounds
       preResult[i] = ((keyMatrix[i][0]) + (keyMatrix[i][0] * textMatrix[i]) )% 26;
    //}
  }
  for (int k = 0; k < preResult.length; k++) {
    result = result + (char)(preResult[k] + 65);
  }
  
  */
  return result;
}
