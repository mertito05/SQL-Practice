CREATE TABLE brand (
    brand_id VARCHAR2(30 CHAR) NOT NULL,
    brand    VARCHAR2(30 CHAR)
);

ALTER TABLE brand ADD CONSTRAINT brand_pkv2 PRIMARY KEY ( brand_id );

CREATE TABLE color (
    color_id VARCHAR2(30 CHAR) NOT NULL,
    color    VARCHAR2(30 CHAR)
);

ALTER TABLE color ADD CONSTRAINT color_pk PRIMARY KEY ( color_id );

CREATE TABLE customer (
    customer_id      VARCHAR2(30 CHAR) NOT NULL,
    customer_name    VARCHAR2(30 CHAR),
    customer_address VARCHAR2(30 CHAR),
    customer_phone   INTEGER
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customer_id );

CREATE TABLE model (
    model_id VARCHAR2(30 CHAR) NOT NULL,
    model    VARCHAR2(30 CHAR)
);

ALTER TABLE model ADD CONSTRAINT model_pk PRIMARY KEY ( model_id );

CREATE TABLE sales (
    customer_id   VARCHAR2(30 CHAR) NOT NULL,
    vehicle_id    VARCHAR2(30 CHAR) NOT NULL,
    staff_sale_id VARCHAR2(30 CHAR) NOT NULL,
    sale_date     DATE
);

CREATE TABLE staff (
    staff_id       VARCHAR2(30 CHAR) NOT NULL,
    staff_name     VARCHAR2(30 CHAR),
    staff_position VARCHAR2(30 CHAR),
    staff_phone    INTEGER
);

CREATE TABLE staff_id (
    staff_id VARCHAR2(30 CHAR) NOT NULL,
    staff    VARCHAR2(30 CHAR)
);

ALTER TABLE staff_id ADD CONSTRAINT staff_id_pk PRIMARY KEY ( staff_id );

CREATE TABLE staff_sale (
    staff_sale_id VARCHAR2(30 CHAR) NOT NULL,
    staff_sale    VARCHAR2(30 CHAR)
);

ALTER TABLE staff_sale ADD CONSTRAINT staff_sale_pk PRIMARY KEY ( staff_sale_id );

CREATE TABLE vehicle (
    brand_id   VARCHAR2(30 CHAR) NOT NULL,
    model_id   VARCHAR2(30 CHAR) NOT NULL,
    color_id   VARCHAR2(30 CHAR) NOT NULL,
    vehicle_id VARCHAR2(30 CHAR) NOT NULL,
    yearr       INTEGER,
    miliage    INTEGER,
    price      INTEGER
);

ALTER TABLE vehicle ADD CONSTRAINT vehicle_pkv1 PRIMARY KEY ( vehicle_id );

ALTER TABLE sales
    ADD CONSTRAINT sales_customer_fk FOREIGN KEY ( customer_id )
        REFERENCES customer ( customer_id );

ALTER TABLE sales
    ADD CONSTRAINT sales_staff_sale_fk FOREIGN KEY ( staff_sale_id )
        REFERENCES staff_sale ( staff_sale_id );

ALTER TABLE sales
    ADD CONSTRAINT sales_vehicle_fk FOREIGN KEY ( vehicle_id )
        REFERENCES vehicle ( vehicle_id );

ALTER TABLE staff
    ADD CONSTRAINT staff_staff_id_fk FOREIGN KEY ( staff_id )
        REFERENCES staff_id ( staff_id );

ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_brand_fk FOREIGN KEY ( brand_id )
        REFERENCES brand ( brand_id );

ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_color_fk FOREIGN KEY ( color_id )
        REFERENCES color ( color_id );

ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_model_fk FOREIGN KEY ( model_id )
        REFERENCES model ( model_id );

insert into brand
values ('01','BMW');

insert into color
values ('01','Black');

insert into customer
values ('01','Mike','Varna','052200233');

insert into model
values ('01','X5');

insert into model
values ('02','M3');

insert into sales(sale_date)
values ('02-02-22');

insert into staff(staff_name,staff_position,staff_phone)
values ('John','Newbie','094223456');

insert into staff_id
values ('01','John');

insert into staff_sale
values ('01','John');

insert into vehicle(vehicle_id,yearr,miliage,price)
values ('01','18','22000','60000');

update model
set model='M5'
where model_id='02';

--listing columns by table
select brand_id as Brand,model_id as Model,color_id as Color,yearr as Year_Of_Making,miliage as Miliage,price as Price
from vehicle;

--sorted by ascending rate
select staff_sale_id
from sales
order by sale_date asc;

--sorted by descending rate
select staff_sale_id
from sales
order by sale_date desc;

--
--select top 5 vehicle_id from vehicle order by price desc ;

--output all sales for customer
select customer_id and vehicle_id
from customer
inner join sales
on customer.customer_id=sales.vehicle_id;
--sales for date
select customer_id,vehicle_id,staff_sale_id
from sales
where sale_date like '02-02-22';

