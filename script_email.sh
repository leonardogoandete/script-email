
#! /bin/bash
# 62881 menor id de um Deputado da 56º(01/02/2019 a 31/01/2023) legislatura
count=62850
echo "Script iniciado em: " $(date) >> script_emails.log
echo "Lista de emails:" >> emails.txt
while [ $count -le 250000 ]
do
$(wget https://www.camara.leg.br/deputados/$count)
echo "Executando o CAT no arquiv $count"
cat $count | grep @camara | cut -f1 -d">" | cut -c70-200 | cut -f1 -d"\"" >> emails.txt
echo "Excluindo arquivo $count"
rm -Rf $count
((count++))
done
echo "Script finalizado em: " $(date) >> script_emails.log
