 #Displays Nobel prizes for 1950
 select yr,subject,winner from nobel where yr=1950;
 
#Show who won the 1962 prize for Literature.
select winner from nobel where yr=1962 and subject='Literature';

#Show the year and subject that won 'Albert Einstein' his prize.
select yr,subject from nobel where winner='Albert Einstein';

#Give the name of the 'Peace' winners since the year 2000, including 2000.
select winner from nobel where subject='Peace' and yr>=2000;

#Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
select yr,subject,winner from nobel where (subject='Literature') and (yr between 1980 and 1989);

#Show all details of the presidential winners:
#Theodore Roosevelt
#Woodrow Wilson
#Jimmy Carter
#Barack Obama
select yr,subject,winner from nobel where winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama');

#Show the winners with first name John
select winner from nobel where winner like 'John%';

#Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
select yr,subject,winner from nobel where subject='Physics' and yr=1980
UNION
select yr,subject,winner from nobel where subject='Chemistry' and yr=1984;

#Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
select yr,subject,winner from nobel where yr=1980 and subject not in ('Chemistry','Medicine');

#Show year, subject, and name of people who won a 'Medicine' prize in an early year 
#(before 1910, not including 1910) together with winners of a 'Literature' prize in 
#a later year (after 2004, including 2004)
select yr,subject,winner from nobel where (subject='Medicine' and yr<1910) OR
(subject='Literature' and yr>=2004);

#Find all details of the prize won by EUGENE O'NEILL
select yr,subject,winner from nobel where winner = 'Eugene o''neill';

#List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
select winner,yr,subject 
from nobel 
where winner like 'Sir%'
ORDER BY yr DESC,winner;

/*The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.*/
SELECT winner, subject
 FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner;

#Show the name of winner's names beginning with C and ending in n
select winner from nobel where winner like 'C%' and winner like '%n';

#Shows how many Chemistry awards were given between 1950 and 1960
select count(subject) from nobel where subject='Chemistry' and yr between 1950 and 1960;

#Shows the amount of years where no Medicine awards were given
select count(distinct yr) from nobel where yr
NOT IN (select distinct yr from nobel where subject='Medicine');

#show the year when neither a Physics or Chemistry award was given
select yr from nobel where yr NOT IN (select yr from nobel where subject IN ('Physics','Chemistry'));

#shows the years when a Medicine award was given but no Peace or Literature award was
select yr from nobel where subject='Medicine' and yr NOT IN
(select yr from nobel where subject IN ('Peace','Literature'));





