#show the population of Germany
select population from world where name= 'Germany';

#Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
select name,population FROM world where name IN ('Sweden','Norway','Denmark');

#Show the country and the area for countries with an area between 200,000 and 250,000.
select name,area FROM world where area BETWEEN 200000 AND 250000;

#show the name, continent and population of all countries.
SELECT name, continent, population FROM world;

#Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros
SELECT name from world where population>200000000;

#Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population from world where population>200000000;

#Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name,population/1000000 from world where continent='South America';

#Show the name and population for France, Germany, Italy
SELECT name,population from world where name in ('France','Germany','Italy');

#Show the countries which have a name that includes the word 'United'
select name from world where name LIKE '%United%';

#Show the countries that are big by area or big by population. Show name, population and area.
#Two ways to be big: 
#A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
SELECT name,population,area from world where area>3000000 OR population>250000000; 

#Show the countries that are big by area or big by population but not both. Show name, population and area.
SELECT name,population,area from world where area>3000000 XOR population>250000000;

#Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
#Use the ROUND function to show the values to two decimal places.
SELECT name,ROUND(population/1000000,2) as population,ROUND(gdp/1000000000,2) as GDP from world where continent='South America';

#Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). 
#Round this value to the nearest 1000.
SELECT name,ROUND(gdp/population,-3) as PGDP from world where gdp>1000000000000;

#Show the name and capital where the name and the capital have the same number of characters.
select name,capital from world where LENGTH(name) =LENGTH(capital);

#Show the name and the capital where the first letters of each match. 
#Don't include countries where the name and the capital are the same word.
select name,capital from world where left(name,1)=left(capital,1) AND name <> capital;

#Find the country that has all the vowels and no spaces in its name.
select name from world where name like '%a%' AND name like '%e%' AND name like '%i%' AND name like '%o%' AND name like '%u%' AND name not like '% %';