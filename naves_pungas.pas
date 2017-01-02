uses crt;
var   x1,y1,cx1,cy1,cx2,cy2,x2,y2,x3,y3,cx3,cy3:integer;
      key,i,x,y,c1,c2,c3,c4,c5,v:integer;
      play,alive1,alive2,alive3,alive:boolean;

{procedure to show the main presentation}
procedure presentation;
var l:integer;
begin
    textcolor(2);
    for l:= 10 to 26 do
    begin
        gotoxy(l,9);
        write(' OsMaN');
        delay(200);
    end;
    sound(100);
    delay(10);
    nosound;
    for l:= 60 downto 47 do
    begin
        gotoxy(l,9);
        write('RoMErO ');
        delay(200);
    end;
    sound(100);
    delay(10);
    nosound;
    gotoxy(36,12);
    write('PresentS');
    textcolor(4);
    gotoxy(24,16);
    writeln('The naVes PunGas GamE');
    gotoxy(49,15);
    textcolor(14);
    write('### ###');
    gotoxy(49,16);
    write(' #   #');
    gotoxy(49,17);
    write(' #   #');
    gotoxy(49,18);
    write('### ###');
    gotoxy(58,18);
    textcolor(4);
    write('v1.0 - 2001');
    gotoxy(26,20);
    textcolor(37);
    write('PRESS ENTER TO CONTINUE...');
    gotoxy(71,24);
    readln;
end;

