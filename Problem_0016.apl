xtimes←{⎕IO←0                       ⍝ Fast multi-digit product using FFT.
    roots←{×\1,1↓(1⌈⍵÷2)⍴¯1*2÷⍵}
    cube←{⍵⍴⍨2⍴⍨2⍟≢⍵}
    extend←{(2*⌈2⍟¯1+(≢⍺)+≢⍵)↑¨⍺ ⍵}
    floop←{(⊣/⍺)∇⍣(×m)⊢(+⌿⍵),[m-0.5]⍺×[⍳m←≢⍴⍺]-⌿⍵}
    FFT←{,(cube roots≢⍵)floop cube ⍵}
    iFFT←{(≢⍵)÷⍨,(cube+roots≢⍵)floop cube ⍵}
    rconvolve←{(¯1+(≢⍺)+≢⍵)↑iFFT⊃×/FFT¨⍺ extend ⍵}
    carry←{((∧/b)-⍨+/∧\b←0=t)↓t←{1↓+⌿1 0⌽0,0 10⊤⍵}⍣≡0,⍵}
    carry 0,⌊0.5+9○⍺ rconvolve ⍵
 }

xpower←{                            ⍝ Fast multi-digit power using FFT.
    xt←{(0,⍺)xtimes 0,⍵}
    b←⌽2⊥⍣¯1+10⊥⍵                   ⍝ boolean showing which powers needed
    ↑,/xt/b/{xt⍨⍵}\(⊂,10⊥⍣¯1+⍺)⍴⍨⍴b
}

euler16←{
    +/⍺ xpower ⍵
}

⎕← 2 euler16 1000