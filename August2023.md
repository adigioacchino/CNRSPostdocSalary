


This is a test!

```julia:./code/table_builder
using CSV
using DataFrames

# read input data
input_files = readdir("salary_data")
input_files = filter(x -> occursin(r"\.txt$", x), input_files)

# month number to month name
month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

# read the CSV file
template_df = CSV.read("_assets/parsed_tables/table_template.csv", DataFrame)

# build a table for each input file
for input in input_files
    # write title in markdown
    input_year = parse(Int, split(input, "_")[1])
    input_month = parse(Int, split(input, "_")[2][1:end-4])
    println("## $(month_names[input_month]) $(input_year)")

    # read the input file
    t_salaries = parse.(Float64, readlines("salary_data/$(input)"))

    # write parsed table as a file
    t_out = copy(template_df)
    t_out[:, "Salary (€ brut)"] .= t_salaries
    CSV.write("_assets/parsed_tables/$(input)", t_out)

    # write the table in markdown
    println("\\tableinput{}{parsed_tables/$(input)}")
end
# hideall
```

\textoutput{./code/table_builder}