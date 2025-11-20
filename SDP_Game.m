clear
clc
% Home screen code 97

sSize = 16; % Sprite size based on the actual size of the sprite sheet.

zFactor = 1; % Zoom factor, based on how big you want to the displayed 
% images to be. 

BGC = [255,161,0]; % Background color, RBG values. (brown)

% Creats a simpleGameEngine object with the parameters sSize, zFactor, BCG,
% and the retro_pack.png
home_object = simpleGameEngine('custom.png', sSize, sSize, zFactor, BGC);



home_screen_wordsR1 = ['        Kana no Densetsu          '];
%homeLength = length(home_screen_wordsR1)     
home_screen_wordsR2 = [129, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 129];   

home_screen_wordsR3 = ['       Please choose mode         '];
home_screen_wordsR4 = ['          1. Story Mode           '];
home_screen_wordsR5 = ['          2. Infinite free play   '];
home_screen_wordsR6 = ['                                  '];
home_screen_wordsR7 = ['       Please click 1 or 2        '];


home_screen_scene = [home_screen_wordsR1;home_screen_wordsR2;...
    home_screen_wordsR3;home_screen_wordsR4;home_screen_wordsR5;...
    home_screen_wordsR6;home_screen_wordsR7];


drawScene(home_object,home_screen_scene)


   drawSce