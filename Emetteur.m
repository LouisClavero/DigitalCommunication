%type test.txt 
clear variables;
%NAME_FILE = test.txt;
    C0 = zeros(9, 16, 3)+0.8;
    C0(:,:,3) = zeros(9, 16)+0.7
    
    C1(:,:,1) = zeros(9, 16)+0.8;
    C1(:,:,2) = zeros(9, 16);
    C1(:,:,3) = zeros(9, 16);
    
    C2(:,:,1) = zeros(9, 16);
    C2(:,:,2) = zeros(9, 16)+0.5;
    C2(:,:,3) = zeros(9, 16);

    C3(:,:,1) = zeros(9, 16) ;
    C3(:,:,2) = zeros(9, 16) ;
    C3(:,:,3) = zeros(9, 16)+0.8;

    C4 = zeros(9, 16, 3);
    
toDisplay = [C4, C4, C4, C4, C4, C4];
I = imresize(toDisplay, [1080,1920]);
fullscreen(I,1);
pause(5);
toDisplay = [C0, C0, C0, C0, C0, C0];
I = imresize(toDisplay, [1080,1920]);
fullscreen(I,1);
pause(1.5);
toDisplay = [C4, C4, C4, C4, C4, C4];
I = imresize(toDisplay, [1080,1920]);
fullscreen(I,1);
% Load string to be sent
fileID = fopen('text.txt');
test = textscan(fileID, '%s', 'Delimiter', '');
fclose(fileID);
text = test{1}{:};

test1=clock;
for i=1:length(text)
    %x=getTuple(text(i));
    c1=clock;
    ascii=uint8(text(i))-31;
    droite = mod(ascii,5);
    milieu = mod((ascii - droite)/5, 5);
    gauche = (ascii-5*milieu-droite)/25;

    switch droite
        case 0 
            color3 = C0;
        case 1 
            color3 = C1;
        case 2 
            color3 = C2;
        case 3 
            color3 = C3;
        case 4 
            color3 = C4;
        otherwise
            color3 = C0;      
    end
    switch milieu
        case 0 
            color2 = C0;
        case 1 
            color2 = C1;
        case 2 
            color2 = C2;
        case 3 
            color2 = C3;
        case 4 
            color2 = C4;
        otherwise
            color2 = C0;  
   end
   switch gauche
        case 0 
            color1 = C0;
        case 1 
            color1 = C1;
        case 2 
            color1 = C2;
        case 3 
            color1 = C3;
        case 4 
            color1 = C4;
        otherwise
            color1 = C0;  
   end   
    toDisplay = [color1, color2, color3, color1, color2, color3];
    I = imresize(toDisplay, [1080,1920]);
    
    fullscreen(I,1);
    c2 = clock;
    c = c2-c1;
    if c(6) < 0
        deltaT=60+c(6);
    else
        deltaT=c(6);
    end
    pause(0.75-deltaT)
end
test2=clock;
execT = test2-test1;


toDisplay = [C0, C0, C0, C0, C0, C0];
I = imresize(toDisplay, [1080,1920]);
fullscreen(I,1);
pause(1);
toDisplay = [C4, C4, C4, C4, C4, C4];
I = imresize(toDisplay, [1080,1920]);
fullscreen(I,1);
pause(1);
closescreen();

