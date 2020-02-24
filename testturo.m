% TESTTURO_PI
% Testuje spravnost zadania prametra TURO v 
% Metode priamej szntezy s pouzitim aproximovaneho modelu URO (PI_PARAM) a
% Riverovej - Morariho metode a Riverovej - Morariho metode (spresneny) (PI_PARAM)
% pomocou pomocnej premennej ic3
% Premenna ic4 zabezpecuje vypocet parametrov regulatora az po korektnom
% zadani Turo (pre ic4==1)

% Copyright is with the following author(s):
%
% (c) 2012 Juraj Oravec, Slovak University of Technology in Bratislava,
% juraj.oravec@stuba.sk
% (c) 2012 Monika Bakosova, Slovak University of Technology in Bratislava,
% monika.bakosova@stuba.sk
% ------------------------------------------------------------------------------
% Legal note:
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public
% License along with this library; if not, write to the
% Free Software Foundation, Inc.,
% 59 Temple Place, Suite 330,
% Boston, MA 02111-1307 USA
%
% ------------------------------------------------------------------------------


ic4=0;

if(ic3==0|test_cor(QTuro)~=1)
    pth_fig = ptg_error(naspat,ptg_string(9,1,ptv_str_lang),ptv_str_lang);

else

if(ic3(1,1)==1)
        Turo=QTuro;
end
    ic4=1;
end