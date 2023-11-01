@def title = "How to contribute"

# Retrieving salary tables
Retrieving salary tables is a tedious task. In the case of CNRS, for example, they are buried in the [Bulletin Officiel](https://www.cnrs.fr/fr/bulletin-officiel) and they are not easy to find.
Moreover, we will not be postdocs forever (hopefully), so we will have less personal interest in keeping this website up-to-date.
For these reasons, we would like to ask you to help us in maintaining and expanding this website by contributing new salary tables.

# Updating existing pages

If you want to update an already existing page of a certain Host institution, the procedure is relatively easy:
1. find the table you want to contribute; examples of what to search for are in the [Official sources](/pages/sources) page;
2. prepare a CSV file ("HOST\_YYYY\_MM.csv" or "HOST\_YYYY.csv") with the following columns:
    - `experience`: years of experience after PhD.
    - `zone 1`: monthly salary in zone 1;
    - `zone 2`: monthly salary in zone 2;
    - `zone 3`: monthly salary in zone 3;
    The CSV file should have one row for each step of the salary scale in addition to the headers. You can see a template [here](/assets/salary_data/CNRS_2020_01.csv).
3. if you are practical with GitHub, you can open a pull request in [this website's repository](https://github.com/adigioacchino/CNRSPostdocSalary) with the CSV file in the `_assets/salary_data` folder, we will check it and merge it; otherwise, you can send us the CSV file [by email](/pages/contacts) and we will take care of it.

# Adding Host institutions

If you want to contribute with information on Host institutions we could not find yet, or to explain to us in simple words how to obtain the figures from a ["point d'indice"](https://www.fonction-publique.gouv.fr/etre-agent-public/ma-remuneration/ma-remuneration-tout-comprendre/connaitre-le-point-dindice), feel free to [contact us](/pages/contacts)! Any help is crucial.
