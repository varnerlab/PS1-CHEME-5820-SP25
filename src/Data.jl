function fixedcircle(center::Tuple{Float64,Float64}; 
    number_of_points::Int = 100, radius::Float64 = 1.0)::Array{Float64,2}

    # initialize -
    data = zeros(number_of_points, 2);
    θ = range(0, 2π, length=number_of_points);

    # generate the data -
    for i ∈ 1:number_of_points
        # generate random data points -
        data[i,1] = center[1] + radius * cos(θ[i]); # x
        data[i,2] = center[2] + radius * sin(θ[i]); # y
    end

    # return -
    return data;
end

function generatedata(center::Tuple{Float64,Float64}; 
    number_of_points::Int = 100, radius::Float64 = 1.0, label::Int64 = 1)::Array{Float64,2}

    # initialize -
    data = zeros(number_of_points, 3);

    # generate the data -
    for i ∈ 1:number_of_points
        
        θ = rand() * 2π; # random angle
        r = rand() * radius; # random radius

        # generate random data points -
        data[i,1] = center[1] + r * cos(θ); # x
        data[i,2] = center[2] + r * sin(θ); # y
        data[i,3] = label; # label
    end

    # return -
    return data;
end