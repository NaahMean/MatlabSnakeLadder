function [  ] = draw_text(gameboard, ourboard)
% format draw_text(gameboard, ourboard)
% create_text writes strings to board rectangles

if ourboard == 1
%     myfont = 'Segoe Script';  
    myfont = 'Tahoma';
    myfontsize = 6;
else
    myfont = 'verdana';
    myfontsize = 8;
end
for i= 1:numel(gameboard)
    x=gameboard(i).action;
    switch x
        case 0
            space_text= 'Start';
        case 100
            space_text= 'Finish';
        case -1
            space_text= '';
        case 1
            space_text= char('Jump ahead','by 2 spaces');
        case 2
            space_text= char('Jump ahead','by 4 spaces');
        case 3
            space_text= char('Jump to', 'FINISH');
        case 4
            space_text= char('Go back','2 spaces');
        case 5
            space_text= char('Go back','4 spaces');
        case 6
            space_text= char('Go back','to Start');
        case 7
            space_text= 'Lose 1 turn';
        case 8
            space_text= 'Roll again';
        case 9
            space_text= char('Go back','3 spaces.','Lose a turn');
        case 10
            space_text= char('Jump ahead','by 3 spaces.',' Roll again');
        case 11
            space_text= '?';  %black hole
    end
        text((gameboard(i).x+gameboard(i).width/2), (gameboard(i).y+ gameboard(i).height/2), space_text, 'FontName', myfont,'HorizontalAlignment','center','fontsize',myfontsize)

end
end