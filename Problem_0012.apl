getPrimeFactors←{⍵{⍵,(⍺÷×/⍵)~1}∊⍵{(0=(⍵*⍳⌊⍵⍟⍺)|⍺)/⍵⋄}¨⍬{nxt←⊃⍵⋄msk←0≠nxt|⍵⋄∧/1↓msk:⍺,⍵⋄(⍺,nxt)∇ msk/⍵}⍵{(0=⍵|⍺)/⍵}2,(1+2×⍳⌊0.5×⍵*÷2),⍵}
countDevisors←{×/1+⊢∘≢⌸getPrimeFactors ⍵}
t←{⍺←1⋄⍵<countDevisors+/⍳⍺:+/⍳⍺⋄(⍺+1)∇⍵}
⎕←t 500