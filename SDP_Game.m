clear
clc

% --- GAME SETUP ---
sSize = 16; 
zFactor = 1; 
BGC = [217, 135, 41]; 

% Create the game engine object
home_object = simpleGameEngine('custom.png', sSize, sSize, zFactor, BGC);

% --- HOME SCREEN TEXT ---
home_screen_wordsR1 = ['      Kana no Densetsu     '];
home_screen_wordsR2 = [129, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 133];
home_screen_wordsR3 = ['     Please choose mode    '];
home_screen_wordsR4 = ['                           '];
home_screen_wordsR5 = ['       1. Story Mode       '];
home_screen_wordsR6 = ['    2. Infinite Hiragana   '];
home_screen_wordsR7 = ['                           '];
home_screen_wordsR8 = ['    Please click 1 or 2    '];

home_screen_scene = [home_screen_wordsR1; home_screen_wordsR2; ...
    home_screen_wordsR3; home_screen_wordsR4; home_screen_wordsR5;...
    home_screen_wordsR6; home_screen_wordsR7; home_screen_wordsR8];

% --- MAIN LOOP ---
% allows the game to run infinitly until the player compleatly exits out of
% the game. 
flag = true;
while (flag)
    
%------------------------- HOME SCREEN CODE ------------------------------%

    % reads in the audio file
    [bgm, fs] = audioread('02. Beginning of the Journey.mp3');

    % finds the length of the song
    songLength = length(bgm)/fs;

    tic;% starts the timer by getting the system time when the song begins.
    
    musicPlayer = audioplayer(bgm,fs);

    play(musicPlayer);

    % variable to see if the player in on the home screen
    homeScreen = true;

    % while the player in on the home screen the music will play and the
    % user has the opption to choose a mode.
    while homeScreen

        % Draw Home Screen
        drawScene(home_object, home_screen_scene)

        % check for user input
        home_screen_keyboard_input = getKeyboardInput(home_object);
            
        % if the user chose one of the modes homeScreen will be false
        % meaning the home screen loop will end and the mode the player
        % chose will begin. THe "clear sound" ends the song regardless of
        % if it is finished or not.
        if isequal(home_screen_keyboard_input, '1') || isequal(home_screen_keyboard_input, '2')
            homeScreen = false;  % stop home screen loop
            clear sound
        end
    
        % Restart song if it has finished. It knows this because toc is
        % equal to the current system time, tic is equal to when the system
        % began, it then subracts the toc by the tic which becomes the new
        % toc. If toc is greater than or equal to the length of the sont,
        % the song will play agian and tic will reset. 
         if toc >= songLength
             sound(bgm, fs); % will play the song once
             tic;  % reset timer
         end
    end


