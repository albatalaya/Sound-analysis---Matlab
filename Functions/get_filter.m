function [H] = get_filter(data,start_A,b)
    H=zeros(length(data),1);
    approaching= 2; % 0 false, 1 true, 2 null
    margin=0;

    for i=2:length(data) %% Get H
        if (data(i)> start_A) 
            if data(i)>=data(i-1)&& data(i)-data(i-1)>1
                if approaching==1
                    margin=0;
                    H(i)=1; %% if the car is already approaching
                else if approaching==2  % if the car starts to approach
                        H(i)=1;
                        approaching=1;
                        margin=0;
                    else 
                        approaching=0;%%%%%% deixar marge
                    end
                end
            else if margin<b && approaching==1
                    H(i)=0.75;
                    margin=margin+1;   
                end
            end
        else
            approaching=2;
        end
    end
end

