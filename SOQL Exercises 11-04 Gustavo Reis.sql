/*1. Selecione o nome, valor e data de fechamento das oportunidades.*/
SELECT Name, Amount, CloseDate FROM Opportunity

/*2. Selecione o nome e valor das oportunidades com data de fechamento maior que 01/06/2021. */
SELECT Name, Amount, CloseDate FROM Opportunity 
WHERE CloseDate > 2021-06-01

/*3. Selecione o nome da oportunidade, valor, descrição e next step das oportunidades com fase Closed won
 e valor acima de 100000.*/
SELECT Name, Amount, Description, NextStep FROM Opportunity 
WHERE StageName = 'Closed Won' AND Amount > 100000

/*4. Selecione o nome, classificação, tipo, ano de início das contas que possuam ‘Uni’
 no começo do nome da conta. */
SELECT Name, Rating, Type, YearStarted FROM Account
 WHERE Name like 'Uni%'

/*5. Selecione o nome completo, empresa e email dos leads com ‘.net’ no final do email e 
status do lead como Working - Contacted.*/
SELECT FirstName, LastName, Company, Email FROM Lead 
WHERE email like '%.net' AND Status = 'Working - Contacted'

/*6. Selecione o nome e conte a quantidade de oportunidades agrupadas por nome.*/
SELECT Name, COUNT(ID) FROM Opportunity GROUP BY name

/*7. Selecione o nome e conte a quantidade de oportunidades agrupadas por nome 
havendo 3 oportunidades agrupadas.  */

SELECT Name, COUNT(ID) FROM Opportunity GROUP BY name HAVING Count(Id) > 3


/*8. Selecione o nome, valor, fase, next step e descrição das oportunidades que possuem ‘Oil’ ou 
‘Gene’ em qualquer parte do nome. */

SELECT Name, Amount, StageName, NextStep, Description FROM Opportunity  
WHERE name like '%Oil%' OR name like '%Gene%'

/*9. Selecione o nome, valor, fase, data de criação e data de fechamento das oportunidades
 com fase ‘Closed Won’ e valor menor que 80000, exiba os valores formatados, ordenado por valor de 
 maneira decrescente. */
SELECT Name, FORMAT(Amount), StageName,format(CreatedDate), format(CloseDate) 
FROM Opportunity 
WHERE StageName = 'Closed Won' AND  Amount > 80000 ORDER BY Amount DESC

/*10. Selecione o nome, telefone de contas e o nome, valor e fase das oportunidades ligadas a cada conta. */

SELECT Name, Phone, (SELECT Name, Amount, StageName FROM Opportunities) FROM Account

/*11. Selecione o nome, de contas ordenadas pelo nome da conta. E ligada a cada conta, 
mostre o nome e valor das oportunidades e mostre também nome dos contatos que tem nome 
iniciando com A, associados a cada conta.*/

SELECT Name , 
(SELECT Name, Amount FROM Opportunities),
(SELECT Name FROM contacts WHERE Name LIKE 'A%')
FROM Account ORDER BY Name

/*12. Selecione o nome, fase, next step e valor das oportunidades com valor abaixo de 100000 
e com fechamento ocorrido no trimestre passado.*/

SELECT Name, StageName, NextStep, Amount 
FROM Opportunity  
WHERE Amount < 100000 AND CloseDate  = LAST_90_DAYS
