# Eleftheria Vasileiou, Chukwuma Iwundu, Alex Williams, Clare MacRae, 2023.

import sys, csv, re

codes = [{"code":"3334901000006115","system":"snomedct"},{"code":"3334911000006117","system":"snomedct"},{"code":"3334931000006111","system":"snomedct"},{"code":"3334941000006118","system":"snomedct"},{"code":"633531000006116","system":"snomedct"},{"code":"3334901000006115","system":"snomedct"},{"code":"3334911000006117","system":"snomedct"},{"code":"3334931000006111","system":"snomedct"},{"code":"3334941000006118","system":"snomedct"},{"code":"633531000006116","system":"snomedct"},{"code":"H22y011","system":"readv2"},{"code":"H22y011","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pneumonia-primary-care-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pneumonia-primary-care-ecoli---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pneumonia-primary-care-ecoli---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pneumonia-primary-care-ecoli---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
