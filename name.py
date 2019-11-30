import re

file_w = open('tree.pl', 'w')
with open('royal_gen_20_11_2002.ged') as file_r:
    print('Start')
    for line in file_r:
        if re.match('0 @I[0-9]*@ INDI', line):
            mas = line.split('@', 3)
            file_w.write('get_name("@'+mas[1]+'@", ')
        elif line[0:6] == '1 NAME':
            str = line[7:len(line)-2]
            str = str.replace('"','')
            file_w.write('"'+str + '").' + '\n')
        elif re.match('0 @F[0-9]*@ FAM', line):
            str_f = str_m = ''
        elif line[0:6] == '1 HUSB':
            str_f = 'father("'+line[7:len(line) - 1]+'", '
        elif line[0:6] == '1 WIFE':
            str_m = 'mother("'+line[7:len(line) - 1]+'", '
        elif line[0:6] == '1 CHIL':
            str = '"'+line[7:len(line)-1]+'").\n'
            if str_f != '':
                file_w.write(str_f + str)
            if str_m != '':
                file_w.write(str_m + str)

print('End')
file_w.close()
file_r.close()