Program created for CISP 2410. Created on Oct 30th, 2024.

Critical Thought Process:
Program needs to take input work and run it through an encryption function. After text has been encrypted it then needs to output this value back out.

Steps:
Declare the variables.
Output message asking for text user wants encrypted and then take this text store in EAX and run it through encryption function.
Use pushad to push the register onto stack.
When encrypting or decrypting make sure all keys are not used; if so reset and start from beginning.
When complete use popad to pop the register onto the stack and return value.
Output encrypted text.
Using the same function for encryption run text through and decrypt text.
Output decripted text to verify program is running correctly.
End program.

End Result:
Program is able to take input text and encrpt it, output the result, then decrypt, ouput results, to compare and prove true.

