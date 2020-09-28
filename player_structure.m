function [ players ] = player_structure( num_players )
% format: [ players ] = player_structure( num_players )
% creates a vector of player structures
%   player structure
player= {'number','position','taketurn','turns2finish','roll'};
    %empty cell array to hold player values
players_cell= cell(4, 5);
    %fill cell array
for i= 1:4
    %player number
    players_cell{i,1}= i;
    %player position, 101 if not playing
    if i <= num_players
        players_cell{i,2}= 1;
    else
        players_cell{i,2}= 0;
    end
    % does player get a turn
    players_cell{i,3}= true;
    % set turns to finish to 0
    players_cell{i,4}= 0;
    %player turn
    players_cell{i,5}= 0;
end
   %converts cell array to structures
players = cell2struct(players_cell,player,2);    
end