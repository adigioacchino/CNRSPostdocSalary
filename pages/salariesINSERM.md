@def title = "INSERM salary tables"

# Salaries of INSERM postdocs
The salary of an INSERM postdoc depends on their experience (more specifically, the number of years since they obtained their PhD).
The salary changes slightly based on the zone where the laboratory is located (zone 1 to 3 in the tables). 
Paris is in zone 1.

As for CNRS, the INSERM salary of non-permanent personnel _does not evolve automatically_ with time, but it is determined at the moment of recruitment and it stays the same until the end of the contract.
However, at least for the case of the update implemented in January 2023, a federation of collectives and unions negotiated with the administration an [agreement](https://web.sntrscgt.fr/spip.php?article3423) providing an automatic update of the salary of previously hired personnel _at the moment of the renewal of their contract_ (but not during its course, and with some critical issues on how to find the money).

# INSERM Salary tables

Salary tables contain monthly brut salaries, and are sorted from the most recent to the oldest.


```julia:./code/table_builder
using CSV
using DataFrames
using Printf

# read input data
input_files = readdir("_assets/salary_data")
input_files = filter(x -> occursin(r"^INSERM.*\.csv$", x), input_files)

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
