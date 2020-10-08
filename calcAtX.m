function [SF, BM,F1,F2]= calcAtX(DataIn,x)

P=DataIn{1};
U=DataIn{2};
T=DataIn{3};
R=DataIn{4};
% X=DataIn{5};
S=DataIn{6};

  Wsf=0;      Wbm=0;       Wf1=0;    Wf2=0;
    for j=1:numel(U(:,1))
        Wsf=  Wsf +  (U(j,3)*(x-U(j,1))*(x>=U(j,1))) - (U(j,3)*(x-U(j,2))*(x>=U(j,2)));
        Wbm=  Wbm +  (U(j,3)*0.5* ((x-U(j,1))^2) *(x>=U(j,1))) - (U(j,3)*0.5* ((x-U(j,2))^2) *(x>=U(j,2)));
        Wf1=  Wf1 +  (U(j,3)*0.1667* ((x-U(j,1))^3) *(x>=U(j,1))) - (U(j,3)*0.1667* ((x-U(j,2))^3) *(x>=U(j,2)));
        Wf2=  Wf2 +  (U(j,3)*0.041667* ((x-U(j,1))^4) *(x>=U(j,1))) - (U(j,3)*0.041667* ((x-U(j,2))^4) *(x>=U(j,2)));
    end
    
    
    Psf=0;    Pbm=0;       Pf1=0;     Pf2=0;
    for j=1:numel(P(:,1))
        Psf= Psf + P(j,2)*(x>=P(j,1));
        Pbm= Pbm + P(j,2)*  ((x-P(j,1))^1) * (x>=P(j,1));
        Pf1= Pf1 + P(j,2)*0.5*  ((x-P(j,1))^2) * (x>=P(j,1));
        Pf2= Pf2 + P(j,2)*0.1667*  ((x-P(j,1))^3) * (x>=P(j,1));
    end
    
    Rsf=0;     Rbm=0;    Rf1=0;    Rf2=0;
    for j=1:2
        Rsf= Rsf + R(j)* (x>=S(j));
        Rbm= Rbm + R(j)* ((x-S(j))^1) * (x>=S(j));
        Rf1= Rf1 + R(j)* 0.5*((x-S(j))^2) * (x>=S(j));
        Rf2= Rf2 + R(j)* 0.1667*((x-S(j))^3) * (x>=S(j));
    end
    
    Tbm=0;  Tf1=0;  Tf2=0;
    for j=1:numel(T(:,1))
        Tbm= Tbm  +     T(j,2)* ((x-T(j,1))^0)* (x>=T(j,1));
        Tf1= Tf1  +     T(j,2)* ((x-T(j,1))^1)* (x>=T(j,1));
        Tf2= Tf2  +     T(j,2)*0.5* ((x-T(j,1))^2)* (x>=T(j,1));
    end
    
    
     Vsf=0;      Vbm=0;       Vf1=0;    Vf2=0;
    for j=1:numel(U(:,1))
        K=    (V(j,4)-V(j,3))/(V(j,2)-V(j,1))
        Vsf=  Vsf +  (U(j,3)*(x-U(j,1))*(x>=U(j,1))) - (U(j,3)*(x-U(j,2))*(x>=U(j,2)));
        Wbm=  Wbm +  (U(j,3)*0.5* ((x-U(j,1))^2) *(x>=U(j,1))) - (U(j,3)*0.5* ((x-U(j,2))^2) *(x>=U(j,2)));
        Wf1=  Wf1 +  (U(j,3)*0.1667* ((x-U(j,1))^3) *(x>=U(j,1))) - (U(j,3)*0.1667* ((x-U(j,2))^3) *(x>=U(j,2)));
        Wf2=  Wf2 +  (U(j,3)*0.041667* ((x-U(j,1))^4) *(x>=U(j,1))) - (U(j,3)*0.041667* ((x-U(j,2))^4) *(x>=U(j,2)));
    end
    
    
    
    SF= Wsf + Psf + Rsf ;
    BM= Wbm + Pbm + Rbm + Tbm;
    F1=Wf1+Pf1+Rf1+Tf1;
    F2=Wf2+Pf2+Rf2+Tf2;
end
