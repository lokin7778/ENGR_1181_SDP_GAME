clear
clc
% Home screen code 

    sSize = 16; % Sprite size based on the actual size of the sprite sheet.
    
    zFactor = 1; % Zoom factor, based on how big you want to the displayed 
    % images to be. 
    
    BGC = [217, 135, 41]; % Background color, RBG values. ()
    
    % Creats a simpleGameEngine object with the parameters sSize, zFactor, BCG,
    % and the custom.png
    home_object = simpleGameEngine('custom.png', sSize, sSize, zFactor, BGC);
    
    
    
    % creates the vectors which hold the text that will be displayed on the
    % screen.
    home_screen_wordsR1 = ['           Kana no Densetsu          '];
    
    home_screen_wordsR2 = [129, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 129];
    
    home_screen_wordsR3 = ['          Please choose mode         '];
    home_screen_wordsR4 = ['                                     '];
    home_screen_wordsR5 = ['            1. Story Mode            '];
    home_screen_wordsR6 = ['         2. Infinite Hiragana        '];
    home_screen_wordsR7 = ['                                     '];
    home_screen_wordsR8 = ['         Please click 1 or 2         '];
    
    % Creates a vector of the different text-holder vecotrs above
    home_screen_scene = [home_screen_wordsR1; home_screen_wordsR2; ...
        home_screen_wordsR3; home_screen_wordsR4; home_screen_wordsR5;...
        home_screen_wordsR6; home_screen_wordsR7; home_screen_wordsR8];
    
    % draw the scene with all the background color and texts and sprites
    drawScene(home_object,home_screen_scene)

    % create a while loop that will loop until the user enters a valid
    % choice for the keyboard input of choosing a mode.
    flag = true;
    while (flag)
 
        % take the keyboard input from the user according to what game mode
        % they need to play
        home_screen_keyboard_input = getKeyboardInput(home_object);

        % check for equalities and enter into the respective functions. 
        if (isequal(home_screen_keyboard_input,'1'))
            
            % STORY MODE

            % used to count the level. The first is level 0 which is the
            % instructions. 
            level = 0;

            % creates a scene equal to the output of the StoryMode.m
            % function. The input is the level. It will choose which scene
            % to output based on the level. 
            story_instructions = StoryMode(level);

            % draws the scene from the StoryMode.m function
            drawScene(home_object, story_instructions)

            % gets mouse input which determines when the user has to play
            [r_instructions, c_instructions] = getMouseInput(home_object)

            % checks what is the mouse input and branches if the row and column
            % are within that treshold.
            if (r_instructions==25 && ( c_instructions>=22 && c_instructions<=25))
                level = level + 1;
                story_introduction = StoryMode(level); % calls the function again
                drawScene(home_object, story_introduction);
                
            end

            flag = false;

        elseif (isequal(home_screen_keyboard_input,'2'))
            
            % INFINITE HIRAGANA MODE

            % check to see if the ranQustion.m function correctly generates
            % 4 diffrent hiragana
            [output1, output2, output3, output4] = ranQuestion(1,10)
            ...
            flag = false;

        else
            msgbox("PLEASE ENTER A VALID CHOICE (1 OR 2)");
            pause(3) % pauses in the msgbox for 3 seconds for the user to read the error.
        end
        
    end


