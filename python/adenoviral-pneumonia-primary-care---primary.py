# Eleftheria Vasileiou, Chukwuma Iwundu, Alex Williams, Clare MacRae, 2023.

import sys, csv, re

codes = [{"code":"125510013","system":"snomedct"},{"code":"301363018","system":"snomedct"},{"code":"301364012","system":"snomedct"},{"code":"301809014","system":"snomedct"},{"code":"301814013","system":"snomedct"},{"code":"3163841000006112","system":"snomedct"},{"code":"546491000006118","system":"snomedct"},{"code":"125510013","system":"snomedct"},{"code":"301363018","system":"snomedct"},{"code":"301364012","system":"snomedct"},{"code":"301809014","system":"snomedct"},{"code":"301814013","system":"snomedct"},{"code":"3163841000006112","system":"snomedct"},{"code":"546491000006118","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pneumonia-primary-care-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["adenoviral-pneumonia-primary-care---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["adenoviral-pneumonia-primary-care---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["adenoviral-pneumonia-primary-care---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
