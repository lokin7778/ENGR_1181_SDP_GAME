clear
clc

% --- GAME SETUP ---
sSize = 16; 
zFactor = 1; 
BGC = [217, 135, 41]; 

% Create the game engine object
home_object = simpleGameEngine('custom.png', sSize, sSize, zFactor, BGC);

% --- HOME SCREEN TEXT ---
home_screen_wordsR1 = ['           Kana no Densetsu          '];
home_screen_wordsR2 = [129, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 129];
home_screen_wordsR3 = ['          Please choose mode         '];
home_screen_wordsR4 = ['                                     '];
home_screen_wordsR5 = ['            1. Story Mode            '];
home_screen_wordsR6 = ['         2. Infinite Hiragana        '];
home_screen_wordsR7 = ['                                     '];
home_screen_wordsR8 = ['         Please click 1 or 2         '];

home_screen_scene = [home_screen_wordsR1; home_screen_wordsR2; ...
    home_screen_wordsR3; home_screen_wordsR4; home_screen_wordsR5;...
    home_screen_wordsR6; home_screen_wordsR7; home_screen_wordsR8];

% --- MAIN LOOP ---
flag = true;
while (flag)
    
    % Draw Home Screen
    drawScene(home_object, home_screen_scene) 
    home_screen_keyboard_input = getKeyboardInput(home_object);

    if (isequal(home_screen_keyboard_input,'1'))
        
        % =================================================================
        %                        STORY MODE
        % =================================================================
        
        level = 0;
        score = 0; % Initialize Score
        
        % Loop stops after Level 10 (The last Quiz)
        while level <= 10
            
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
                                 
        drawScene(home_object, infinite_instructions);
        [r_INFinstructions, c_INFinstructions] = getMouseInput(home_object);

        exit_in_mode = 0; 
        score = 0;
        numTry = 0;
        
        while exit_in_mode == 0
            [question_type, question, output1, output2, output3, output4, correct_english] = ranQuestion(1,10);
    
            if question_type == 1 
                options = {output1, output2, output3, output4};
                shuffled_order = randperm(4);
                options = options(shuffled_order);
                correct_position = find(shuffled_order == 1);
    
                drawScene(home_object, question)
                text(100, 10, num2str(score), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
                text(320, 25, correct_english, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
                text(50, 75, options(1), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
                text(390, 75, options(2), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
                text(50, 105, options(3), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
                text(390, 105, options(4), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
    
                userCh = 0;
                while userCh ~= correct_position
                    [r_multiple_choice, c_multiple_choice] = getMouseInput(home_object);
                    if r_multiple_choice == 5 && c_multiple_choice >= 1 && c_multiple_choice <= 22
                        userCh = 1; numTry = numTry + 1; 
                    elseif r_multiple_choice == 5 && c_multiple_choice >= 22 && c_multiple_choice <= 45
                        userCh = 2; numTry = numTry + 1; 
                    elseif r_multiple_choice == 7 && c_multiple_choice >= 1 && c_multiple_choice <= 22
                        userCh = 3; numTry = numTry + 1; 
                    elseif r_multiple_choice == 7 && c_multiple_choice >= 22 && c_multiple_choice <= 45
                        userCh = 4; numTry = numTry + 1; 
                    elseif r_multiple_choice == 1 && c_multiple_choice >= 42 && c_multiple_choice <= 45
                        exit_in_mode = 1; break; 
                    end
    
                    if userCh ~= correct_position
                        msgbox('Wrong! Try again.');
                        pause(3);
                    end
                end

                if exit_in_mode == 0
                    msgbox('Correct!!!');
                    if numTry == 1, score = score + 1; else, score = score + .5; end
                    pause(2); clf; 
                end
    
            elseif question_type == 2 
                [question_type, question, output1, output2, output3, output4, correct_english] = ranQuestion(1,5);
                drawScene(home_object, question)
                text(100, 10, num2str(score), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
                text(615, 25, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]);

                userinput = " ";
                while ~isequal(userinput, correct_english)
                    userinput = " ";
                    [r_fill, c_fill] = getMouseInput(home_object);
                    if r_fill == 1 && c_fill >= 37 && c_fill <= 40
                            exit_in_mode = 1; break; 
                    end
                    userinput = getKeyboardInput(home_object);
                    text(120, 80, userinput, 'FontSize', 30, 'Color',[0.8 0.8 0.8]);

                    if ~isequal(userinput, correct_english)
                        numTry = numTry + 1;
                        msgbox('Wrong! Try again.');
                        pause(3); clf;
                        drawScene(home_object, question)
                        text(100, 10, num2str(score), 'FontSize', 25, 'Color',[0.8 0.8 0.8]); 
                        text(615, 25, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]);     
                     end
                end
                numTry = numTry + 1;
                msgbox('Correct!!!');
                if numTry == 1, score = score + 1; else, score = score + .5; end
                pause(2); clf; 
            end
        end 
        pause(1)
    else
        msgbox("PLEASE ENTER A VALID CHOICE (1 OR 2)");
        pause(3) 
    end
end