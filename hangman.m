function Hangman_SDP()
clear
clc
close all
%Load the words for the game in excel file
[~,txt,raw] = xlsread('hangmanwords.xlsx')
size_txt = size(txt); %find the size of the text line
randomWord = size_txt(1); %Index at first column of excell file
%choose a random word from the excel file
wordCell = randi(randomWord); % find a random word from list and set it equal to wordCell


word = raw{wordCell,1}; %find word from column 1
%find length of generated word
lengthWord = strlength(word);
%title('Hangman')
fprintf('Welcome to the game of Hangman\n')
fprintf('You have 6 guesses\n')
fprintf('If the entire snowman is drawn, you have lost\n')
%fprintf('The length of the chosen word is %.s',word)
%Find the length of the random word selected
randomWord = txt(size_txt);

%wordArray = char(txt);
%numberLetters = size(wordArray);
%User has 6 tries so number of lives is set equal to 6
numberLives = 6;



%fprintf('Guess a letter: \n')
%set all of the number of letters in the word equal to -
for i = 1:lengthWord
    letter(i) = '-';
end
disp(letter)
%Set variables for wrong guess, correct guess, and guesses that are left
wrongGuess = 0;
correctGuess = 0;
guessesLeft = 6;

%While loop as long as user has 1 - 6 lives
correctInput = 0;
while numberLives > 0
    letterGuess = input('Guess a letter: ','s'); %prompts user to guess a letter
    findInput = strfind(word,letterGuess); %checks if the guessed letter is found in the word
    if findInput == true
        correctInput = correctInput + 1;
    correctGuess = correctGuess + 1; %adds the correct input to the correctGuess variable
    fprintf("You guessed the correct letter/n")
    end
  if findInput >= 1
      letter(findInput) = letterGuess;
      disp(letterGuess)
      fprintf("You guessed the correct letter/n")

      %Results(lengthWord,correctGuess,word) 
  end
        clc
        wrongGuess = wrongGuess + 1; %is guess is wrong, add one to variable wrongGuess
        drawSnowman(wrongGuess) %from drawSnowman scene draw 
        if wrongGuess == 6
            fprintf('%s\n',letter)
            Results(lengthWord,correctGuess,word)
            %break;
        else
            fprintf("You guessed the wrong letter\n")
            drawSnowman(wrongGuess)
            guessesLeft = guessesLeft - 1;
            fprintf('%s\n',letter)
        end
    end
end





function drawSnowman(wrongGuess)
    hold on
    if(wrongGuess == 1)
        hold on
        x = 7.5;
        y = 7.75;
        r = 0.25;
        theta = 0:pi/100:2*pi;
        a = r*cos(theta)+x;
        b = r*sin(theta)+y;
        head = plot(a,b);
        head.LineWidth = 4;
        
    end

    if(wrongGuess == 2)
        hold on
        body = line([7.5,7.5],[7.5,6]);
        body.LineWidth = 4;
       
    end

    if(wrongGuess == 3)
        hold on
        leftLeg = line([7.5,7],[6,5.5]);
        leftLeg.LineWidth = 4;
        
    end

    if(wrongGuess == 4)
        hold on
        rightLeg = line([7.5,8],[6,5.5]);
        rightLeg.LineWidth = 4;
        
    end

    if(wrongGuess == 5)
        hold on
        rightArm = line([7.5,7],[7,7.5]);
        rightArm.LineWidth = 4;
    end
    if(wrongGuess == 6)
        hold on
        leftArm = line([7.5,8],[7,7.5]);
        leftArm.LineWidth = 4;
    end
end


%Prints out results
function Results(lengthWord,correctGuess,word) 
if lengthWord == correctGuess
    fprintf('You got the word and won the game!\n')
    fprintf('The word is: %s\n',word)
else
    fprintf('You failed to guess the word therefore you lost the game!\n')
    fprintf('The word was %s\n',word)
    %drawnSnowman(wrongGuess)
end
end
