factors ← {(0=(⍳⌈⍵*÷2)|⍵)/⍳⌈⍵*÷2}
isprime ← {2=+/0=(⍳⍵)|⍵}
⎕←{⌈/(isprime¨factors ⍵)/factors ⍵} 600851475143
