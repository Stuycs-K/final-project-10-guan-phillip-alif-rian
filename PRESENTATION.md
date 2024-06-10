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

# Hill Cipher Encryption Process

The Hill cipher is a classical cryptographic algorithm that encrypts blocks of letters using linear algebra concepts. Below are the detailed steps involved in the encryption process.

## Steps in the Hill Cipher Encryption Process

### 1. Key Selection and Matrix Formation

1. **Key Matrix Selection:**
   - Choose an \( n \times n \) invertible matrix \( K \) as the key for encryption.
   - The elements of the matrix \( K \) should be integers between 0 and 25 (assuming we are using the English alphabet where A=0, B=1, ..., Z=25).
   - Ensure that the matrix \( K \) is invertible modulo 26. This means that the determinant of \( K \) should have a multiplicative inverse modulo 26.

### 2. Plaintext Preparation

1. **Divide Plaintext into Blocks:**
   - Break the plaintext message into blocks of \( n \) letters each. If the final block is incomplete, pad it with extra letters (e.g., 'X') to make it a full block.
   - **Example:** For a 2x2 key matrix and plaintext "HELP", divide it into blocks "HE" and "LP".

2. **Convert Letters to Numbers:**
   - Convert each letter in the plaintext blocks into its corresponding numerical value.
   - **Example:** H=7, E=4, L=11, P=15.

3. **Form Plaintext Vectors:**
   - Form each block of letters into a column vector.
   - **Example for "HE":**
     \[
     P = \begin{pmatrix}
     7 \\
     4
     \end{pmatrix}
     \]

### 3. Matrix Multiplication

1. **Multiply Key Matrix with Plaintext Vector:**
   - For each plaintext vector \( P \), multiply it by the key matrix \( K \).
   - **Example key matrix \( K \):**
     \[
     K = \begin{pmatrix}
     a & b \\
     c & d
     \end{pmatrix}
     \]
   - **Multiplication for plaintext vector \( P \):**
     \[
     C = K \times P = \begin{pmatrix}
     a & b \\
     c & d
     \end{pmatrix}
     \begin{pmatrix}
     7 \\
     4
     \end{pmatrix}
     = \begin{pmatrix}
     7a + 4b \\
     7c + 4d
     \end{pmatrix}
     \]

2. **Apply Modulo Operation:**
   - After multiplication, apply the modulo 26 operation to each element of the resulting vector to ensure the values are within the range 0-25.
   - **Example calculation:**
     \[
     C = \begin{pmatrix}
     (7a + 4b) \mod 26 \\
     (7c + 4d) \mod 26
     \end{pmatrix}
     \]

### 4. Convert Numbers Back to Letters

1. **Convert Ciphertext Vector to Letters:**
   - Convert each numerical value in the ciphertext vector back to its corresponding letter.
   - **Example:** If the ciphertext vector is \( \begin{pmatrix} 19 \\ 2 \end{pmatrix} \), it corresponds to the letters T and C.
   - Thus, the encrypted block for "HE" might become "TC" (depending on the key matrix used).

## Example

Let's go through a concrete example using a 2x2 key matrix and the plaintext "HI".

1. **Key Matrix:**
   \[
   K = \begin{pmatrix}
   3 & 3 \\
   2 & 5
   \end{pmatrix}
   \]

2. **Plaintext Preparation:**
   - Convert "HI" to numbers: H=7, I=8.
   - Plaintext vector \( P \):
     \[
     P = \begin{pmatrix}
     7 \\
     8
     \end{pmatrix}
     \]

3. **Matrix Multiplication:**
   - Multiply key matrix \( K \) by plaintext vector \( P \):
     \[
     C = \begin{pmatrix}
     3 & 3 \\
     2 & 5
     \end{pmatrix}
     \begin{pmatrix}
     7 \\
     8
     \end{pmatrix}
     = \begin{pmatrix}
     (3 \cdot 7 + 3 \cdot 8) \mod 26 \\
     (2 \cdot 7 + 5 \cdot 8) \mod 26
     \end{pmatrix}
     = \begin{pmatrix}
     45 \mod 26 \\
     54 \mod 26
     \end{pmatrix}
     = \begin{pmatrix}
     19 \\
     2
     \end{pmatrix}
     \]

4. **Convert Numbers Back to Letters:**
   - Convert 19 to T and 2 to C.
   - The ciphertext for the plaintext "HI" is "TC".
