function output = new_conv(input,filter)
    [x,y] = size(input);
    container = zeros(x+2,y+2);
    container(2:end-1,2:end-1) = input;

    output = zeros(x,y);
    j = 1; i = 1;
    while j ~= y
       if i == x+1
           i= 1;
           j = j+1;
       end
       element = [container(i,j),container(i,j+1),container(i,j+2);
       container(i+1,j),container(i+1,j+1),container(i+1,j+2);
       container(i+2,j),container(i+2,j+1),container(i+2,j+2)].*filter;

       output(i,j)=sum(sum(element));
       i = i+1; 

    end
end
   
