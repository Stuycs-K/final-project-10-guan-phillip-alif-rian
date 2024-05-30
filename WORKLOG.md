# Work Log

## Phillip Guan

### 5/22/24

Started research on the Hill Cipher. Learning how it works, and thinking about ways to implement it.

### 5/23/24

Tested how to use branches on Github to limit future conflicts.

### 5/24/24

Was not in class, but continued to learn the Hill Cipher encryption process.

### 5/28/24

Started the encryption process. Created two methods. One method called "letterToNumber" that takes in a string, and returns an array of numbers that we can use for the Hill Cipher. The second method is called "getkey" and it takes in a string, this string will be the key for the cipher, and returns a double array that matches the size of the word we are encrypting. This is so we can perform matrix operations on these two array(which are basically matrices at this point).

### 5/29/24

Created a encrypt method. This method would give the resulting matrix from the matrix multiplication from the text and key. While working, there was an error with the output, and I figured out the problem, but haven't figured out a solution to it yet. 

## Rian Alif

### 05/22/24

Looked around few websites to learn about how the encryption and decryption works for Hill Cipher.

### 05/23/24

We learned more about using branches in github. Also, fixed our branch issues.

### 05/24/24

Wasn't in class but at home I looked at the Decryption part of the Hill Cipher and planned how I would approach the coding aspect of it.

### 05/28/24

Me and Phillip started the encode together so that when I do the decode, it follows the same rule and has the basic format. 

### 05/29/24

I worked on decode and finished the basic model for a Hill Cipher. I created the methods decodeK() and gridToMessage(). decodeK() takes the encrypted matrix and the key matrix and then decodes it into ASCII and gridToMessage() takes the ASCII values and returns a String. So, far basic is done, now we need to improve it and dd the image aspect of the project.
