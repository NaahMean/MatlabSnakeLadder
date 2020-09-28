function [ gameboard ] = board_structure(board)
% format [ gameboard ] = board_structure(board)
%read file and create vector of structures for board spaces
%   Detailed explanation goes here
    %field names for gamespace structure
gamespace={'space_num','x','y','width','height','action'};
    %loads the board data, gamespace info must be in order from first to
    %last and have no blank lines in between
fid=fopen(board);
boardmatrix= (fscanf(fid,'%d',[5,inf]))';
fclose(fid);
[rows, cols]=size(boardmatrix);
    %empty cell array to hold board info
gameboard_cell=cell(rows,(cols+1));
    %fills the cell array
for i=1:rows
       gameboard_cell{i,1}=i;
       gameboard_cell{i,2}=boardmatrix(i,1);
       gameboard_cell{i,3}=boardmatrix(i,2);
       gameboard_cell{i,4}=boardmatrix(i,3);
       gameboard_cell{i,5}=boardmatrix(i,4);
       gameboard_cell{i,6}=boardmatrix(i,5);
end
    %converts cell array to structures
gameboard = cell2struct(gameboard_cell,gamespace,2);