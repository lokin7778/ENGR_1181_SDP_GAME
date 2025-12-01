function score_moving = Moving_Character(level)

    % The protagonist sprite 
    % Create the scene
    cinScene = simpleGameEngine("custom.png",16,16,5,[217, 135, 41]);
    displayBox = ones(12,20);
    
    question_type = randi([1,2]);
    [question, output1, output2, output3, output4, correct_english] = ranQuestion(1,10, question_type)

    % Sprite locations
    player_sprite = 129;
    
    % Start locations
    i = 7;
    j = 10;
    
    displayBox(i,j) = player_sprite;
    drawScene(cinScene,displayBox);
    
    % while 1 is an infinite while loop
    while 1
        text(50, 100, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
        text(1450, 100, output2, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
        text(50, 870, output3, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
        text(1450, 870, output4, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
        key = getKeyboardInput(cinScene);
         
        
        if strcmp(key, 'uparrow')
            displayBox(i,j) = 1;
            displayBox(i-1,j) = player_sprite;
            text(50, 100, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(1450, 100, output2, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(50, 870, output3, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(1450, 870, output4, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            i = i-1;
            drawScene(cinScene,displayBox);
        elseif strcmp(key, 'downarrow')
            displayBox(i,j) = 1;
            displayBox(i+1,j) = player_sprite;
            text(50, 100, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(1450, 100, output2, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(50, 870, output3, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(1450, 870, output4, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            i = i+1;
            drawScene(cinScene,displayBox);
        elseif strcmp(key, 'leftarrow')
            displayBox(i,j) = 1;
            displayBox(i,j-1) = player_sprite;
            text(50, 100, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(1450, 100, output2, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(50, 870, output3, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(1450, 870, output4, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            j = j-1;
            drawScene(cinScene,displayBox);
        elseif strcmp(key, 'rightarrow')
            displayBox(i,j) = 1;
            displayBox(i,j+1) = player_sprite;
            text(50, 100, output1, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(1450, 100, output2, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(50, 870, output3, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            text(1450, 870, output4, 'FontSize', 25, 'Color',[0.8 0.8 0.8]); % hiragana
            j = j+1;
            drawScene(cinScene,displayBox);
        end
    end


% Note the above doens't consider the boundary conditions and will result
% in an error if Queen tries to go out of bounds. Think about ways in which
% you can impose limitations on where a sprite can move in a window 
end