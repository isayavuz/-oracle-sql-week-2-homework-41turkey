create table hard_disk_ayrinti(
hard_disk_id number PRIMARY KEY,
marka_name varchar2(255),
model_serisi varchar2(255),
disk_kapasitesi number,
hdd_donus_hizi number
);

create table ram_ayrinti(
ram_id number PRIMARY KEY,
marka_name varchar2(255),
ram_tipi varchar2(10),
hafýza_bus_hýzý number,
gecikme_suresi varchar2(10)
);

create table pc_urun(
urun_id number PRIMARY KEY,
marka_name varchar2(255),
model_name varchar2(255),
hard_disk number,
    CONSTRAINT fk_hard_disk_id FOREIGN KEY (hard_disk)
    REFERENCES hard_disk_ayrinti(hard_disk_id),
ram number,
    CONSTRAINT fk_ram_id FOREIGN KEY (ram)
    REFERENCES ram_ayrinti(ram_id)
);

INSERT INTO hard_disk_ayrinti (hard_disk_id, marka_name, model_serisi, disk_kapasitesi, hdd_donus_hizi) VALUES (1, 'toshiba', 'p300', 6, 5400);
INSERT INTO hard_disk_ayrinti (hard_disk_id, marka_name, model_serisi, disk_kapasitesi, hdd_donus_hizi) VALUES (2, 'wd black', 'pc hard drive', 1, 7200);
INSERT INTO hard_disk_ayrinti (hard_disk_id, marka_name, model_serisi, disk_kapasitesi, hdd_donus_hizi) VALUES (3, 'seagate', 'skyhawk', 8, 7200);

INSERT INTO ram_ayrinti (ram_id, marka_name, ram_tipi, hafýza_bus_hýzý, gecikme_suresi) VALUES (1, 'corsair', 'DDR4', 3600, 'CL18');
INSERT INTO ram_ayrinti (ram_id, marka_name, ram_tipi, hafýza_bus_hýzý, gecikme_suresi) VALUES (2, 'gskýll', 'DDR4', 3200, 'CL16');
INSERT INTO ram_ayrinti (ram_id, marka_name, ram_tipi, hafýza_bus_hýzý, gecikme_suresi) VALUES (3, 'kingston', 'DDR4', 3600, 'CL17');

INSERT INTO pc_urun (urun_id, marka_name, model_name, hard_disk, ram) VALUES (1, 'lenovo', 'iddeapad320', 1, 3);
INSERT INTO pc_urun (urun_id, marka_name, model_name, hard_disk, ram) VALUES (2, 'casper', 'cs17', 2, 2);
INSERT INTO pc_urun (urun_id, marka_name, model_name, hard_disk, ram) VALUES (3, 'casper', 'cs20', 3, 1);

CREATE VIEW SORGU
AS
    SELECT pc_urun.marka_name, pc_urun.model_name, hard_disk_ayrinti.disk_kapasitesi, ram_ayrinti.hafýza_bus_hýzý FROM (pc_urun INNER JOIN hard_disk_ayrinti ON pc_urun.hard_disk = hard_disk_ayrinti.hard_dýsk_ýd) INNER JOIN ram_ayrinti ON pc_urun.ram=ram_ayrinti.ram_id;
    
CREATE SYNONYM ornek for pc_urun;

select *from sorgu;

select *from product where quota='LIMITLESS';

select *from customer where status='INITIAL';

select *from address where city='Istanbul';

select *from account where payment_type='CASH';

select *from customer where status='DEACTIVE';

select *from account where account_closing_date IS not null;

select *from account where e_bill_email IS NOT NULL;

select *from contact where update_date>'01/01/2000' and update_date<'01/01/2005';

select *from subscrýptýon where create_date<'01/01/2005' and deactivation_date IS NULL;

select *from contact WHERE CREATE_DATE>'01/01/2010';

select *from customer WHERE NAME LIKE 'E%';

SELECT *FROM PRODUCT WHERE PRODUCT_TYPE LIKE '%DSL';

select *from customer WHERE NAME LIKE '%ü%' OR SURNAME LIKE '%ü%';

select*from address where country_cd LIKE 'UK' OR country_cd LIKE 'AU';

select count(status) from customer where status lýke 'DEACTIVE';

select COUNT(*) from customer where c_type lýke 'EMAIL' AND STATUS LIKE 'ACTIVE';



SELECT *FROM employees where hire_date>'01/05/2016';

select *from contacts where first_name lýke 'Charlie' OR first_name lýke 'Charlsie';

SELECT *FROM inventories where quantýty>10 and quantýty<50;

select *from employees where manager_id IS NULL;

SELECT *FROM LOCATIONS WHERE STATE IS NULL;

SELECT *FROM ORDERS WHERE STATUS LIKE 'Canceled' AND SALESMAN_ID IS NULL;

SELECT *FROM ORDERS WHERE ORDER_DATE>'01/01/2016' AND ORDER_DATE<'01/06/2016';

select *from employees WHERE job_týtle NOT LIKE 'S%';

SELECT *FROM PRODUCTS where product_name like '%Intel Xeon%';

select *from contacts where fýrst_name like 'C%' ORDER BY LAST_NAME;

SELECT *FROM products WHERE PRODUCT_NAME LIKE 'Asus%' and list_price<standard_cost;

select *from product_categories where category_id=1 or category_ýd=2 or category_ýd=4 or category_ýd=5;

select *from orders where status like 'Shipped';

SELECT *FROM inventories where quantity=100;

SELECT count(*) FROM products where list_price>1000 and list_price<3000;


select type, sum(amount) from transactions group by type order by sum(amount) DESC;

select type, sum(balance) from transactions group by type order by sum(balance) DESC;

select year, sum(amount) from transactions group by year;

