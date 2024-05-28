import java.util.*;

void setup() {
  size(1200,600);
  String text = "hi";
  print(Arrays.toString(letterToNumber(text)));
}

int[] letterToNumber(String text) {
  int[] result = new int[text.length()];
  String newText = text.toUpperCase();
  for (int i = 0; i < newText.length(); i++) {
    result[i] = newText.charAt(i) % 65;
  }
  return result;
}
