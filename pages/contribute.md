@def title = "How to contribute"

# Retrieving salary tables
Retrieving salary tables is a tedious task, since they are buried in the [Bulletin Officiel du CNRS](https://www.cnrs.fr/fr/bulletin-officiel) and they are not easy to find.
Moreover, we will not be postdocs forever (hopefully), so we will have less personal interest in keeping this website up-to-date.
For these reasons, we would like to ask you to help us in keeping this website up-to-date by contributing new salary tables.
To do so, follow these instructions:
1. find the table you want to contribute in the [Bulletin Officiel du CNRS](https://www.cnrs.fr/fr/bulletin-officiel); you can find examples of what to search for in the [Official sources](/pages/sources) section;
2. prepare a CSV file with the following columns:
    - `1ere zone`: salary in zone 1;
    - `2e zone`: salary in zone 2;
    - `3e zone`: salary in zone 3;
    The CSV file should have one row for each step of the salary scale in addition to the headers, and the first two rows must be the minimum and maximum salary for the case with less than two years of experience. You can see a template [here](https://github.com/adigioacchino/CNRSPostdocSalary/tree/main/_assets/salary_data/2020_01.csv).
3. if you are practical with GitHub, you can open a pull request with the CSV file in the `_assets/salary_data` folder, we will check it and merge it if everything is ok; otherwise, you can send us the CSV file [by email](/pages/contacts) and we will take care of it.
