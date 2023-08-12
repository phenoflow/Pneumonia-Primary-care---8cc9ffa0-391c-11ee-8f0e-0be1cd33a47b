# Eleftheria Vasileiou, Chukwuma Iwundu, Alex Williams, Clare MacRae, 2023.

import sys, csv, re

codes = [{"code":"1229740013","system":"snomedct"},{"code":"1232627018","system":"snomedct"},{"code":"12721231000006111","system":"snomedct"},{"code":"301357010","system":"snomedct"},{"code":"301413010","system":"snomedct"},{"code":"301414016","system":"snomedct"},{"code":"301430012","system":"snomedct"},{"code":"301431011","system":"snomedct"},{"code":"3164871000006118","system":"snomedct"},{"code":"3555871000006115","system":"snomedct"},{"code":"3555881000006117","system":"snomedct"},{"code":"3555891000006119","system":"snomedct"},{"code":"3555901000006115","system":"snomedct"},{"code":"546421000006115","system":"snomedct"},{"code":"778871000006116","system":"snomedct"},{"code":"885251000006114","system":"snomedct"},{"code":"885271000006116","system":"snomedct"},{"code":"1229740013","system":"snomedct"},{"code":"1232627018","system":"snomedct"},{"code":"12721231000006111","system":"snomedct"},{"code":"301357010","system":"snomedct"},{"code":"301413010","system":"snomedct"},{"code":"301414016","system":"snomedct"},{"code":"301430012","system":"snomedct"},{"code":"301431011","system":"snomedct"},{"code":"3164871000006118","system":"snomedct"},{"code":"3555871000006115","system":"snomedct"},{"code":"3555881000006117","system":"snomedct"},{"code":"3555891000006119","system":"snomedct"},{"code":"3555901000006115","system":"snomedct"},{"code":"546421000006115","system":"snomedct"},{"code":"778871000006116","system":"snomedct"},{"code":"885251000006114","system":"snomedct"},{"code":"885271000006116","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pneumonia-primary-care-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pneumonia-primary-care-parainfluenzal---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pneumonia-primary-care-parainfluenzal---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pneumonia-primary-care-parainfluenzal---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
