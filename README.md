# AudioBookList

## Introduction ##
AudioBookList shall become a website where you can add audiobooks to your personal list. 

AudioBookList should let you write and read reviews about audiobooks.

## Technologies Used ##
Database: MySQL

Backend Logic: Java Servlets / Java Server Pages

Front End: HTML, CSS and JavaScript (Framework used: Zurb Foundation 6)

Server: Apache Tomcat 9

Java Persistance Api (JPA): EclipseLink (2.6.4)

## How to get it up and running ##
Database: install MySQL, create a schema 'audiobooklist' and execute the 'audiobooksql.sql' file.

Server: install Apache Tomcat 9

For the general project: import the 'AudioBookList' project folder. 
You need to edit the files: context.xml (if you are using tomcat9) and persistence.xml 

I use netbeans with Java EE Support as IDE. 

# Task List #
* Pages 
- [x] Login Page 
- [x] Register Page 
- [ ] Index (Logged in view)
- [ ] Audiobook Page
- [ ] Review Page 
- [ ] My AudioBook List Page 
- [ ] Search Result Page
- [ ] About Us Page 
* Logic
- [x] MVC Controller 
- [x] Register
- [x] Login
- [x] Sign Out
- [ ] Review
- [ ] Add Audiobook to List
- [ ] Search 
- [ ] Index (Recent audiobooks, Top rated audiobooks)
* Entities
- [x] person  
- [ ] publisher 
- [ ] speaker 
- [ ] lang
- [ ] category 
- [ ] author 
- [ ] audiobook 
- [ ] review
