# This file was generated, do not modify it. # hide
using CSV
using DataFrames
using Printf

# read input data
input_files = readdir("_assets/salary_data")
input_files = filter(x -> occursin(r"^CNRS.*\.csv$", x), input_files)

# month number to month name
month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""]

# read the CSV file
template_df = CSV.read("_assets/parsed_tables/table_template.csv", DataFrame;types=String)

# build a table for each input file
for input in sort(input_files, rev=true)
    # write title in markdown
    input_name = split(input, "_")
    if length(input_name) == 3
	input_year = parse(Int, input_name[2])
	input_month = parse(Int, input_name[3][1:end-4])
    else
	input_year = parse(Int, input_name[2][1:end-4])
	input_month = 13
    end
    println("## $(month_names[input_month]) $(input_year)")

    # read the input file
    t_salaries = CSV.read("_assets/salary_data/$(input)", DataFrame)
    t_z0 = map((x)->@sprintf("%s",x),t_salaries[:, "experience"])
    t_z1 = map((x)->@sprintf("%.2f",x),t_salaries[:, "zone 1"])
    t_z2 = map((x)->@sprintf("%.2f",x),t_salaries[:, "zone 2"])
    t_z3 = map((x)->@sprintf("%.2f",x),t_salaries[:, "zone 3"])

    # write parsed table as a file
    t_out = copy(template_df)
    t_out[:, "Experience (y)"] .= t_z0
    t_out[:, "Brut salary (€) zone 1"] .= t_z1
    t_out[:, "Brut salary (€) zone 2"] .= t_z2
    t_out[:, "Brut salary (€) zone 3"] .= t_z3
    CSV.write("_assets/parsed_tables/$(input)", t_out)

    # write the table in markdown
    println("\\tableinput{}{parsed_tables/$(input)}")
end
# hideall