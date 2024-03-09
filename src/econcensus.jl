module econcensus
using CSV, DataFrames, Missings, Dates, Serialization, Chain, AnalysisUtils
export readbasic, inspectbasic

"""
    readbasic(datap, filename)

Read a census basic economic data file for a single year.

Skip data row 2 which holds explanatory labels for the header row.
Lowercase header names and remove columns where all values are missing.
Arguments: datapath and filename
Returns: a data frame
"""
function readbasic(datap, filename)
    inputp = joinpath(datap, filename)
    df = CSV.read(inputp, DataFrame; normalizenames = true, skipto = 3)
    rename!(lowercase, df)
    select!(df, Not(names(df, Missing)))
end

"""
    inspectbasic(datap, filename)

Read a serialized data frame. Describe and summarize.
Arguments: datapath and filename
Returns: text description and summary of dataframe
"""
function inspectbasic(datap, filename)
    inputp = joinpath(datap, filename)
    df = deserialize(inputp)
    describeDF(df, "2022 Basic Econ Data from US Census", ())
end

end # module econcensus
