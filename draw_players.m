function [ ] = draw_players( players, board, ourboard )
% draw_players( players, board, ourboard )
%draws the players to the board
if ourboard == 1
    p=6; %player size
    t=6; %text size
    posa=2; %token adjustment for our board
    ta=3;   %token text adjustment for our board
    ta3x=1;
    ta1=1;
    ta2y=1;
else
    p=4;
    t=10;
    posa=0;
    ta=0;
    ta3x=0;
    ta1=0;
    ta2y=0;
end
for i= 1:numel(players)
    switch i
        case 1
            if players(1).position <= numel(board) && players(1).position >= 1
                rectangle('Position', [(board(players(1).position).x+(board(players(1).position).width/2)-5-posa) (board(players(1).position).y+(board(players(1).position).height/2)-5-posa) p p], 'FaceColor', [0 0 0],'EdgeColor', [1 1 1], 'LineWidth', 2,'Curvature', [1 1]);
                text((board(players(1).position).x+(board(players(1).position).width/2)-3-ta1), (board(players(1).position).y+(board(players(1).position).height/2)-3-ta1), '1', 'FontName', 'Verdana','HorizontalAlignment','center','Color',[1 1 1],'fontsize',t);
            end
        case 2
            if players(2).position <= numel(board) && players(2).position >= 1
                rectangle('Position', [(board(players(2).position).x+(board(players(2).position).width/2)+1+posa) (board(players(2).position).y+(board(players(2).position).height/2)-5-posa) p p], 'FaceColor', [0 0 0],'EdgeColor', [1 1 1], 'LineWidth', 2,'Curvature', [1 1]);
                text((board(players(2).position).x+(board(players(2).position).width/2)+3+ta), (board(players(2).position).y+(board(players(2).position).height/2)-3-ta2y), '2', 'FontName', 'Verdana','HorizontalAlignment','center','Color',[1 1 1],'fontsize',t);
            end
        case 3
            if players(3).position <= numel(board) && players(3).position >= 1
                rectangle('Position', [(board(players(3).position).x+(board(players(3).position).width/2)-5-posa) (board(players(3).position).y+(board(players(3).position).height/2)+1+posa) p p], 'FaceColor', [0 0 0],'EdgeColor', [1 1 1], 'LineWidth', 2,'Curvature', [1 1]);
                text((board(players(3).position).x+(board(players(3).position).width/2)-3-ta3x), (board(players(3).position).y+(board(players(3).position).height/2)+3+ta), '3', 'FontName', 'Verdana','HorizontalAlignment','center','Color',[1 1 1],'fontsize',t);
            end
        case 4
            if players(4).position <= numel(board) && players(4).position >= 1
                rectangle('Position', [(board(players(4).position).x+(board(players(4).position).width/2)+1+posa) (board(players(4).position).y+(board(players(4).position).height/2)+1+posa) p p], 'FaceColor', [0 0 0],'EdgeColor', [1 1 1], 'LineWidth', 2,'Curvature', [1 1]);
                text((board(players(4).position).x+(board(players(4).position).width/2)+3+ta), (board(players(4).position).y+(board(players(4).position).height/2)+3+ta), '4', 'FontName', 'Verdana','HorizontalAlignment','center','Color',[1 1 1],'fontsize',t);
            end
    end
end
end