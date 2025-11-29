function [question_type, question, correctOption, false1Option, false2Option, false3Option, correct_english] = ranQuestion (startNum, endNum)

    hiragana_list = ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ"];
    % english equivalents for the above given hiragana characters in order
     english_list = ["a", "i", "u", "e", "o", "ka", "ki", "ku", "ke", "ko"];
     correct_english = "";
          
    % genorates a random number that will be used as the index of the
    % correct answer
    correctNum = randi([startNum, endNum]);
    correctOption = hiragana_list(correctNum);
    
    % genorates a random ngumber that will be used as the index of the
    % first incorrect answer
    false1Num = randi([startNum, endNum]);

    % will keep genorating until it generates a new number 
    while correctNum == false1Num
       false1Num = randi([startNum, endNum]);
    end
    false1Option = hiragana_list(false1Num);
    
    % genorates a random number that will be used as the index of the
    % second incorrect answer
    false2Num = randi([startNum, endNum]);

    % will keep genorating until it generates a new number 
    while false1Num == false2Num || correctNum == false2Num
       false2Num = randi([startNum, endNum]);
    end
    false2Option = hiragana_list(false2Num);
    
    % genorates a random number that will be used as the index of the
    % third incorrect answer
    false3Num = randi([startNum, endNum]);

    % will keep genorating until it generates a new number 
    while false2Num == false3Num || false1Num == false3Num || correctNum == false3Num
       false3Num = randi([startNum, endNum]);
    end
    false3Option = hiragana_list(false3Num);

                         %[1,3]
    question_type = randi([1,2]);
    question_type = 2;
    
    if question_type == 1
        correct_english = char(english_list(correctNum));

        multiple_choice = ['Score:                                   EXIT';
                           'Which character is " " from the options below';...
                           '                                             ';...
                           '---------------------------------------------';...
                           '|1.                  |2.                     ';...
                           '---------------------------------------------';...
                           '|3.                  |4.                     ';...
                           '---------------------------------------------';...
                           '                                             ';...
                           '            Pleas click the answer           '];
        question = multiple_choice;
    else if question_type ==2
          correct_english = char(english_list(correctNum));
          fill_in_blank = [ 'Score:                              EXIT';
                            'Please type the Engilsh equivalence of  ';
                            '                                        ';
                            '                                        ';
                            '                                        ';
                            'ANSWER:__                               ';
                            'please press any key then type your     ';
                            'answer                                  '];
            
          question = fill_in_blank;    
    end

end