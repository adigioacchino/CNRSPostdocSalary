using Test
using CSV
using DataFrames
using Printf

# Month number to month name
month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""]

@testset "Table parsing" begin
    # This test checks that the table parsing correctly extracts the data from the raw tables in _assets/salary_data

    # Read input data
    input_files = readdir("_assets/salary_data")

    # Build a table for each input file
    for input in sort(input_files, rev=true)

        # Construct the month and year from the input file name
        input_name = split(input, "_")
        if length(input_name) == 3
            input_year = parse(Int, input_name[2])
            input_month = parse(Int, input_name[3][1:end-4])
        else
            input_year = parse(Int, input_name[2][1:end-4])
            input_month = 13
        end

        # Test that the month and year are in the expected range
        @test input_month <= 13
        @test input_year >= 2000

        # Read the input file
        t_salaries = CSV.read("_assets/salary_data/$(input)", DataFrame)

        # Test that the table has the expected columns
        @test "experience" in names(t_salaries)
        @test "zone 1" in names(t_salaries)
        @test "zone 2" in names(t_salaries)
        @test "zone 3" in names(t_salaries)

        # Test that the table has at least one row
        @test size(t_salaries, 1) > 0

        # Check types: experience should be a string, zones should be Float64
        @test eltype(t_salaries[:, "experience"]) <: AbstractString
        @test eltype(t_salaries[:, "zone 1"]) <: Number
        @test eltype(t_salaries[:, "zone 2"]) <: Number
        @test eltype(t_salaries[:, "zone 3"]) <: Number
    end
end
