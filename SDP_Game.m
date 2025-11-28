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
    %drawScene(home_object,home_screen_scene)

    % create a while loop that will loop until the user enters a valid
    % choice for the keyboard input of choosing a mode.
    flag = true;
    while (flag)
        % draw the scene with all the background color and texts and sprites
        drawScene(home_object,home_screen_scene) 
 
        % take the keyboard input from the user according to what game mode
        % they need to play
        home_screen_keyboard_input = getKeyboardInput(home_object);

        % check for equalities and enter into the respective functions. 
        if (isequal(home_screen_keyboard_input,'1'))
            
        % Level 0: Instructions
        % Level 1, 3, 5, 7, 9: Lessons
        % Level 2, 4, 6, 8, 10: Quizzes
        % Level 11: Final Map
        
        level = 0;
        
        % Loop until we reach the last level
        while level <= 10
            
            % Load the scene text/matrix from StoryMode.m
            current_scene = StoryMode(level);
            
            % Draw the background scene (text and brackets)
            drawScene(home_object, current_scene);
            
            % We must use the text() function because custom.png has no
            % Hiragana characters
            % We store the text objects in 'hText' so we can delete them later.
            hText = []; 
            
            % Define standard font style
            fontStyle = {'FontSize', 16, 'Color',[0.8 0.8 0.8]};
            
            % Coordinates are guessed: (X, Y). X ~ column*16, Y ~ row*16.
            
            if level == 1 % Lesson 1: A and I
                h1 = text(220, 50, 'あ', fontStyle{:}); % Matches for A with the proper row and column
                h2 = text(220, 150, 'い', fontStyle{:}); % Matches for I with the proper row and column
                hText = [h1, h2];
                
            elseif level == 2 % Quiz 1 (Answer: A)
                h1 = text(260, 120, 'あ', fontStyle{:}); % Option 1
                h2 = text(260, 150, 'い', fontStyle{:}); % Option 2
                hText = [h1, h2];
                
            elseif level == 3 % Lesson 2: U and E
                h1 = text(220, 50, 'う', fontStyle{:});
                h2 = text(220, 150, 'え', fontStyle{:});
                hText = [h1, h2];
                
            elseif level == 4 % Quiz 2 (Answer: E)
                h1 = text(260, 120, 'う', fontStyle{:});
                h2 = text(260, 150, 'え', fontStyle{:});
                hText = [h1, h2];
                
            elseif level == 5 % Lesson 3: O and KA
                h1 = text(220, 50, 'お', fontStyle{:});
                h2 = text(220, 150, 'か', fontStyle{:});
                hText = [h1, h2];
                
            elseif level == 6 % Quiz 3 (Answer: KA)
                h1 = text(260, 120, 'お', fontStyle{:});
                h2 = text(260, 150, 'か', fontStyle{:});
                hText = [h1, h2];
                
            elseif level == 7 % Lesson 4: KI and KU
                h1 = text(220, 50, 'き', fontStyle{:});
                h2 = text(220, 150, 'く', fontStyle{:});
                hText = [h1, h2];
                
            elseif level == 8 % Quiz 4 (Answer: KU)
                h1 = text(260, 120, 'き', fontStyle{:});
                h2 = text(260, 150, 'く', fontStyle{:});
                hText = [h1, h2];
                
            elseif level == 9 % Lesson 5: KE and KO
                h1 = text(220, 55, 'け', fontStyle{:});
                h2 = text(220, 150, 'こ', fontStyle{:});
                hText = [h1, h2];
                
            elseif level == 10 % Quiz 5 (Answer: KO)
                h1 = text(260, 120, 'け', fontStyle{:});
                h2 = text(260, 150, 'こ', fontStyle{:});
                hText = [h1, h2];
            end
            
            % 4. HANDLE USER INPUT
            
            if level == 11
                
                break; % Exit the story loop to start map gameplay
                
            elseif mod(level, 2) == 1 || level == 0
                % ODD LEVELS (Lessons) & LEVEL 0 (Instructions)
                % Just wait for a mouse click to proceed
                getMouseInput(home_object);
                
                % Move to next level
                level = level + 1;
                
            else
                % EVEN LEVELS (Quizzes)
                % Wait for Keyboard Input (1 or 2)
                validKey = false;
                while ~validKey
                    key = getKeyboardInput(home_object);
                    
                    if key == '1' || key == '2'
                        validKey = true;
                        
                        % --- DAMAGE LOGIC ---
                        % Define correct answers for each quiz level
                        % Quiz 1 (Lvl 2): A (Opt 1)
                        % Quiz 2 (Lvl 4): E (Opt 2)
                        % Quiz 3 (Lvl 6): KA (Opt 2)
                        % Quiz 4 (Lvl 8): KU (Opt 2)
                        % Quiz 5 (Lvl 10): KO (Opt 2)
                        
                        isCorrect = false;
                        if level == 2 && key == '1', isCorrect = true; end
                        if level == 4 && key == '2', isCorrect = true; end
                        if level == 6 && key == '2', isCorrect = true; end
                        if level == 8 && key == '2', isCorrect = true; end
                        if level == 10 && key == '2', isCorrect = true; end
                        
                        if isCorrect
                            msgbox('Correct! The Demon takes damage.');
                        else
                            msgbox('Wrong! You take damage.');
                        end
                        
                        % Allows user to read message before moving on
                        pause(2); 
                        level = level + 1;
                    end
                end
            end
            
            % 5. CLEANUP
            % Delete the Japanese text so it doesn't stay on screen for the next scene
            if ~isempty(hText)
                delete(hText);
            end
        end
        
        flag = false; % Exit main menu loop


        elseif (isequal(home_screen_keyboard_input,'2'))
            
            % INFINITE HIRAGANA MODE

            % the instructions for the infinite hiragana mode
            infinite_instructions = ['                                                              ';
                                     '         WELCOME TO THE INFINITE HIRAGANA MODE WARRIOR        ';
                                     '                                                              ';
                                     '                     BASIC INSTRUCTIONS                       ';
                                     '                                                              ';
                                     ' 1. You will be givin 3 types of questions. the first is      ';
                                     '    multiple choice. The second is fill in the blank. And the ';
                                     '    third is a moving question.                               ';
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
                                     
            % output the instructions
            drawScene(home_object, infinite_instructions);

            % move on when the user clicks play
            [r_INFinstructions, c_INFinstructions] = getMouseInput(home_object);


            % variable that will be used to know when to exit the mode
            exit_in_mode = 0; 

            % variable that will keep track of the player's score
            score = 0;

            % variable that will be used to keep track of the
            % number of trys.
            numTry = 0;
            
            while exit_in_mode == 0
    
                % call the ranQuestion.m function. It takes in a starting
                % number of 1 and an ending number of 10. It will then
                % output the type of question, the question itself, the 4
                % diffrent hiragana and the english equivalent of the
                % correct hiragana option. 
                [question_type, question, output1, output2, output3, output4, correct_english] = ranQuestion(1,10);
    
                
                if question_type == 1 % multiple choice

                    % creates a vector set to the output options
                    options = {output1, output2, output3, output4};
    
                    % creates a random perutation of the 4 options
                    shuffled_order = randperm(4);
    
                    % reorders options acording to the random permutation to
                    % output the correct answer in diffrent places each time. 
                    options = options(shuffled_order);
    
                    % tracks the position of the correct option 
                    correct_position = find(shuffled_order == 1);
    
                    % Draws the multiple choice question from the StoryMode.m
                    % function. Uses the text function to output the hiragana
                    % and english equivalent. 
                    drawScene(home_object, question)
                    text(100, 10, num2str(score), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % score
                    text(320, 25, correct_english, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % english
                    text(50, 75, options(1), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % 1.
                    text(390, 75, options(2), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % 2.
                    text(50, 105, options(3), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % 3.
                    text(390, 105, options(4), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % 4.
    
                    % variable that will be used to check if the user clicked
                    % the right option.
                    userCh = 0;
    
                    % will run until the user picks the right option
                    while userCh ~= correct_position

                        % gets mouse input which determines which option the 
                        % user picked 
                        [r_multiple_choice, c_multiple_choice] = getMouseInput(home_object);
        
                        % sets userCh to the user's choice depending on where
                        % they click the screen. 
                        if r_multiple_choice == 5 && c_multiple_choice >= 1 && c_multiple_choice <= 22
                            userCh = 1;
                            numTry = numTry + 1; % increase number of trys
                        elseif r_multiple_choice == 5 && c_multiple_choice >= 22 && c_multiple_choice <= 45
                            userCh = 2;
                            numTry = numTry + 1; % increase number of trys
                        elseif r_multiple_choice == 7 && c_multiple_choice >= 1 && c_multiple_choice <= 22
                            userCh = 3;
                            numTry = numTry + 1; % increase number of trys
                        elseif r_multiple_choice == 7 && c_multiple_choice >= 22 && c_multiple_choice <= 45
                            userCh = 4;
                            numTry = numTry + 1; % increase number of trys
                        elseif r_multiple_choice == 1 && c_multiple_choice >= 42 && c_multiple_choice <= 45
                            exit_in_mode = 1; % the user clicked exit
                            break; % exit the while userCh ~= correct_position
                        end
    
                        % Give feedback if wrong
                        if userCh ~= correct_position
                            msgbox('Wrong! Try again.');
                            pause(3);
                        end
                    end

                    % congratulate player for getting it right 
                    if exit_in_mode == 0
                        msgbox('Correct!!!');

                        % increase score by the correct amount depending on
                        % the amount of trys. 
                        if numTry == 1
                            score = score + 1;
                        else
                            score = score + .5;
                        end
                        
                        pause(2);
                        clf; % clear the figure before generating a new question
                    end
    
                elseif question_type == 2 % fill in the blank
    
                    [question_type, question, output1, output2, output3, output4, correct_english] = ranQuestion(1,5);

                    drawScene(home_object, question)
                    text(100, 10, num2str(score), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % score
                    text(615, 25, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]);

                    userinput = " ";

                    while ~isequal(userinput, correct_english)
                        userinput = " ";

                        [r_fill, c_fill] = getMouseInput(home_object)
                        if r_fill == 1 && c_fill >= 37 && c_fill <= 40
                                exit_in_mode = 1; % the user clicked exit
                                break; % exit the while userCh ~= correct_position
                        end
                        userinput = getKeyboardInput(home_object)
                        text(120, 80, userinput, 'FontSize', 30, 'Color',[0.8 0.8 0.8]);

                        if ~isequal(userinput, correct_english)
                            numTry = numTry + 1;
                            msgbox('Wrong! Try again.');
                            pause(3);
                        end

                    end

                    numTry = numTry + 1;
                    msgbox('Correct!!!');
                    % increase score by the correct amount depending on
                    % the amount of trys. 
                    if numTry == 1
                        score = score + 1;
                    else
                        score = score + .5;
                    end

                    pause(2);
                    clf; % clear the figure before generating a new question
    
                end

            end 
            
            % will pause for 1 second before going back to the home screne
            pause(1)

        else
            msgbox("PLEASE ENTER A VALID CHOICE (1 OR 2)");
            pause(3) % pauses in the msgbox for 3 seconds for the user to read the error.
        end
        
    end


