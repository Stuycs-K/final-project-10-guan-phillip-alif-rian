import java.util.*;

void setup() {
  size(1200,600);
  String text = "hi";
  String keyText = "help";
  int[] Ttext = letterToNumber(text);
  int[][] TkeyText = getkey(keyText, text);
  println(Arrays.toString(letterToNumber(text)));
  println(Arrays.deepToString((getkey(keyText, text))));
  println(encode(Ttext, TkeyText));
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

String encode(int[] textMatrix, int[][] keyMatrix) {
  String result = "";
  int[] preResult = new int[textMatrix.length];
  for (int i = 0; i < textMatrix.length; i++) {
    println("TextMatrix length: " + textMatrix.length);
    for (int j = 0; j < keyMatrix[i].length; j++) {
      println("KeyMatrix length: " + keyMatrix[i].length);
       preResult[j] = (keyMatrix[i][j] * textMatrix[i+j]) % 26;
    }
  }
  for (int k = 0; k < preResult.length; k++) {
    result = result + (char)(preResult[k] + 65);
  }
  return result;
}
