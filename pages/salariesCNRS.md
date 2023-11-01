
@def title = "CNRS salary tables"

# Salaries of CNRS postdocs
The salary of a CNRS postdoc depends on their experience (more specifically, the number of years since they obtained their PhD).
Up to 2 years of experience, the CNRS fixes only minimum and maximum values, and the actual figure in this range is decided by the host laboratory.
After 2 years of experience, the CNRS fixes the salary sharply.
The salary changes slightly based on the zone where the laboratory is located (zone 1 to 3 in the tables). 
Paris is in zone 1.

An important thing to keep in mind is that the CNRS salary _does not evolve automatically_ with time, but it is determined at the moment of the hiring and it stays the same until the end of the contract, extensions included.
This means that if you are hired with a 3-year contract immediately after your PhD, you will have the same salary for the whole duration of the contract, but if you change host laboratory after 2 years, you will have a higher salary in the new laboratory.
In some cases, a raise to adjust for inflation could be implemented retroactively, so that your current salary could not match exactly the table at the time of your recruitment.



# Salary tables

Salary tables contain monthly brut salaries, and are sorted from the most recent to the oldest.


```julia:./code/table_builder
using CSV
using DataFrames
using Printf

# read input data
input_files = readdir("_assets/salary_data")
input_files = filter(x -> occursin("CNRS", x), input_files)

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
```

\textoutput{./code/table_builder}
