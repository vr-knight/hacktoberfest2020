function SFBM_draw(DataIn,DataOut)


P=DataIn{1};
U=DataIn{2};
T=DataIn{3};
R=DataIn{4};
X=DataIn{5};
S=DataIn{6};

SF=-DataOut{1};
BM=-DataOut{2};
THETA=-DataOut{3};
Y=-DataOut{4}*1e3;
xs=DataOut{5};

L=X(end);
h=L/100;


figure(1)
set(gcf,'Position',[20 50 800 900]);
subplot(3,1,1)
% pbaspect([2 0.4 1])
hold on;
grid on
grid minor
xticks(0:0.5:X(end))
axis([-L/5 L+(L/5) -L/5 L/5])
for i=1:numel(P(:,1))
    drawArrow(P(i,1),L,sign(P(i,2)),[0.6 0.2 0.2])
    text(P(i,1)-(L/85),(L/8)*sign(P(i,1)),num2str(P(i,2))+ "N",'color',[0.6 0.2 0.2])
end
for i=1:numel(U(:,1))
    h1=L/15;
    area([U(i,1) U(i,2)],[sign(U(i,3))*h1 sign(U(i,3))*h1],'facecolor',[0.1 0.6 0.1],'FaceAlpha',0.5)
    text(( (U(i,1)+U(i,2))*0.5),(L/12)*sign(U(i,3)),num2str(U(i,3))+"N/m",'color',[0.1 0.6 0.1])
end
drawArrow(S(1),L,sign(R(1)),[0.3 0.2 0.8])
text(S(1)-(L/85),(L/8)*sign(R(1)),num2str(R(1))+ "N",'color',[0.3 0.2 0.8])
drawArrow(S(2),L,sign(R(2)),[0.3 0.2 0.8])
text(S(2)-(L/85),(L/8)*sign(R(2)),num2str(R(2))+ "N",'color',[0.3 0.2 0.8])
patch([0 0 L L],[h -h -h h],[0.2 0.3 0.4]);
for i=1:numel(T(:,1))
    drawArc(T(i,1),L,sign(T(i,2)))
    text(T(i,1)+(L/85),(L/12),num2str(T(i,2))+ "Nm",'color',[0.2 0.4 0.8])
end
title("Problem Schematic")
hold off;


figure(2)
set(gcf,'Position',[825 50 800 900]);
subplot(3,1,1)
% pbaspect([5 1 1])
hold on;
grid on
grid minor
xticks(0:0.5:X(end))
axis([-L/5 L+(L/5) -L/5 L/5])
for i=1:numel(P(:,1))
    drawArrow(P(i,1),L,sign(P(i,2)),[0.6 0.2 0.2])
    text(P(i,1)-(L/85),(L/8)*sign(P(i,1)),num2str(P(i,2))+ "N",'color',[0.6 0.2 0.2])
end
for i=1:numel(U(:,1))
    h1=L/15;
    area([U(i,1) U(i,2)],[sign(U(i,3))*h1 sign(U(i,3))*h1],'facecolor',[0.1 0.6 0.1],'FaceAlpha',0.5)
    text(( (U(i,1)+U(i,2))*0.5),(L/12)*sign(U(i,3)),num2str(U(i,3))+"N/m",'color',[0.1 0.6 0.1])
end
drawArrow(S(1),L,sign(R(1)),[0.3 0.2 0.8])
text(S(1)-(L/85),(L/8)*sign(R(1)),num2str(R(1))+ "N",'color',[0.3 0.2 0.8])
drawArrow(S(2),L,sign(R(2)),[0.3 0.2 0.8])
text(S(2)-(L/85),(L/8)*sign(R(2)),num2str(R(2))+ "N",'color',[0.3 0.2 0.8])
patch([0 0 L L],[h -h -h h],[0.2 0.3 0.4])
for i=1:numel(T(:,1))
    drawArc(T(i,1),L,sign(T(i,2)))
    text(T(i,1)+(L/85),(L/12),num2str(T(i,2))+ "Nm",'color',[0.2 0.4 0.8])
end
title("Problem Schematic")
hold off;




%%
figure(1)
subplot(3,1,2)
hold on;
grid on
grid minor
xticks(0:X(end)/10:X(end))
title("Shear Force Diagram")
axis( [-L/5 L+(L/5) min(SF)*1.8 max(SF)*1.8])
plot(xs,SF,'Linewidth',2.5,'color',[0.85 0.33 0.1])
plot([0 0] ,[0 SF(1)],'Linewidth',2.5,'color',[0.85 0.33 0.1])
plot([ L L] ,[0 SF(end)],'Linewidth',2.5,'color',[0.85 0.33 0.1])
area(xs,SF,'FaceColor',[0.85 0.33 0.1],'FaceAlpha',0.5)
xlabel('x(m)');
ylabel('Shear Force(N)');
hold off;

figure(1)
subplot(3,1,3)
hold on;
grid on
grid minor
xticks(0:X(end)/10:X(end))
title("Bending Moment Diagram")
axis( [-L/5 L+(L/5) min(BM)*1.8 max(BM)*1.8])
plot(xs,BM,'Linewidth',2.5,'color',[0.2 0.6 1])
plot([0 0] ,[0 BM(1)],'Linewidth',2.5,'color',[0.2 0.6 1])
plot([L L] ,[0 BM(end)],'Linewidth',2.5,'color',[0.2 0.6 1])
area(xs,BM,'FaceColor',[0.2 0.6 1],'FaceAlpha',0.5)
xlabel('x(m)');
ylabel('Moment(Nm)');
hold off;


figure(2)
subplot(3,1,2)
hold on;
grid on
grid minor
xticks(0:X(end)/10:X(end))
title("Slope Variation")
axis( [-L/5 L+(L/5) min(THETA)*1.8 max(THETA)*1.8])
plot(xs,THETA,'Linewidth',2.5,'color',[0.5 0.2 0.6])
plot([0 0] ,[0 THETA(1)],'Linewidth',2.5,'color',[0.5 0.2 0.6])
plot([L L] ,[0 THETA(end)],'Linewidth',2.5,'color',[0.5 0.2 0.6])
area(xs,THETA,'FaceColor',[0.5 0.2 0.6],'FaceAlpha',0.5)
xlabel('x(m)');
ylabel('Slope, dy/dx(rad)');
hold off;


figure(2)
subplot(3,1,3)
hold on;
grid on
grid minor
xticks(0:X(end)/10:X(end))
title("Defelction")
axis( [-L/5 L+(L/5) min(Y)*1.8 max(Y)*1.8])
plot(xs,Y,'Linewidth',2.5,'color',[0.9294  0.6902 0.1294])
plot([0 0] ,[0 Y(1)],'Linewidth',2.5,'color',[0.9294  0.6902 0.1294])
plot([L L] ,[0 Y(end)],'Linewidth',2.5,'color',[0.9294  0.6902 0.1294])
area(xs,Y,'FaceColor',[0.9294  0.6902 0.1294],'FaceAlpha',0.5)
xlabel('x(m)');
ylabel('Deflection, y(mm)');
hold off;




end