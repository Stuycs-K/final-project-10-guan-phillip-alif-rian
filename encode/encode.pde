import java.util.*;

void setup() {
  size(1200,600);
  String text = "hi";
  String keyText = "help";
  print(Arrays.toString(letterToNumber(text)));
  println(Arrays.deepToString((getkey(keyText, text))));
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
