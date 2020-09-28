function [ ] = start_game( varargin  )
% format start_game( varargin  )
%[number of player, board file, die roll file] 
%  main function to run game
%   Check if inputs are acceptable
close all;
switch nargin
    %no inputs
    case 0
        disp('You need to enter at least the number of players')
        num_playersloaded= false; boardloaded= false; rollsloaded= false;
        %input is just the number of players
    case 1
        if ~isnumeric(varargin{1}) || varargin{1} <= 0 || varargin{1} >= 5
            disp('The number of players needs to be between 1 and 4')
            num_playersloaded= false; boardloaded= false; rollsloaded= false; 
        else
            num_players= varargin{1};
            board = board_structure('ourboard.txt');
            rolls = 1;
            
            %check inputs
            num_playersloaded= true;
            boardloaded= false;
            rollsloaded= false;
        end
    case 2
        if ~isnumeric(varargin{1}) || varargin{1} <= 0 || varargin{1} >= 5
            disp('The number of players needs to be between 1 and 4')
            num_playersloaded= false; boardloaded= false; rollsloaded=false;
        else
            x=board_structure(varargin{2});
            if ~isstruct(x)
                disp('Your game board did not load')
                num_playersloaded= false; boardloaded= false; rollsloaded=false;
            else
                num_players= varargin{1};
                board= x;
                rolls= 1;
                %check inputs
                num_playersloaded= true;
                boardloaded= true;
                rollsloaded=false;
            end
        end
    case 3
        if ~isnumeric(varargin{1}) || varargin{1} <= 0 || varargin{1} >= 5
            disp('The number of players needs to be between 1 and 4')
            num_playersloaded= false; boardloaded= false; rollsloaded=false;
        else
            x=board_structure(varargin{2});
            if ~isstruct(x)
                disp('Your game board did not load')
                num_playersloaded= false; boardloaded= false; rollsloaded=false;
            else
                y= load(varargin{3});
                if size(y,1)~= varargin{1}
                    disp('The number of players entered does not match the dice rolls file')
                    num_playersloaded= false; boardloaded= false; rollsloaded=false;
                else
                    num_players= varargin{1};
                    board= x;
                    rolls= y;
                    %check inputs
                    num_playersloaded= true;
                    boardloaded= true;
                    rollsloaded=true;
                end
            end
        end
    otherwise
        num_playersloaded= false;
        boardloaded= false;
        rollsloaded= false;
        disp('Incorrect number of inputs')
end
%Exit or Start the game
if ~num_playersloaded && ~boardloaded && ~rollsloaded
    disp('Exiting game')
    %elseif ~boardloaded && ~rollsloaded
    %    disp('No board or turns file loaded')
    %elseif ~rollsloaded
    %    disp('No turns file loaded')
else
    axis ij     % adjusts origin to top left
    daspect([1,1,1]) %equalizes scaling
    grid off     %turn off grid
    axis off
    player=player_structure(num_players);
    game= true;
    turn= 0;
    draw_board(board)
    draw_text(board,nargin)
    draw_players(player,board,nargin)
    pause(.5)
    while game
        
        if (player(1).position + player(2).position + player(3).position + player(4).position) == num_players * numel(board)
            game= false;
        end
        
        for i= 1:num_players
            %check that player is playing and gets a turn
            if player(i).taketurn && player(i).position < numel(board)
                %player rolls
                player(i).roll= player(i).roll+1;
                player(i).position=player(i).position + get_roll(i,player(i).roll,rolls,rollsloaded,nargin);
                if player(i).position >= numel(board)
                    player(i).position= numel(board);
                else
                end
                if nargin ~= 1
                    rectangle('Position', [1 1 96  80], 'FaceColor', [.8 .8 .8],'EdgeColor',[.8 .8 .8]);
                else
                    rectangle('Position', [1 1 250  120], 'FaceColor', [.8 .8 .8],'EdgeColor',[.8 .8 .8]);
                end
                draw_board(board)
                draw_text(board,nargin)
                draw_players(player,board,nargin)
                pause(.5)
                %player takes game space action
                player(i)=take_action(player(i), board, rolls, rollsloaded,nargin);
                rectangle('Position', [1 1 96  80], 'FaceColor', [.8 .8 .8],'EdgeColor',[.8 .8 .8]);
                if nargin ~= 1
                    rectangle('Position', [1 1 96  80], 'FaceColor', [.8 .8 .8],'EdgeColor',[.8 .8 .8]);
                else
                    rectangle('Position', [1 1 250  120], 'FaceColor', [.8 .8 .8],'EdgeColor',[.8 .8 .8]);
                end
                draw_board(board)
                draw_text(board,nargin)
                draw_players(player,board,nargin)
                pause(.5)
                %if player skips turn
            elseif ~player(i).taketurn
                if player(i).turns2finish == 0
                    player(i).taketurn= true;
                    if nargin == 1
                        l = 117;
                        m = 95;
                    else
                        l = 50;
                        m = 50;
                    end
                    if nargin==1
                        rectangle('Position',[45 65 140 60], 'FaceColor', [.8 .8 .8],'EdgeColor', [0 0 0], 'LineWidth', 2);
                        
                    else
                        rectangle('Position',[10 39 80 25], 'FaceColor', [.8 .8 .8],'EdgeColor', [0 0 0], 'LineWidth', 2);
                    end
                    text(l, m, char('You have been', 'skipped'), 'FontName', 'Verdana','HorizontalAlignment','center','FontSize',40)
                    pause(1)
                    if nargin ~= 1
                        rectangle('Position', [1 1 96  80], 'FaceColor', [.8 .8 .8],'EdgeColor',[.8 .8 .8]);
                    else
                        rectangle('Position', [1 1 250  120], 'FaceColor', [.8 .8 .8],'EdgeColor',[.8 .8 .8]);
                    end
                    draw_board(board)
                    draw_text(board,nargin)
                    draw_players(player,board,nargin)
                    pause(.5)
                else
                end
            else
                player(i).position= numel(board);
                player(i).turns2finish= turn;
                player(i).taketurn= false;
            end
            
        end
        turn= turn+1;
    end
    close all;
    for i=1:num_players
        fprintf('Player %d took %d turns to finish\n',i,player(i).turns2finish);
    end
    
end
