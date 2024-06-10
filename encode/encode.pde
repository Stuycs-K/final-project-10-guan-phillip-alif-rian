import java.util.*;

void setup() {
  size(800, 800);
  PImage img = loadImage("hacker.png");
  
  String text = "help";
  String keyText = "help";
  int[][] Ttext = letterToNumber(text);
  int[][] TkeyText = {{3,3},{2,5}}; //getkey(keyText, text);
  int[][] message = encrypt(Ttext, TkeyText);
  String[] messageToEncode = new String[message.length * 2];
  
  int index = 0;
  for (int i =0; i < message.length; i++){
    for (int j = 0; j < message[i].length; j++){
       messageToEncode[index++] = String.valueOf(message[i][j]);
    }
  }
//  print(Arrays.toString(messageToEncode));
  
  int[] parts = messageToArray(messageToEncode);
  print(Arrays.toString(parts));
   
  //println(Arrays.deepToString(letterToNumber(text)));
  //println(Arrays.deepToString((getkey(keyText, text))));
//  println(Arrays.deepToString(encrypt(Ttext, TkeyText)));
  
  uploadCipher(img, parts);
  
  img.save("modifiedHacker.png");
    
  image(img, 0, 0);
}

void uploadCipher(PImage img, int[] messageArray){
  
   //LINEAR mode :
    //Loop over the pixels in order. For each pixel:
   int mIndex = 0;
   
   for (int i = 0; i < messageArray.length; i++) {
     int pixel = img.pixels[i];
     
     String red = toBinaryString((int) red(pixel));
  //   if (red.equals("0")  || red.equals("1")) red = "0"+red; 
    // print(red + ",");
     
    // print(mIndex + " " + decToBinary(messageArray[mIndex]) + ",");
   // print(messageArray[mIndex] + " ");
     String newRed = red.substring(0,red.length()-2) + decToBinary(messageArray[mIndex]);
     
  // Color Values
  //print(Integer.parseInt(newRed, 2)+","+red(pixel) + " " );
  
    //-Take one array value and write it to the red channel of the pixel. 
     img.pixels[i] =  color(Integer.parseInt(newRed, 2), green(pixel), blue(pixel));
    //   println(Integer.toBinaryString((int) red(img.pixels[i])));
     
     mIndex++;
     }

    //-When there are no more letters, write a terminating character.
    for (int i = 0; i < 4; i++){
     int pixel = img.pixels[mIndex];
     String red = toBinaryString((int) red(pixel));
     String newRed = red.substring(0,red.length()-2) + "11";
     img.pixels[mIndex++] = color(Integer.parseInt(newRed, 2), green(pixel), blue(pixel));
    //  println(img.pixels[mIndex]);
    println(mIndex);
    }
 
 for(int i = 0; i < messageArray.length; i++){
 println(toBinaryString((int) red(img.pixels[i])));
 }
}

int [] messageToArray(String[] s) {
  
  int[]parts = new int[s.length * 4]; //optionally include the terminating character here.
  //calculate the array

   int partsIndex = 0;
        for (int t = 0; t < s.length; t++) {
            String x = Integer.toBinaryString(Integer.parseInt(s[t]));
           if ( x == " " || x == "." || x == ",") {
                x = '0' + '0' + x;
            }else{
               if (x.length() < 8){
              int index = 8 - x.length();
              for (int i = 0; i < index; i++){
                x = '0' + x;
              }
            }
            }
            
            
            for (int i = 0; i < 4; i++) {
                String twoBits = x.substring((i * 2), (i + 1) * 2);
               // println(twoBits);
                parts[partsIndex++] = binaryToDec(twoBits);
            }
        }
     
  return parts;
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

String decToBinary(int s) {
        
        String finalValue = "";

        if (s == 1) {
            finalValue = "01";
        } else if (s == 2) {
            finalValue = "10";
        } else if (s == 3) {
            finalValue = "11";
        } else if (s == 0) {
            finalValue = "00";
        }

        return finalValue;
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

int[][] letterToNumber(String text) {
  int[][] result = new int[text.length()/2][2];
  int index = 0; 
  
  String newText = text.toUpperCase();
  for (int i = 0; i < newText.length()/2; i++) {
    for (int j = 0; j < 2; j++){
      result[i][j] = newText.charAt(index++) % 65;
    }
  }
  return result;
}


int[][] encrypt(int[][] text, int[][] keyText) {

  int[][] encryptedText = new int[text.length][text[0].length];

  int kIndex = 0;
  int kIndex0 = 0;
  
  for (int i = 0; i < text.length; i++){
     if (kIndex == 2) {
       kIndex = 0;
     }
    for (int j = 0; j < text[i].length; j++){
      encryptedText[i][j] = ((keyText[kIndex][kIndex0] * text[i][kIndex0]) + (keyText[kIndex][kIndex0+1]* text[i][kIndex0+1])) % 26;
    //  println(Final[i][j]);
      kIndex++;
    }
  }
  return encryptedText;
  
}
