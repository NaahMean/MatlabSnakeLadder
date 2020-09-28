function [ playernew ] = take_action( player, board, rolls, rollsloaded,ourboard )
% format [ playernew ] = take_action( player, board, rolls, rollsloaded,ourboard )
%applies the action according to player position
if player.position <= numel(board)
    action = board(player.position).action;
    switch action
        case 1
            player.position= player.position +2;
            playernew= player;
            %            space_text= char('Jump ahead by',' 2 spaces');
        case 2
            player.position= player.position +4;
            playernew= player;
            %            space_text= char('Jump ahead by',' 4 spaces');
        case 3
            player.position= numel(board);
            playernew= player;
            %            space_text= 'Jump to FINISH';
        case 4
            player.position= player.position -2;
            playernew= player;
            %            space_text= char('Go back 2',' spaces');
        case 5
            player.position= player.position -4;
            playernew= player;
            %            space_text= char('Go back 4',' spaces');
        case 6
            player.position= 1;
            playernew= player;
            %            space_text= char('Go back to',' Start');
        case 7
            player.taketurn= false;
            playernew= player;
            %            space_text= 'Lose 1 turn';
        case 8
            player.roll= player.roll +1;
            player.position= player.position + get_roll(player.number,player.roll,rolls,rollsloaded, ourboard);
            if player.position > numel(board)
                player.position= numel(board);
            end
            playernew= player;
            %            space_text= 'Roll again';
        case 9
            player.position= player.position -3;
            player.taketurn= false;
            playernew= player;
            %            space_text= char('Go back 3',' spaces. Lose',' a turn');
        case 10
            player.position= player.position +3;
            player.roll= player.roll +1;
            player.position= player.position + get_roll(player.number,player.roll,rolls,rollsloaded,ourboard);
            if player.position > numel(board)
                player.positon= numel(board);
            end
            playernew= player;
            %            space_text= char('Jump ahead by',' 3 spaces.',' Roll again');end
        case 11
            player.position= randi([2 (numel(board)-1)]);
            playernew= player;
            % black hole
        otherwise
            playernew= player;
    end
else
    player.position= numel(board);
    playernew= player;
end

