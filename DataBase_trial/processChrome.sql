drop database processes;
create database processes;
use processes;
create table chromeProcessList(
	my_ID int auto_increment primary key,
    callType text not null,
    fileFormat text,
    previousFile varchar(500),
    currentFile varchar(500) not null,
    count int not null
);