%-------------------------- DIFFRENT MODES -------------------------------%

    if (isequal(home_screen_keyboard_input,'1'))
        
        % =================================================================
        %                        STORY MODE
        % =================================================================
        
        level = 11;
        score = 0; % Initialize Score
        
        % Loop stops after Level 10 (The last Quiz)
        while level <= 11
            
            % Load the scene text
            current_scene = StoryMode(level);
            
            % Draw the background
            drawScene(home_object, current_scene);
            
            % Initialize text handle array
            hText = []; 
            
            % --- DISPLAY SCORE (ONLY FROM LEVEL 1 ONWARDS) ---
            if level > 0
                text(20, 30, ['Score: ' num2str(score)], 'FontSize', 12, 'Color',[0.8 0.8 0.8]);
            end
            
            fontStyle = {'FontSize', 16, 'Color',[0.8 0.8 0.8]};
            
            % --- DRAW CHARACTERS (Your Coordinates) ---
            if level == 1 % Lesson 1: A and I
                h1 = text(220, 50, 'あ', fontStyle{:}); 
                h2 = text(220, 167, 'い', fontStyle{:}); 
                hText = [h1, h2];
                
            elseif level == 2 % Quiz 1 (Answer: A)
                h1 = text(260, 120, 'あ', fontStyle{:}); 
                h2 = text(260, 165, 'い', fontStyle{:}); 
                hText = [h1, h2];
                
            elseif level == 3 % Lesson 2: U and E
                h1 = text(220, 50, 'う', fontStyle{:});
                h2 = text(220, 167, 'え', fontStyle{:});
                hText = [hText, h1, h2];
                
            elseif level == 4 % Quiz 2 (Answer: E)
                h1 = text(260, 120, 'う', fontStyle{:});
                h2 = text(260, 165, 'え', fontStyle{:});
                hText = [hText, h1, h2];
                
            elseif level == 5 % Lesson 3: O and KA
                h1 = text(220, 50, 'お', fontStyle{:});
                h2 = text(220, 167, 'か', fontStyle{:});
                hText = [hText, h1, h2];
                
            elseif level == 6 % Quiz 3 (Answer: KA)
                h1 = text(260, 120, 'お', fontStyle{:});
                h2 = text(260, 167, 'か', fontStyle{:});
                hText = [hText, h1, h2];
                
            elseif level == 7 % Lesson 4: KI and KU
                h1 = text(220, 50, 'き', fontStyle{:});
                h2 = text(220, 155, 'く', fontStyle{:});
                hText = [hText, h1, h2];
                
            elseif level == 8 % Quiz 4 (Answer: KU)
                h1 = text(260, 120, 'き', fontStyle{:});
                h2 = text(260, 167, 'く', fontStyle{:});
                hText = [hText, h1, h2];
                
            elseif level == 9 % Lesson 5: KE and KO
                h1 = text(220, 55, 'け', fontStyle{:});
                h2 = text(220, 160, 'こ', fontStyle{:});
                hText = [hText, h1, h2];
                
            elseif level == 10 % Quiz 5 (Answer: KO)
                h1 = text(260, 120, 'け', fontStyle{:});
                h2 = text(260, 167, 'こ', fontStyle{:});
                hText = [hText, h1, h2];
            elseif level == 11 % Moving Character mode
                current_scene = StoryMode(level);
            
                % Draw the background
                drawScene(home_object, current_scene);
                getMouseInput(home_object);
                
                % question 1
                score_moving = Moving_Character('い', 'あ', 'i');
                pause(3);
                score = score + score_moving;

                % question 2
                score_moving = Moving_Character('う', 'え', 'U');
                pause(3);
                score = score + score_moving;

                % question 3
                score_moving = Moving_Character('お', 'か', 'O');
                pause(3);
                score = score + score_moving;
                
                % question 4
                score_moving = Moving_Character('き', 'く', 'KI');
                pause(3);
                score = score + score_moving;

                % question 5
                score_moving = Moving_Character('け', 'こ', 'KE');
                pause(3);
                score = score + score_moving;

                

            end
            
            % --- HANDLE INPUT ---
            
            if mod(level, 2) == 1 || level == 0
                % Odd Levels (Lessons) & Level 0: Just Click to continue
                getMouseInput(home_object);
                level = level + 1;
                
            else
                % Even Levels (Quizzes): Logic for Score & Damage
                validKey = false;
                firstAttempt = true; % Reset attempt tracker for this question
                
                while ~validKey
                    key = getKeyboardInput(home_object);
                    
                    if key == '1' || key == '2'
                        
                        % Check which answer is correct based on Level
                        isCorrect = false;
                        if level == 2 && key == '1', isCorrect = true; end
                        if level == 4 && key == '2', isCorrect = true; end
                        if level == 6 && key == '2', isCorrect = true; end
                        if level == 8 && key == '2', isCorrect = true; end
                        if level == 10 && key == '2', isCorrect = true; end
                        
                        if isCorrect
                            % --- SCORING LOGIC ---
                            if firstAttempt
                                score = score + 1;
                                msgbox(['Correct! +1 Point. Total: ' num2str(score)]);
                                pause(2);
                            else
                                score = score + 0.5;
                                msgbox(['Correct! +0.5 Points. Total: ' num2str(score)]);
                                pause(2);
                            end
                            
                            validKey = true; % Break loop to go to next level
                        else
                            % Wrong Answer
                            msgbox('Wrong! You take damage. Try again.');
                            pause(2);
                            firstAttempt = false; % Next guess is worth less
                        end
                    end
                end
                
                pause(1); 
                level = level + 1;
            end
            
            % Cleanup Text
            if ~isempty(hText)
                delete(hText);
            end
        end
        
        % End of Story Mode
        msgbox(['Story Mode Complete! Final Score: ' num2str(score)]);
        flag = false; % Exit Main Menu

    elseif (isequal(home_screen_keyboard_input,'2'))
        
        % =================================================================
        %                     INFINITE HIRAGANA MODE
        % =================================================================

        infinite_instructions = ['                                                              ';
                                 '         WELCOME TO THE INFINITE HIRAGANA MODE WARRIOR        ';
                                 '                                                              ';
                                 '                     BASIC INSTRUCTIONS                       ';
                                 '                                                              ';
                                 ' 1. You will be givin 2 types of questions. the first is      ';
                                 '    multiple choice. The second is fill in the blank.         ';
                                 '                                                              ';
                                 ' 2. This mode will continue until you deside to exit. The goal';
                                 '    is to get the highest score. Each time you get a qustion  ';
                                 '    right on your fist try you will get 1 point. If you get it';
                                 '    wrong on your first try you will be able to try agian.    ';
                                 '    Once you get it right you will only get .5 points.        ';
                                 '                                                              ';
                                 '                    CLICK ON PLAY WHEN READY                  ';
                                 '                                                              ';
                                 '                             PLAY                             ';
                                 '                                                              '];
                                 
        drawScene(home_object, infinite_instructions);
        [r_INFinstructions, c_INFinstructions] = getMouseInput(home_object);

        exit_in_mode = 0; 
        score = 0;
        numTry = 0;
        
        while exit_in_mode == 0
            % reset numTry
            numTry = 0;

            clf;

            question_type = randi([1, 2]); % Randomly choose type 1 or 2

            % call the ranQuestion.m function
            [question, output1, output2, output3, output4, correct_english] = ranQuestion(1,10, question_type);
    
            % multiple choice
            if question_type == 1 

                % creates a vector with the outputs of the ranQuestion.m
                % function.
                options = {output1, output2, output3, output4};

                % reoranges them in a random order
                shuffled_order = randperm(4);
                options = options(shuffled_order);

                % sets the correct one 
                correct_position = find(shuffled_order == 1);
    
                % draws the question
                drawScene(home_object, question)

                % output the score, english, and japanese
                text(100, 10, num2str(score), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % score
                text(320, 25, correct_english, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % english
                text(50, 75, options(1), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % 1.
                text(390, 75, options(2), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % 2.
                text(50, 105, options(3), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % 3.
                text(390, 105, options(4), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % 4.
    
                % will hold user's choice
                userCh = 0;

                % will allow the user to guess until they get it right or
                % choose to exit. 
                while userCh ~= correct_position
                    [r_multiple_choice, c_multiple_choice] = getMouseInput(home_object);
                    
                    % sets the user's choice
                    if r_multiple_choice == 5 && c_multiple_choice >= 1 && c_multiple_choice <= 22
                        userCh = 1; 
                        numTry = numTry + 1; % increse number of trys
                    elseif r_multiple_choice == 5 && c_multiple_choice >= 22 && c_multiple_choice <= 45
                        userCh = 2; 
                        numTry = numTry + 1; % increse number of trys
                    elseif r_multiple_choice == 7 && c_multiple_choice >= 1 && c_multiple_choice <= 22
                        userCh = 3; 
                        numTry = numTry + 1; % increse number of trys
                    elseif r_multiple_choice == 7 && c_multiple_choice >= 22 && c_multiple_choice <= 45
                        userCh = 4; 
                        numTry = numTry + 1; % increse number of trys
                    elseif r_multiple_choice == 1 && c_multiple_choice >= 42 && c_multiple_choice <= 45
                        exit_in_mode = 1; % sets exit_in_mode to 1 wich will take them back to the home screen
                        break; % breaks out of the loop
                    end
    
                    % if the user choose the wrong option they will be told
                    % to try agian
                    if userCh ~= correct_position
                        msgbox('Wrong! Try again.');
                        pause(3);
                    end
                end
                
                if exit_in_mode == 0
                    %if they chose the right answer they will be told so.
                    msgbox('Correct!!!');
    
                    % if they got the question right on their fist try, their
                    % score will go up by 1. if they took more than one try
                    % their score will go up by .5.
                    if numTry == 1
                        score = score + 1;
                    else
                        score = score + .5;
                    end
                    pause(2); % pauses for 2 seconds
                    clf; % clears the figure 
                end
    

            % fill in the blank
            elseif question_type == 2 
                %clf;
                
                % call the ranQuestion.m function with a ristriction on the
                % outputs.
                [question, output1, output2, output3, output4, correct_english] = ranQuestion(1,5, question_type);
                
                % draws the question
                drawScene(home_object, question)
                text(100, 10, num2str(score), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % score 
                text(615, 25, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana 

                % will be used to hold the user's input
                userinput = " ";

                % will allow them to try until they get it right or exit. 
                while ~isequal(userinput, correct_english)
                   
                    % gives the player a chance to exit.
                    [r_fill, c_fill] = getMouseInput(home_object);
                    if r_fill == 1 && c_fill >= 37 && c_fill <= 40
                        exit_in_mode = 1; % sets exit_in_mode to 1 wich will take them back to the home screen
                        break; % breaks out of the loop
                    end
                    
                    % takes in the user's input
                    userinput = getKeyboardInput(home_object);

                    % displays the user's input
                    text(120, 80, userinput, 'FontSize', 30, 'Color',[0.8 0.8 0.8]);

                    % check to see if it was right.
                    if ~isequal(userinput, correct_english)
                        numTry = numTry + 1; % increse number of trys
                        msgbox('Wrong! Try again.'); % tell them to try again
                        pause(3); % pause for 3 seconds
                        clf; % clears the firge

                        % redraws the question
                        drawScene(home_object, question)
                        text(100, 10, num2str(score), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
                        text(615, 25, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]);     
                     end
                end

                numTry = numTry + 1; % increse number of trys

                if exit_in_mode == 0
                    %if they input the right answer they will be told so.
                    msgbox('Correct!!!');
    
                    % if they got the question right on their fist try, their
                    % score will go up by 1. if they took more than one try
                    % their score will go up by .5.
                    if numTry == 1
                        score = score + 1; 
                    else
                        score = score + .5; 
                    end
    
                    pause(2); % pauses for 2 seconds 
                    clf; % clears the firgure
                end
            end
        end

        % creating the final score scene when exiting the infinite hiragana
        % mode.
        final_sceneP1 = ['Thank you for playing. You are on your';
                         'way to becoming a hiragana master.    ';
                         '                                      '];
        final_sceneP2 = [1,129,1,1,1,1,1,1,1,1,133,1,1,1,1,1,1,1,1,1,1,1,1 ...
                         1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
        final_sceneP3 = ['                                      ';
                         'Please click anywhere to return to the';
                         'home screen.                          '];
        final_scene =[final_sceneP1;final_sceneP2;final_sceneP3];

        % drawing the scene and outputing their finale score.
        drawScene(home_object,final_scene);
        text(40, 57,'Final Score:','FontSize', 25, 'Color',[0.8 0.8 0.8])
        text(130, 57, num2str(score),'FontSize', 25, 'Color',[0.8 0.8 0.8])
        
        % get mouse input to return to the home screen.
        [r_exit, c_exit] = getMouseInput(home_object);

        pause(1) % pauses for 1 second
        clf; % clears the figure to return to the home screen
    else
        % if the user chooses anything other than 1 or 2 they will be told
        % to rechoose. 
        msgbox("PLEASE ENTER A VALID CHOICE (1 OR 2)");
        pause(3) 
    end
end