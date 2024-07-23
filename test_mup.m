% TEST_MUP
% Testuje parametre zadane v PARAM_MUP
% Ak su zadane parametre v poriadku, spusti sa MUP
%



% Cast priradenia povodnych hodnot parametrov, ktore nebli teraz zadane

      if(ic(1,1)==0)
        Qksi0=ksi0;
      end
      
      if(ic(1,2)==0)
        Qw0=w0;
      end

% Cast priradenia korektne zadnaych parametrov

      if(ic(1,1)==1&&test_cor(Qksi0)==1&&Qksi0>0&&Qksi0<=1)
            ksi0=Qksi0;
      end
          
      if(ic(1,2)==1&&test_cor(Qw0)==1&&Qw0<0)
            w0=Qw0;
      end
      
% Cast hladania nekorektnych udajov

if(test_cor(Qw0,Qksi0)~=1)
    pth_fig = ptg_error('param_mup',ptg_string(9,1,ptv_str_lang),ptv_str_lang);

elseif (Qksi0<=0||Qksi0>1)
    pth_fig = ptg_error('param_mup',ptg_string(9,4,ptv_str_lang),ptv_str_lang);

elseif(Qw0>=0)
    pth_fig = ptg_error('param_mup',ptg_string(11,25,ptv_str_lang),ptv_str_lang);
    
else
      % Otocenie znamienka kvoli vypoctu
      w0=-w0;
      
      % Vygenerovanie referencneho polynomu pre zadane w0 a ksi0
      if(typy_n==1)
          
      if(J3==1&&n==1)                       % P
          ref = [1 w0];
      elseif(J3==1&&n==2)                   % P + s0
          ref = [1 2*ksi0*w0 w0^2];
      elseif(J3==2&&n==1)                   % PI
          ref = [1 w0];
      elseif(J3==2&&n==2)                   % PI + s0
          ref = [1 2*ksi0*w0 w0^2];
      elseif(J3==3&&n==2)                   % PID
          ref = [1 (2*ksi0*w0+w0) (w0^2+2*ksi0*w0^2) w0^3];
      elseif(J3==3&&n==3)                   % PID + s0
          ref = [1 (2*ksi0*w0+2*w0) (2*w0^2+2*ksi0*w0^2+2*ksi0^2) (2*w0^3+2*ksi0*w0^3) w0^3];
      elseif(J3==4&&n==2)                   % PD
          ref = [1 2*ksi0*w0 w0^2];
      else(J3==4&&n==3)                   % PD + s0
          ref = [1 (2*ksi0*w0+w0) (w0^2+2*ksi0*w0^2) w0^3];
      end
      
      % Vygenerovanie referencneho polynomu pre zadane w0 a zvoleny polynom
      elseif(typy_n>1)
          
          if((n==1)&&(J3==1||J3==2))                % ref. polynom 1. radu
              ref = [1 w0];              
          elseif((n==2)&&(J3==1||J3==2||J3==4))     % ref. polynom 2. radu
              if(typy_n==2)
                  ref = [1 2*w0 w0^2];
              elseif(typy_n==3)
                  ref = [1 1.4*w0 w0^2];
              elseif(typy_n==4)
                  ref = [1 1.4*w0 w0^2];
              else(typy_n==5)
                  ref = [1 1.4*w0 w0^2];
              end
          elseif((n==3&&J3==4)||(n==2&&J3==3))      % ref. polynom 3. radu
              if(typy_n==2)
                  ref = [1 3*w0 3*w0^2 w0^3];
              elseif(typy_n==3)
                  ref = [1 2*w0 2*w0^2 w0^3];
              elseif(typy_n==4)
                  ref = [1 1.55*w0 2.1*w0^2 w0^3];
              else(typy_n==5)
                  ref = [1 1.75*w0 2.15*w0^2 w0^3];
              end
          else(n==3&&J3==3)                         % ref. polynom 4. radu
              if(typy_n==2)
                  ref = [1 4*w0 6*w0^2 4*w0^3 w0^4];
              elseif(typy_n==3)
                  ref = [1 2.6*w0 3.4*w0^2 2.6*w0^3 w0^4];
              elseif(typy_n==4)
                  ref = [1 1.6*w0 3.15*w0^2 2.45*w0^3 w0^4];
              else(typy_n==5)
                  ref = [1 2.1*w0 3.4*w0^2 2.7*w0^3 w0^4];
              end
          end
      
      % Otocenie referencneho polynomu
      ref2=ref;
      for i=1:length(j)
        ref(i)=ref2(end+1-i);
      end
      clear('ref2')
      
      % Koniec generovania referencneho polynomu
      end
      
      mup
  end