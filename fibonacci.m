a=0;
b=1;
n = input("Enter the number of fibonacci terms to be generate: ");
for i = 1:n
    fprintf("%d\t",a);
    c=a+b;
    a=b;
    b=c;
end
