# About this readme
This readme file contains information about the technical aspects of the website, and how to contribute to it.
All the information regarding the *content* of the website is in the website itself, and you can find it following [this link](https://adigioacchino.github.io/CNRSPostdocSalary/index.html).

## About the website
This website is created using the [Franklin.jl](https://franklinjl.org/) package, which is a static site generator for Julia. 
In the folder `pages` you can find the markdown files that contain the content of the website, and in the folder `_assets` you can find the data used in the website.
The pages with salary tables are generated using the Julia code embedded in the markdown files (see the [Franklin guide](https://franklinjl.org/code/)), which reads the data from the CSV files in the `_assets/salary_data` folder and generates the markdown tables in the `_assets/parsed_tables` folder.

## How to serve the website locally
To serve the website locally, you need to have Julia installed on your machine. 
Then, you can install the required packages by running the following command in the Julia REPL:
```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()
```
After that, you can serve the website locally by running the following command in the Julia REPL:
```julia
using Pkg
Pkg.activate(".")
using Franklin
serve()
```
Notice that it might be needed to serve the website twice to see the changes in the tables.