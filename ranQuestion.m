function [correct, false1, false2, false3] = ranQuestion (startNum, endNum)
          %question_screen
correct = randi([startNum, endNum]);

false1 = randi([startNum, endNum]);
while correct == false1
    false1 = randi([startNum, endNum]);
end 

false2 = randi([startNum, endNum]);
while false1 == false2 || correct == false2
    false2 = randi([startNum, endNum]);
end 

false3 = randi([startNum, endNum]);
while false2 == false3 || false1 == false3 || correct == false3
    false3 = randi([startNum, endNum]);
end 

end