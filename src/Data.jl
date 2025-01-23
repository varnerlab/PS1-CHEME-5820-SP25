function generatedata(center::Tuple{Float64,Float64}; 
    number_of_points::Int = 100, label::Int = 1, radius::Float64 = 1.0)::Array{Float64,2}

    # initialize -
    data = zeros(number_of_points, 3);

    # generate the data -
    for i ∈ 1:number_of_points
        
        θ = rand() * 2π; # random angle
        r = rand() * radius; # random radius

        # generate random data points -
        data[i,1] = center[1] + r * cos(θ); # x
        data[i,2] = center[2] + r * sin(θ); # y
        data[i,3] = label; # set the label
    end

    # return -
    return data;
end