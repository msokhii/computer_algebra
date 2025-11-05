restart:
MAKEMONIC := proc(paramA::polynom)

local n,LCF:
n := paramA:
LCF := lcoeff(n):

if whattype(LCF)='integer' then:
    if LCF=1 then:
        return n:
    else:
        n := expand((1/LCF)*n):
        return (n):
    fi:
elif whattype(LCF)='fraction' then:
    LCF := denom(LCF)/numer(LCF):
    n := expand(LCF*n):
    return n:
fi:

end proc:
EEA := proc(paramA::polynom,paramB::polynom,paramC::integer,paramD::posint)

local R,Q,T,A,B,S,k,i,res:

R := table():
Q := table():
T := table():
S := table():
k := 1:
A := paramA:
B := paramB:
R[k] := A:
R[k+1] := B:
Q[k] := 0:
Q[k+1] := 0:
T[k] := 0:
T[k+1] := 1:
S[k] := 1:
S[k+1] := 0:

while R[k+1]<>0 do:
    Q[k+2] := expand(quo(R[k],R[k+1],x,'r')):
    R[k+2] := r:
    S[k+2] := expand(S[k]-(Q[k+2]*T[k+1])):
    T[k+2] := expand(T[k]-(Q[k+2]*T[k+1])):
    k++:
od:

R := convert(R,list):
Q := convert(Q,list):
T := convert(T,list):
S := convert(S,list):

printf("%-3s %-55s %-45s %-55s %-55s %s\n","k", "R[k]", "Q[k]", "T[k]", "S[k]", "deg"):

for i from 1 to nops(R) do
    printf("%-3a %-55a %-45a %-55a %-55a %a\n",i, R[i], Q[i], T[i], S[i],degree(R[i], x));
od:

res := MAKEMONIC(R[k]):
return res:
end proc:
A := expand(((1/180)*x^4)-((5/63)*x^3)+((97/252)*x^2)-((65/126)*x)+(74/105)):
B := expand((x-1)*(x-2)*(x-3)*(x-4)*(x-5)):
EEA(A,B);
