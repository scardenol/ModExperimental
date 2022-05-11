function rgb = my_color(col)
colors = [[ 238, 0, 0 ]% rojo
    [ 255, 125, 35 ]% naranja
    [ 255, 192, 35 ]% amarillo
    [  182, 255, 0 ] %lima
    [ 30, 220, 24] % verde
    [ 37, 255, 252 ] % cyan
    [37, 172, 255] % blue
    [130, 35, 250] % purple
    [229, 24, 179] % magenta
    [24, 102, 229] % azul rey
    [ 205, 168, 0] % dark yellow
    [ 255, 123, 225] % pink
    [6, 124, 223] % blue Matlab.
    ]/255;
switch col
    case 'red'
        rgb = colors(1,:);
    case 'orange'
        rgb = colors(2,:);
    case 'yellow'
        rgb = colors(3,:);
    case 'lime'
        rgb = colors(4,:);
    case 'green'
        rgb = colors(5,:);
    case 'cyan'
        rgb = colors(6,:);
    case 'blue'
        rgb = colors(7,:);
    case 'purple'
        rgb = colors(8,:);
    case 'magenta'
        rgb = colors(9,:);
    case 'blue2'
        rgb = colors(10,:);     
    case 'yellow1'
        rgb = colors(11,:); 
    case 'pink'
        rgb = colors(12,:);
    case 'blue1'
        rgb = colors(13,:);
end
end
