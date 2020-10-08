function drawArc(x,L,dir)
r1=L/35;
r2=L/17;
hdiv=50;
divs=linspace(-90,90,hdiv);
x_=zeros(hdiv,1);
y_=zeros(hdiv,1);
i=1;
for theta=divs
    x_(i)= x + r1*cosd(theta);
    y_(i)= r2*sind(theta);
    i=i+1;
end

plot(x_,y_,'Linewidth',3.5,'color',[0.2 0.4 0.8]);
if dir>0
    x0=x_(end); y0=y_(end);
else
    x0=x_(1); y0=y_(1);
end
patch([x0 x0 x0-(L/75)],[y0-(L/75) y0+(L/75) y0],'k');
end