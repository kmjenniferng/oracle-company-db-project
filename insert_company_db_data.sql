set define off;
-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', to_date('1967-11-17','YYYY-MM-DD'), 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, to_date('2006-02-09','YYYY-MM-DD'));

UPDATE employee
SET branch_id = 1
WHERE id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', to_date('1961-05-11','YYYY-MM-DD'), 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', to_date('1964-03-15','YYYY-MM-DD'), 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, to_date('1992-04-06','YYYY-MM-DD'));

UPDATE employee
SET branch_id = 2
WHERE id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', to_date('1971-06-25','YYYY-MM-DD'), 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', to_date('1980-02-05','YYYY-MM-DD'), 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', to_date('1958-02-19','YYYY-MM-DD'), 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', to_date('1969-09-05','YYYY-MM-DD'), 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, to_date('1998-02-13','YYYY-MM-DD'));

UPDATE employee
SET branch_id = 3
WHERE id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', to_date('1973-07-22','YYYY-MM-DD'), 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', to_date('1978-10-01','YYYY-MM-DD'), 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);