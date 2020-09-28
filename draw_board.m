function [] = draw_board(board)
% format draw_board(board)
% draws the gamespaces from the board
%

for i= 1:numel(board)
    x=board(i).action;
    %select space color
    switch  x
        case 0
            space_color=[0.878 0.246 0.054]; % Start
        case -1
            space_color=[0.254 0.293 0.629]; % Empty Space
        case 100   
            space_color=[0.996 0.839 0];  % Finish
        case 1
            space_color=[0.375 0.891 0.512];   % Jump ahead by 2 spaces
        case 2
            space_color=[0.375 0.891 0.512];   % Jump ahead by 4 spaces
        case 3
            space_color=[0.996 0.839 0]; %Jump to FINISH
        case 4
            space_color=[1 .2 .2]; % Go back 2 spaces
        case 5
            space_color=[1 .2 .2];  %Go back 4 spaces
        case 6
            space_color=[.5 0 0];   % Go back to START
        case 7
            space_color='r';    % lose a Turn
        case 8
            space_color=[0 .8 0];     % Roll again
        case 9
            space_color='r';     % Go back 3 steps and lose a Turn
        case 10
            space_color=[0 .8 0];     % Jump ahead 3 steps and roll again
        case 11
            space_color=[0 0 0];     % black hole
    end
    %draw the space
    rectangle('Position', [board(i).x board(i).y board(i).width board(i).height], 'FaceColor', space_color,'EdgeColor', [0 0 0], 'LineWidth', 2);
end
end

