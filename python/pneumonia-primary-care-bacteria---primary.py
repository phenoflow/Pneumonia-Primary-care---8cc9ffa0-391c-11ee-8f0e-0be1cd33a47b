# Eleftheria Vasileiou, Chukwuma Iwundu, Alex Williams, Clare MacRae, 2023.

import sys, csv, re

codes = [{"code":"H22..00","system":"readv2"},{"code":"H22..11","system":"readv2"},{"code":"H22y.00","system":"readv2"},{"code":"H22yz00","system":"readv2"},{"code":"H22z.00","system":"readv2"},{"code":"Hyu0A00","system":"readv2"},{"code":"Hyu0C00","system":"readv2"},{"code":"H22..00","system":"readv2"},{"code":"H22..11","system":"readv2"},{"code":"H22y.00","system":"readv2"},{"code":"H22yz00","system":"readv2"},{"code":"H22z.00","system":"readv2"},{"code":"Hyu0A00","system":"readv2"},{"code":"Hyu0C00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pneumonia-primary-care-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pneumonia-primary-care-bacteria---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pneumonia-primary-care-bacteria---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pneumonia-primary-care-bacteria---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
