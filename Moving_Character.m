function score_moving = Moving_Character(level, correctHiragana, wrongHiragana, correctEnglish)


    % The protagonist sprite 
    % Create the scene

    border_outline_topleft = 130;
    border_outline_topright = 132;
    border_outline_bottomleft = 194;
    border_outline_bottomright = 196;
    border_outline_left = 162;
    border_outline_right = 164;
    border_top_top = 131;
    border_bottom_bottom = 195;
    
    cinScene = simpleGameEngine("custom.png",16,16,5,[217, 135, 41]);
    displayBox = ones(12,20);

    border_top = [border_outline_topleft,repmat(border_top_top,1,18),border_outline_topright];
    border_middle1 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle2 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle3 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle4 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle5 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle6 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle7 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle8 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle9 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_middle10 = [border_outline_left, repmat(1,1,18), border_outline_right];
    border_bottom = [border_outline_bottomleft, repmat(border_bottom_bottom,1,18), border_outline_bottomright];

    borders = [border_top; border_middle1; border_middle2; border_middle3; border_middle4; ...
        border_middle5; border_middle6; border_middle7; border_middle8; border_middle9; border_middle10; border_bottom];

    
    correctPlacement = randi([1,2]);

    numTry = 0;


    % Sprite locations
    player_sprite = 129;
    
    % Start locations
    i = 7;
    j = 10;
    
    displayBox(i,j) = player_sprite;
    drawScene(cinScene,displayBox,borders);

    % while 1 is an infinite while loop
    while 1

        if correctPlacement == 1
            % correct
            text(100, 845, correctHiragana, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % left corner
            % wrong
            text(1450, 845, wrongHiragana, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % right corner
        else 
            % correct
            text(1450, 845, correctHiragana, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % right corner
            % correct
            text(100, 845, wrongHiragana, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % left corner
        end
            text(100, 125, '        Quickly move to hiragana "  "  in order to defete the demon', 'FontSize', 25, 'Color',[0.8 0.8 0.8]);
            text(750, 125, correctEnglish, 'FontSize', 25, 'Color',[0.8 0.8 0.8]);



        key = getKeyboardInput(cinScene);
         
        
        if strcmp(key, 'uparrow')
            displayBox(i,j) = 1;
            displayBox(i-1,j) = player_sprite;
            i = i-1;
            drawScene(cinScene,displayBox, borders);
            if (i == 11 && j == 2) ||(i == 11 && j == 19)
                if correctPlacement == 1
                    if (i == 11 && j == 2)
                        msgbox('Correct!!!');
                        break
                    else 
                        msgbox('Wrong! Try again.');
                        numTry = numTry + 1;
                        pause(2);
                    end
                else
                    if (i == 11 && j == 19)
                        msgbox('Correct!!!');
                        break
                    else 
                        msgbox('Wrong! Try again.');
                        numTry = numTry + 1;
                        pause(2);
                    end
                end
            end
        elseif strcmp(key, 'downarrow')
            displayBox(i,j) = 1;
            displayBox(i+1,j) = player_sprite;
            i = i+1;
            drawScene(cinScene,displayBox, borders);
             if (i == 11 && j == 2) ||(i == 11 && j == 19)
                if correctPlacement == 1
                    if (i == 11 && j == 2)
                        msgbox('Correct!!!');
                        break
                    else 
                        msgbox('Wrong! Try again.');
                        numTry = numTry + 1;
                        pause(2);
                    end
                else
                    if (i == 11 && j == 19)
                        msgbox('Correct!!!');
                        break
                    else 
                        msgbox('Wrong! Try again.');
                        numTry = numTry + 1;
                        pause(2);
                    end
                end
            end
        elseif strcmp(key, 'leftarrow')
            displayBox(i,j) = 1;
            displayBox(i,j-1) = player_sprite;
            j = j-1;
            drawScene(cinScene,displayBox, borders);
            if (i == 11 && j == 2) ||(i == 11 && j == 19)
                if correctPlacement == 1
                    if (i == 11 && j == 2)
                        msgbox('Correct!!!');
                        break
                    else 
                        msgbox('Wrong! Try again.');
                        numTry = numTry + 1;
                        pause(2);
                    end
                else
                    if (i == 11 && j == 19)
                        msgbox('Correct!!!');
                        break
                    else 
                        msgbox('Wrong! Try again.');
                        numTry = numTry + 1;
                        pause(2);
                    end
                end
            end
        elseif strcmp(key, 'rightarrow')
            displayBox(i,j) = 1;
            displayBox(i,j+1) = player_sprite;
            j = j+1;
            drawScene(cinScene,displayBox, borders);
            if (i == 11 && j == 2) ||(i == 11 && j == 19)
                if correctPlacement == 1
                    if (i == 11 && j == 2)
                        msgbox('Correct!!!');
                        break
                    else 
                        msgbox('Wrong! Try again.');
                        numTry = numTry + 1;
                        pause(2);
                    end
                else
                    if (i == 11 && j == 19)
                        msgbox('Correct!!!');
                        break
                    else 
                        msgbox('Wrong! Try again.');
                        numTry = numTry + 1;
                        pause(2);
                    end
                end
            end
        end
    end

    if numTry == 0
        score = 1;
    else 
        score = .5
    end


% Note the above doens't consider the boundary conditions and will result
% in an error if Queen tries to go out of bounds. Think about ways in which
% you can impose limitations on where a sprite can move in a window 
end