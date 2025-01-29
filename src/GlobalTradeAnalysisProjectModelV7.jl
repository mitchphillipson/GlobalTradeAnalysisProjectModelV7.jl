module GlobalTradeAnalysisProjectModelV7

export generate_starting_values, get_sample_data, solve_model, calculate_ev, calibrate, calculate_gdp, aggregate_data, aggregate_data_legacy, model_container, build_model!, initialize_model!, extract_model!

using NamedArrays, Ipopt, JuMP, JLD2
import ComputableGeneralEquilibriumHelpers: cde, ces

# A container of all data for a model
mutable struct model_container
    model
    data
    parameters
    sets
    fixed
end

include("./helpers/aggComb.jl")
include("./helpers/agg.jl")

include("./helpers/prepare_sets.jl")
include("./helpers/prepare_parameters.jl")
include("./helpers/prepare_initial_values.jl")
include("./helpers/prepare_taxes.jl")
include("./helpers/prepare_quantities.jl")
include("./helpers/prepare_initial_calibrated_parameters.jl")

# The main model function
include("./solve_model.jl")
include("./calibrate.jl")
include("./calculate_ev.jl")
include("./calculate_gdp.jl")

# Function that aggregates data on the assumption that the standard GTAP data are provided (based on headers)
include("./aggregate_data.jl")
include("./aggregate_data_legacy.jl")

# Function that calculates starting values for data and parameters
include("./generate_starting_values.jl")

# Get sample data
include("./get_sample_data.jl")


include("./build_model!.jl")
include("./extract_model!.jl")
include("./initialize_model!.jl")

end
