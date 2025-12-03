function story_scene = StoryMode(level)

    % STORY MODE SCENES
    % Level Structure:
    % 0: Instructions
    % 1: Lesson 1 (A, I)  -> 2: Quiz 1
    % 3: Lesson 2 (U, E)  -> 4: Quiz 2
    % 5: Lesson 3 (O, KA) -> 6: Quiz 3
    % 7: Lesson 4 (KI, KU)-> 8: Quiz 4
    % 9: Lesson 5 (KE, KO)-> 10: Quiz 5
    % 11: Moving Character BATTLE INTRO

    % --- LEVEL 0: INSTRUCTIONS ---
    if level == 0 

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
                             '           CLICK ANYWHERE TO START                ';
                             '                                                  ';
                             '                     PLAY                         ';
                             '                                                  '];
      
        story_scene = instructions_text;

    % --- LEVEL 1: LESSON 1 (A & I) ---
    elseif level == 1
        scene = ['                                                  ';
                 '          LESSON 1: VOWELS (Part 1)               ';
                 '                                                  ';
                 '     (A) -->                                      ';
                 '  MNEMONIC: A is for Apple. It looks like an      ';
                 '  apple hanging from a tree.                      ';
                 '  PRONUNCIATION - (aah)                           ';
                 '  NO OF STROKES - 3                               ';
                 '  ----------------------------------------------  ';
                 '                                                  ';
                 '     (I) -->                                      ';
                 '  MNEMONIC: Looks like a broken ice-cream cone    ';
                 '  PRONUNCIATION - (e)                             ';
                 '  NO OF STROKES - 2                               ';
                 '                                                  ';
                 '     (Write each 5 times, then click to battle!)  ';
                 '                                                  ';
                 '               CLICK TO START QUIZ                ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 2: QUIZ 1 ---
    elseif level == 2
        scene = ['                                                  ';
                 '            BATTLE 1: THE DEMON STRIKES!          ';
                 '                                                  ';
                 '  The Demon shouts:                               ';
                 '  "WHICH HIRAGANA CHARACTER REPRESENTS "A" ?"     ';
                 '                                                  ';
                 '                                                  ';
                 '    OPTION 1:                                     ';
                 '                                                  ';
                 '    OPTION 2:                                     ';
                 '                                                  ';
                 '                                                  ';
                 '   (Press 1 or 2 on your keyboard to attack!)     ';
                 '                                                  ';
                 '             HINT: "A" for ____  ?                ';
                 '                                                  ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 3: LESSON 2 (U & E) ---
    elseif level == 3
        scene = ['                                                  ';
                 '          LESSON 2: VOWELS (Part 2)               ';
                 '                                                  ';
                 '     (U) -->                                      ';
                 '  MNEMONIC: U is like a U that has                ';
                 '  been slightly tilted wearing a hat              ';
                 '  PRONUNCIATION - (oo)                            ';
                 '  NO OF STROKES - 2                               ';
                 '  ----------------------------------------------  ';
                 '                                                  ';
                 '     (E) -->                                      ';
                 '  MNEMONIC: E looks like an Exercise bench        ';
                 '  with a person sitting on it.                    ';
                 '  PRONUNCIATION - (eh)                            ';
                 '  NO OF STROKES - 2                               ';
                 '                                                  ';
                 '     (Write each 5 times, then click to battle!)  ';
                 '                                                  ';
                 '               CLICK TO START QUIZ                ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 4: QUIZ 2 ---
    elseif level == 4
        scene = ['                                                  ';
                 '            BATTLE 2: THE DEMON STRIKES!          ';
                 '                                                  ';
                 '  The Demon shouts:                               ';
                 '  "What is the hiragana equivalent of "E" ?"      ';
                 '                                                  ';
                 '                                                  ';
                 '    OPTION 1:                                     ';
                 '                                                  ';
                 '    OPTION 2:                                     ';
                 '                                                  ';
                 '                                                  ';
                 '   (Press 1 or 2 on your keyboard to attack!)     ';
                 '                                                  ';
                 '           Hint - Exercises Benches :)            ';
                 '                                                  ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 5: LESSON 3 (O & KA) ---
    elseif level == 5
        scene = ['                                                  ';
                 '          LESSON 3: VOWELS & K-SOUNDS             ';
                 '                                                  ';
                 '     (O) -->                                      ';
                 '  MNEMONIC: O is gold ball (the dash), and it is  ';
                 '  approaching the golf post (the t looking line)  ';
                 '  PRONUNCIATION - (oh)                            ';
                 '  NO OF STROKES - 3                               ';
                 '  ----------------------------------------------  ';
                 '                                                  ';
                 '     (KA) -->                                     ';
                 '  MNEMONIC: KA looks like a knife cutting a carrot';
                 '  disregarding the dash on the right.             ';
                 '  PRONUNCIATION -  (kaah)                         ';
                 '  NO OF STROKES - 3                               ';
                 '                                                  ';
                 '     (Write each 5 times, then click to battle!)  ';
                 '                                                  ';
                 '               CLICK TO START QUIZ                ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 6: QUIZ 3 ---
    elseif level == 6
        scene = ['                                                  ';
                 '            BATTLE 3: THE DEMON STRIKES!          ';
                 '                                                  ';
                 '  The Demon shouts:                               ';
                 '  "What is the Hiragana equivalent of "KA" ?"     ';
                 '                                                  ';
                 '                                                  ';
                 '    OPTION 1:                                     ';
                 '                                                  ';
                 '    OPTION 2:                                     ';
                 '                                                  ';
                 '                                                  ';
                 '   (Press 1 or 2 on your keyboard to attack!)     ';
                 '                                                  ';
                 '                                                  ';
                 '            Hint - Kites all around!!             ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 7: LESSON 4 (KI & KU) ---
    elseif level == 7
        scene = ['                                                  ';
                 '          LESSON 4: K-SOUNDS (Part 2)             ';
                 '                                                  ';
                 '     (KI) -->                                     ';
                 '  MNEMONIC: KI looks like a Key with two teeth    ';
                 '  PRONUNCIATION: (ke)                             ';
                 '  NO OF STROKES - 4                               ';
                 '  ----------------------------------------------  ';
                 '                                                  ';
                 '     (KU) -->                                     ';
                 '  MNEMONIC: KU is a like a lesser-than symbol     ';
                 '  PRONUNCIATION: (kuh)                            ';
                 '  NO OF STROKES - 1                               ';
                 '                                                  ';
                 '     (Write each 5 times, then click to battle!)  ';
                 '                                                  ';
                 '               CLICK TO START QUIZ                ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 8: QUIZ 4 ---
    elseif level == 8
        scene = ['                                                  ';
                 '            BATTLE 4: THE DEMON STRIKES!          ';
                 '                                                  ';
                 '  The Demon shouts:                               ';
                 '  "What is the Hiragana equivalent of "KU" ?"     ';
                 '                                                  ';
                 '                                                  ';
                 '    OPTION 1:                                     ';
                 '                                                  ';
                 '    OPTION 2:                                     ';
                 '                                                  ';
                 '                                                  ';
                 '   (Press 1 or 2 on your keyboard to attack!)     ';
                 '                                                  ';
                 '        Hint - The bird that koo-koos             ';
                 '                                                  ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 9: LESSON 5 (KE & KO) ---
    elseif level == 9
        scene = ['                                                  ';
                 '          LESSON 5: K-SOUNDS (Part 3)             ';
                 '                                                  ';
                 '     (KE) -->                                     ';
                 '  MNEMONIC: KE looks like a lowercase inverted t  ';
                 '  to the right                                    ';
                 '  PRONUNCIATION - (keh)                           ';
                 '  NO OF STROKES - 3                               ';
                 '  ----------------------------------------------  ';
                 '                                                  ';
                 '     (KO) -->                                     ';
                 '  MNEMONIC: KO looks like a small Cobra or a snake';
                 '  with the middle part cut out.                   ';
                 '  PRONUNCIATION: (koh)                            ';
                 '  NO OF STROKES - 2                               '; 
                 '                                                  ';
                 '     (Write each 5 times, then click to battle!)  ';
                 '                                                  ';
                 '               CLICK TO START QUIZ                ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 10: QUIZ 5 ---
    elseif level == 10
        scene = ['                                                  ';
                 '            BATTLE 5: THE FINAL TEST!             ';
                 '                                                  ';
                 '  The Demon shouts:                               ';
                 '  "What is the Hiragana equivalent of "KO" ?"     ';
                 '                                                  ';
                 '                                                  ';
                 '    OPTION 1:                                     ';
                 '                                                  ';
                 '    OPTION 2:                                     ';
                 '                                                  ';
                 '                                                  ';
                 '   (Press 1 or 2 on your keyboard to attack!)     ';
                 '                                                  ';
                 '            Hint - "K"ing "K"obras                ';
                 '                                                  ';
                 '                                                  '];
        story_scene = scene;

    % --- LEVEL 11: THE GAME MAP ---
    elseif level == 11
        new_type_information = ['                                                 ';
                 '                                                 ';
                 '     OK Warrior! As you are done with the basic  ';
                 '  training, it is time for some real world battle';
                 '                                                 ';
                 '  NEW TYPE OF QUESTIONS WHICH YOU MUST DODGE IN  ';
                 '  ORDER TO BEAT THE DEMON, THE REAL STORY KICKS  ';
                 '  IN NOW!                                        ';
                 '                                                 ';
                 '             CLICK ANYWHERE TO START             ';
                 '                                                 ';
                 '                       PLAY                      ';
                 '                                                 ';
                 '                                                 '];

                story_scene = new_type_information;
  
    end

end