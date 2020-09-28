function [ roll ] = get_roll( player,rollnum,rolls,rollsloaded,ourboard)
% format [ roll ] = get_roll( player,rollnum,rolls,rollsloaded,ourboard)
% returns the roll for the turn
%runs if no turn file is entered
if ourboard == 1
    i = 117;
    j = 95;
else
    i = 50;
    j = 50;
end
if ~rollsloaded
    %enter random number function
    y= num2str(player);
    x = menu(['Player' ' ' y '''s Die'],'Roll Die');
    switch x
        case 1
            roll=randi(6);
    end
    
    %use turn file
else
    roll=rolls(player,rollnum);
end
dieroll=['Your roll is' ' ' num2str(roll)];
if ourboard == 1
    rectangle('Position',[(i-60) (j-15) 120 30], 'FaceColor', [.8 .8 .8],'EdgeColor', [0 0 0], 'LineWidth', 2);
else
    rectangle('Position',[(i-35) (j-5) 70 10], 'FaceColor', [.8 .8 .8],'EdgeColor', [0 0 0], 'LineWidth', 2);
end
text(i, j, dieroll, 'FontName', 'Verdana','HorizontalAlignment','center','FontSize',40)
pause(1)
end

