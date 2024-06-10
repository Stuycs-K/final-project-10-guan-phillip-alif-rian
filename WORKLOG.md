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

### 5/30/24

Fixed encrypt method. Now investigating how to incorporate images into our project. Will maybe hide the key or encrypted message in the image.

### 5/31/24

Started one last method for the encoding process. It is the hillCipher method, which will actually do the cipher, using all the components we made before.

### 6/1 - 6/2

Started planning how the presentation should look like.

### 6/3/24

Completed the encoding process with Rian in class. Talked through most of the process and finally got it working. Started discussing more in depth what we want to do with images.

### 6/5/24

Created some slides for the presentation. Trying to figure out the timing. Have to start coordinating with the other hill cipher group.

### 6/7/24

Fixed up some errors on encode, discussed how to split up the work between us and the other group doing the hill cipher. Began our image stuff for the project.

### 6/8 - 6/9

Finished up the project. Created the presentation.md. Recorded the presentation. Finished up readme. 

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

### 05/30/24
I helped Phillip on figuring out the encode file. He was having a bit of a hard time with his model, so I recommended him to try getting inspiration from my decode.

### 5/31/24
Worked on figuring out how we will integrate the image. We didn't want something basic or something too complicated. I thought why not find the pixels that has binary value of red and green ending is "00" and change the last two digits of the pixel value with the two nunmber values of the cipher text.

### 6/1/24 - 6/2/24
I was working on the code and trying to make it work. A lot of testing and debuging. 

### 6/3/24
I have trid my best but now realized that I cannot integrate the image the way I planned earlier. I was working on both the encode and decode to integrate it, just to find out that changing the pixels value (even such a small number) seriously effects the image.

### 6/5/24
We looked back at our old labs and took inspiration. We decided that the image would take the ciper text numbers in binary value and store it similar to a Linear mode. This was much more workoable. 

### 6/7/24
I worked on the code. 

### 6/8/24 - 6/9/24
Looked over everything and finished all the bugs. Practiced and revised the presentation. Also, had some issues with merging the branch, so had to fix it. 
