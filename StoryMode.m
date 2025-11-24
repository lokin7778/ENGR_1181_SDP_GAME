%% STORY MODE

% Instructions Page

instructions_text = ['                                                  ';
                     '         WELCOME TO THE STORY MODE WARRIOR        ';
                     '                                                  ';
                     '                BASIC INSTRUCTIONS                ';
                     '                                                  ';
                     ' 1. You will be introduced to a story where there ';
                     '    would be basic Hiragana characters taught with';
                     '    their English equivalents.                    ';
                     '                                                  ';
                     ' 2. Make sure that while the characters are taught';
                     '    you write down each of them at least 5 times  ';
                     '    so that you learn it by heart.                ';
                     '                                                  ';
                     ' 3. After learning 2 characters, you will be asked';
                     '    questions based on that, for each answer you  ';
                     '    will damage the demon in front of you and for ';
                     '    each wrong answer the demon will give damage  ';
                     '    to you.                                       ';
                     '                                                  ';
                     ' 4. This process will repeat until you have been  ';
                     '    taught 10 characters of basic Hiragana.       ';
                     '                                                  ';
                     '                                                  '];

    sSize = 16; % Sprite size based on the actual size of the sprite sheet.
    
    zFactor = 1; % Zoom factor, based on how big you want to the displayed 
    % images to be. 
    
    BGC = [217, 135, 41]; % Background color, RBG values. ()
    
    % Creats a simpleGameEngine object with the parameters sSize, zFactor, BCG,
    % and the custom.png
    home_object = simpleGameEngine('custom.png', sSize, sSize, zFactor, BGC);

    drawScene(home_object, instructions_text)