{procedure to show the game's instructions}
procedure instructions;
begin
    clrscr;
    textcolor(15);
    gotoxy(17,10);
    writeln ('+----------------------------------------------+');
    gotoxy(17,11);
    writeln ('#                  INSTRUCTIONS:               #');
    gotoxy(17,12);
    writeln ('#  Arrows: Up, Down, Left, Right               #');
    gotoxy(17,13);
    writeln ('#  Space:  Shoot                               #');
    gotoxy(17,14);
    writeln ('#  Esc:    Exit                                #');
    gotoxy(17,15);
    writeln ('+----------------------------------------------+');
    gotoxy(17,16);
    writeln (' Press enter to continue...');
    readln;
end;

{procedure that controls enemy #1}
procedure enemy1(x:integer; var cx1,cy1,x1,y1:integer);
var i:integer;
begin
    if (alive1) then
    begin
        inc (x1,cx1);
        inc (y1,cy1);
        if (y1=15) or (y1=3) then
        begin
            cy1:=cy1*(-1);
        end;
        gotoxy(x1,y1-1);
        write ('           ');
        gotoxy(x1,y1);
        textcolor(1);
        write (' <(\   /)> ');
        gotoxy(x1+5,y1);
        textcolor(26);
        write ('o');
        gotoxy(x1,y1+1);
        write ('           ');
        if (x1=7) or (x1=62) then
        begin
            cx1:=cx1*(-1);
        end;
        if (c1=6) or (c3=6) then
        begin
            clrscr;
            sound(400);
            delay(300);
            nosound;
            for i:=y1 to 24 do
            begin
                gotoxy(x1+4,i);
                textcolor(2);
                write ('o');
                if (i=y) and (x1>x-2) and (x1<x+2) then
                begin
                    sound(300);
                    delay(150);
                    nosound;
                    alive:=false;
                end;
            end;
            c1:=0; c3:=0;
        end;
    end;
end;

{procedure that controls enemy #2}
procedure enemy2(var cx2,cy2,x2,y2:integer);
var i:integer;
begin
    if (alive2) then
    begin
        inc (x2,cx2);
        inc (y2,cy2);
        if (y2=15) or (y2=3) then
        begin
            cy2:=cy2*(-1);
        end;
        gotoxy(x2,y2-1);
        write ('         ');
        gotoxy(x2,y2);
        textcolor(14);
        write (' -^\+/^- ');
        gotoxy(x2+4,y2);
        textcolor(36);
        write ('+');
        gotoxy(x2,y2+1);
        write ('         ');
        if (x2=6) or (x2=62) then
        begin
            cx2:=cx2*(-1);
        end;
        if (c2=7) or (c4=7) then
        begin
            clrscr;
            sound(500);
            delay(100);
            nosound;
            for i:= y2 to 24 do
            begin
                gotoxy(x2+4,i);
                textcolor (4);
                write ('"');
                if (i=y) and (x2>x-2) and (x2<x+2) then
                begin
                    sound(300);
                    delay(150);
                    nosound;
                    alive:=false;
                end;
            end;
            c2:=0; c4:=0;
        end;
    end;
end;

{procedure that controls enemy #3}
procedure enemy3(var cx3,cy3,x3,y3:integer);
var i:integer;
begin
    if (alive3) then
    begin
        inc (x3,cx3);
        inc (y3,cy3);
        if (y3=15) or (y3=3) then
        begin
            cy3:=cy3*(-1);
        end;
        gotoxy(x3,y3-1);
        write ('         ');
        gotoxy(x3,y3);
        textcolor (2);
        write (' -=\#/=- ');
        gotoxy(x3+4,y3);
        textcolor(39);
        write ('|');
        gotoxy(x3,y3+1);
        write ('         ');
        if (x3=6) or (x3=62) then
        begin
            cx3:=cx3*(-1);
        end;
        if (c5=4) then
        begin
            clrscr;
            sound(200);
            delay(200);
            nosound;
            for i:=y3 to 24 do
            begin
                gotoxy(x3+4,i);
                textcolor(15);
                write ('|');
                if (i=y) and (x3>x-2) and (x3<x+2) then
                begin
                    sound(300);
                    delay(150);
                    nosound;
                    alive:=false;
                end;
            end;
            c5:=0;
        end;
    end;
end;

{procedure to draw the ship (hero)}
procedure ship(var x,y:integer);
begin
    if (alive) then
    begin
        gotoxy(x,y-1);
        write ('        ');
        gotoxy(x,y);
        textcolor(4);
        write (' _/<^>\_ ');
        gotoxy(x+4,y);
        textcolor(30);
        write('^');
        gotoxy(x,y+1);
        write ('          ');
    end;
end;

{procedure for the ship (hero) to shoot}
procedure shoot(x,y,x1,y1,x2,y2,x3,y3:integer; var alive1,alive2,alive3:boolean);
var i:integer;
begin
    sound(600);
    delay(150);
    nosound;
    for i:=y-1 downto 4 do
    begin
        gotoxy(x+4,i);
        textcolor(14);
        write ('*');
        gotoxy(x+4,i+1);
        write (' ');
        delay(10);
        if (i=y1) and (x>x1-1) and (x<x1+1) then
        begin
            sound(100);
            delay(100);
            nosound;
            alive1:=false;
        end;
        if (i=y2) and (x>x2-1) and (x<x2+1) then
        begin
            sound (100);
            delay(100);
            nosound;
            alive2:=false;
        end;
        if (i=y3) and (x>x3-1) and (x<x3+1) then
        begin
            sound(100);
            delay(100);
            nosound;
            alive3:=false;
        end;
    end;
end;

{Main method}
BEGIN
    clrscr;
    x1:=40; y1:=4;    x2:=6;  y2:=10;  x3:=60;  y3:=14;
    cx1:=1;  cy1:=1;  cx2:=1;  cy2:=1;  cx3:=1;  cy3:=1;
    x:=38;  y:=23;
    c1:=0; c2:=0; c3:=0; c4:=0; c5:=0;
    play:=true;   alive:=true;
    alive1:=true; alive2:=true; alive3:=true;
    presentation;
    instructions;
    while (play) do
    begin
        ship(x,y);
        repeat
            enemy1(x,cx1,cy1,x1,y1);
            enemy2(cx2,cy2,x2,y2);
            enemy3(cx3,cy3,x3,y3);
            delay(200);
        until (keypressed);

        {72 up, 80 down, 75 left, 77 right, 32 space}

        if (keypressed) then
        begin
            key:=ord(readkey);
            if (key=72) and (y>17) and (alive) then
            begin
                c1:=c1+1;
                dec(y);
                ship(x,y);
            end;
            if (key=80) and (y<24) and (alive) then
            begin
                c2:=c2+1;
                inc(y);
                ship(x,y);
            end;
            if (key=75) and (x>7) and (alive) then
            begin
                c3:=c3+1;
                dec(x);
                ship(x,y);
            end;
            if (key=77) and (x<66) and (alive) then
            begin
                c4:=c4+1;
                inc(x);
                ship(x,y);
            end;
            if (key=32) and (alive) then
            begin
                c5:=c5+1;
                shoot(x,y,x1,y1,x2,y2,x3,y3,alive1,alive2,alive3);
            end;
            if (key=27) then
            begin
                play:=false;
            end;
            if (alive1=false) and (alive2=false) and (alive3=false) then
            begin
                gotoxy(15,10);
                writeln ('  #####    ##  #   #   ##   #####  #######  ####### ');
                gotoxy(15,11);
                writeln (' #     #  #  # ##  #  #  # #     #    #     #');
                gotoxy(15,12);
                writeln (' #        #### # # #  ####  ##        #     #####');
                gotoxy(15,13);
                writeln (' #   ###  #  # # # #  #  #    ###     #     #');
                gotoxy(15,14);
                writeln (' #     #  #  # #  ##  #  # #     #    #     #######');
                gotoxy(15,15);
                writeln ('  #####   #  # #  ##  #  #  #####     #     #######');
                gotoxy(15,17);
                textcolor(2);
                writeln (' Press Esc to exit...');
            end;
            if (alive=false) then
            begin
                clrscr;
                textcolor(5);
                gotoxy(15,18);
                writeln ('  #####    ##   #####   ##   ####  #######  ####### ');
                gotoxy(15,19);
                writeln (' #     #  #  # #     # #  # #    #    #     #');
                gotoxy(15,20);
                writeln (' #        #### #       ####  ##       #     #####');
                gotoxy(15,21);
                writeln (' #        #  # #   ### #  #    ###    #     #');
                gotoxy(15,22);
                writeln (' #     #  #  # #     # #  # #     #   #     #######');
                gotoxy(15,23);
                writeln ('  #####   #  #  #####  #  #  #####    #     #######');
                gotoxy(15,25);
                textcolor (2);
                writeln (' Press Esc to exit...');
            end;
        end;
    end;
END.
