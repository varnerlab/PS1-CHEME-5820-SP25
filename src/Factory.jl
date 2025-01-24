function build(modeltype::Type{MyNaiveKMeansClusteringAlgorithm}, data::NamedTuple)::MyNaiveKMeansClusteringAlgorithm
    
    # build an empty model -
    model = modeltype();

    # get data -
    K = data.K;
    ϵ = data.ϵ;
    maxiter = data.maxiter;
    dimension = data.dimension;
    number_of_points = data.number_of_points;
    dataset = data.dataset;

    # setup the initial assignments -
    assignments = zeros(Int64, number_of_points);
    for i ∈ 1:number_of_points
        assignments[i] = rand(1:K); # randomly assign points to clusters
    end

    # setup the centriods, based upon the random assignments -
    centroids = Dict{Int64, Vector{Float64}}();
    for k ∈ 1:K
        
        centroids[k] = zeros(Float64, dimension); # initialize the centroid
        index_of_cluster_k = findall(x-> x == k, assignments); # index of the data vectors assigned to cluster k
        if (isempty(index_of_cluster_k) == true)
            continue;
        else
            for d ∈ 1:dimension
                centroids[k][d] = mean(dataset[index_of_cluster_k, d]);
            end
        end
    end

    # set the data on the model -
    model.K = K;
    model.ϵ = ϵ;
    model.maxiter = maxiter;
    model.dimension = dimension;
    model.number_of_points = number_of_points;
    model.assignments = assignments;
    model.centroids = centroids;

    # return the model -
    return model;
end