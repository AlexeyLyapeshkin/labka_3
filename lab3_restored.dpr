program lab3_restored;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Math;

const
n=3;
var x,dx,sum,eps,pred,nast,f1,f2: extended;
    k,r,i,schet: integer;


begin
  writeln('--------------------------------------------------------');
  writeln('|       |        |  e=10^-2  | e=10^-3    | e=10^-4|   |');
  writeln('|   x   |  f1(x) |--------------------------------------');
  writeln('|       |        |  f2(x) | N|  f2(x) | N |  f2(x) | N |');
  writeln('--------------------------------------------------------');
  x:=-0.6;dx:=0.05;
  for i:=1 to 21 do
  begin
   f1:=((tan((pi*x)/2))*(tan((pi*x)/2)));
   write('|',x:7:2,'|',f1:8:4,'|');
    k:=1; schet:=0; nast:=0;
    eps:=0.01; sum:=0;
   for r:=1 to n do
   begin

      repeat
       pred:=nast;
       nast:=(2*((2*k-1)*(2*k-1))-(x*x))/((((2*k-1)*(2*k-1))-(x*x))*(((2*k-1)*(2*k-1))-(x*x)));
       sum:=sum+nast;
       k:=k+1;
       schet:=schet+1;
      until Abs(nast-pred)<eps ;
     f2:=(x*x)*sum;
     eps:=eps/10;
     write(f2:8:4,'| ', schet,'|');
   end;
   writeln;
   x:=x+dx;
    writeln('|-------|--------|--------|--|--------|---|--------|---|');
  end;
  Readln;
end.

 