# Hill Cipher
### By: Rian Alif and Phillip Guan

## Lester S. Hill
- Creator of the Hill Cipher
- Introduced Hill Cipher in 1929

## What is the Hill Cipher?
- Polygraphic substitution cipher based on linear algebra.
  - Matrix Multiplication
  - Modular Arithmetic

## Why was the Hill Cipher created?
- To create a cipher more secure than a simple substitution cipher and transposition cipher
  - Substitution Cipher: an encryption method in which each letter in the message is replaced by another letter or symbol according to a secret key.
    - Some problems with this include the fact that it is very easy to attack. All you need is to run some frequency analysis on it.
  - Transposition Cipher: a method of encryption that rearranges the characters or bits in the plaintext according to a certain system, all while maintaining their original identity.
    - Problems with this cipher include the fact that it can also be broken with frequency analysis
    - Also note that one single error in the encryption or transmission can make a large portion of the message unreadable

## Hill Cipher: Strengths
- One of the first polygraphic ciphers to be practical and implemented.
  - A polygraphic cipher is when you perform substitutions with two or more groups of letters
- Cannot be attacked using frequency analysis.
  - The matrix multiplication that the cipher goes through provides diffusion

## Hill Cipher: Weaknesses
- Vulnerable to brute force attacks, especially when block size is small and the key is weak.
- Vulnerable to known plaintext attacks

## Encryption Process
- All the letters from A-Z are represented as numbers from 0-25
-
