# Eleftheria Vasileiou, Chukwuma Iwundu, Alex Williams, Clare MacRae, 2023.

import sys, csv, re

codes = [{"code":"1772731000006112","system":"snomedct"},{"code":"1772741000006119","system":"snomedct"},{"code":"5887681000006112","system":"snomedct"},{"code":"5887711000006113","system":"snomedct"},{"code":"5887721000006117","system":"snomedct"},{"code":"5887731000006119","system":"snomedct"},{"code":"5887771000006116","system":"snomedct"},{"code":"5887781000006118","system":"snomedct"},{"code":"5887791000006115","system":"snomedct"},{"code":"1772731000006112","system":"snomedct"},{"code":"1772741000006119","system":"snomedct"},{"code":"5887681000006112","system":"snomedct"},{"code":"5887711000006113","system":"snomedct"},{"code":"5887721000006117","system":"snomedct"},{"code":"5887731000006119","system":"snomedct"},{"code":"5887771000006116","system":"snomedct"},{"code":"5887781000006118","system":"snomedct"},{"code":"5887791000006115","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pneumonia-primary-care-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["lower-pneumonia-primary-care---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["lower-pneumonia-primary-care---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["lower-pneumonia-primary-care---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
