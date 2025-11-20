clear
clc
% Home screen code 97

sSize = 16; % Sprite size based on the actual size of the sprite sheet.

zFactor = 1; % Zoom factor, based on how big you want to the displayed 
% images to be. 

BGC = [217, 135, 41]; % Background color, RBG values. ()

% Creats a simpleGameEngine object with the parameters sSize, zFactor, BCG,
% and the retro_pack.png
home_object = simpleGameEngine('custom.png', sSize, sSize, zFactor, BGC);



% creates the vectors which hold the text that will be displayed on the
% screen.
home_screen_wordsR1 = ['           Kana no Densetsu          '];

home_screen_wordsR2 = [129, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 129];

home_screen_wordsR3 = ['          Please choose mode         '];
home_screen_wordsR4 = ['                                     '];
home_screen_wordsR5 = ['            1. Story Mode            '];
home_screen_wordsR6 = ['        2. Infinite free play        '];
home_screen_wordsR7 = ['                                     '];
home_screen_wordsR8 = ['         Please click 1 or 2         '];

% Creates a vector of the different text-holder vecotrs above
home_screen_scene = [home_screen_wordsR1; home_screen_wordsR2; ...
    home_screen_wordsR3; home_screen_wordsR4; home_screen_wordsR5;...
    home_screen_wordsR6; home_screen_wordsR7; home_screen_wordsR8];

% draw the scene with all the background color and texts and sprites
drawScene(home_object,home_screen_scene)

