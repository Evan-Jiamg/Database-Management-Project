create database project_shopping;
use project_shopping;

create table Users (
	User_ID int primary key auto_increment,
    User_Name varchar(20) not null,
    User_Password varchar(12) not null,
    User_Email varchar(30) unique not null,
    User_Created_At datetime default current_timestamp
);

create table Product (
	Product_ID int primary key auto_increment,
    Product_Name varchar(10) not null,
    Product_Price decimal(6, 2) not null,
    Product_Stock decimal(3, 0) not null,
    Product_Description text,
    Image_url varchar(255)
);

create table Orders (
	Order_ID int primary key auto_increment,
    Order_Total decimal(5, 2) not null,
    Order_Created_At datetime default current_timestamp,
    User_ID int,
    Review_ID int,
    foreign key (User_ID) references Users(User_ID),
    foreign key (Review_ID) references Review(Review_ID)
);
	
create table Review (
	Review_ID int primary key auto_increment,
	Review_Rating int check (Review_Rating between 1 and 5),
    Review_Comment text,
    Review_Created_At datetime default current_timestamp
);

create table Items(
	Items_ID int primary key auto_increment,
    Order_ID int,
    Prodcut_ID int,
    Items_Quantity int not null,
    Items_Total int not null,
    Items_Created_At datetime default current_timestamp,
    foreign key (Product_ID) references Product(Product_ID),
    foreign key (Order_ID) references Orders(Order_ID)
);

create table Product_Moods (
	Product_ID int,
    Moods_ID int,
    primary key (Product_ID, Moods_ID),
    foreign key (Product_ID) references Product(Prodcut_ID),
    foreign key (Moods_ID) references Moods(Moods_ID)
);

create table Product_Seasons (
	Product_ID int,
    Seasons_ID int,
    primary key (Product_ID, Seasons_ID),
    foreign key (Product_ID) references Product(Product_ID),
    foreign key (Seasons_ID) references Seasons(Seasons_ID)
);

create table Seasons_Moods (
	Seasons_ID int,
    Moods_ID int,
    primary key (Seasons_ID, Moods_ID),
    foreign key (Seasons_ID) references Seasons(Seasons_ID),
    foreign key (Moods_ID) references Moods(Moods_ID)
);

create table Seasons(
	Seasons_ID int primary key,
    Seasons_Name varchar(5)
);

create table Moods(
	Moods_ID int primary key,
    Moods_Name varchar(5)
);
    