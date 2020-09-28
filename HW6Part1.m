% HW6Part1 creates a game board using randomized text
close all
scrsz = get(0,'ScreenSize'); % gets the screen size returns 4 value vector
figure('Name','Game Board','NumberTitle','off','Position',[0 -50 scrsz(3) scrsz(4)], 'Color', [0.7 0.8 0.9])
    % start(0,50) and end(scrsz(3),scrsz(4)) pt of figure|
    axis([0 scrsz(3) 0 scrsz(4)]) %creates axis limits
    axis ij     % adjusts origin to top left
    axis off    % hides axes
    daspect([1,1,1]) %equalizes scaling 

    % first level
        % start block
rectangle('Position', [2 20 150 120], 'FaceColor', 'g','EdgeColor', [0 0 0], 'LineWidth', 2);
    text(77, 80, 'Start', 'FontName', 'Verdana','HorizontalAlignment','center')
    create_text(1,77,80,{'Start'},false)
        % game spaces
create_rec(6,156,30,'y',2)
        % text for game spaces
    create_text(6,231,80,{char('Jump ahead by',' 2 spaces');'Jump to FINISH';'Lose 1 turn';char('Jump ahead by',' 4 spaces');char('Go back 2',' spaces');char('Go back 4',' spaces');char('Go back to',' Start');'Roll again';char('Go back 3',' spaces. Lose',' a turn');char('Jump ahead by',' 3 spaces.',' Roll again')},true)
        % corner block
rectangle('Position', [1080 20 150 120], 'FaceColor', 'g','EdgeColor', [0 0 0], 'LineWidth', 2);
    create_text(1,1155,80,{char('Skip to level','   3')},false)
    % transition block
rectangle('Position', [1105 144 100 250], 'FaceColor', 'c','EdgeColor', [0 0 0], 'LineWidth', 2);
    create_text(1,1155,272,{char('M','o','v','e','','d','o','w','n')},false)

    
    % second level
        % Level 2 block
rectangle('Position', [1080 398 150 120], 'FaceColor', 'g','EdgeColor', [0 0 0], 'LineWidth', 2);
    create_text(1,1155,458,{'Level 2'},false)
        % game blocks
create_rec(6,156,408,'y',2)
        % text for game spaces
    create_text(6,231,458,{char('Jump ahead by',' 2 spaces');'Jump to FINISH';'Lose 1 turn';char('Jump ahead by',' 4 spaces');char('Go back 2',' spaces');char('Go back 4',' spaces');char('Go back to',' Start');'Roll again';char('Go back 3',' spaces. Lose',' a turn');char('Jump ahead by',' 3 spaces.',' Roll again')},true)
        % corner block
rectangle('Position', [2 398 150 120], 'FaceColor', 'g','EdgeColor', [0 0 0], 'LineWidth', 2);
    create_text(1,77,458,{char('Restart', 'level 2')},false)
    % transition block
rectangle('Position', [27 522 100 250], 'FaceColor', 'c','EdgeColor', [0 0 0], 'LineWidth', 2);
    create_text(1,77,649,{char('M','o','v','e','','d','o','w','n')},false)


    % third level
rectangle('Position', [2 776 150 120], 'FaceColor', 'g','EdgeColor', [0 0 0], 'LineWidth', 2);
    create_text(1,77,836,{'Level 3'},false)
        % game blocks
create_rec(6,156,786,'y',2)
        % text for game spaces
    create_text(6,231,836,{char('Jump ahead by',' 2 spaces');'Jump to FINISH';'Lose 1 turn';char('Jump ahead by',' 4 spaces');char('Go back 2',' spaces');char('Go back 4',' spaces');char('Go back to',' Start');'Roll again';char('Go back 3',' spaces. Lose',' a turn');char('Jump ahead by',' 3 spaces.',' Roll again')},true)
        % finish block
rectangle('Position', [1080 776 150 120], 'FaceColor', 'g','EdgeColor', [0 0 0], 'LineWidth', 2);
    create_text(1,1155,836,{'Finish'},false)