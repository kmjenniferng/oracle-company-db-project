CREATE TABLE employee (
  id NUMBER,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_date DATE,
  sex VARCHAR(1),
  salary NUMBER,
  supervisor_id NUMBER,
  branch_id NUMBER,
  CONSTRAINT employee_id_pk PRIMARY KEY (id)
);

CREATE TABLE branch (
  id NUMBER,
  name VARCHAR(40),
  manager_id NUMBER,
  manager_start_date DATE,
  CONSTRAINT bra_id_pk PRIMARY KEY (id),
  CONSTRAINT bra_manager_id_fk FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

ALTER TABLE employee ADD (
CONSTRAINT emp_bra_id_fk FOREIGN KEY (branch_id) REFERENCES branch(id) ON DELETE SET NULL);

ALTER TABLE employee ADD (
CONSTRAINT emp_super_id_fk FOREIGN KEY (supervisor_id) REFERENCES employee(id) ON DELETE SET NULL);

CREATE TABLE client (
  id NUMBER,
  name VARCHAR(40),
  branch_id NUMBER,
  CONSTRAINT cli_id PRIMARY KEY (id),
  CONSTRAINT cli_bra_id_fk FOREIGN KEY (branch_id) REFERENCES branch(id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  employee_id NUMBER,
  client_id NUMBER,
  total_sales NUMBER,
  CONSTRAINT ww_emp_id_cli_id_pk PRIMARY KEY (employee_id, client_id),
  CONSTRAINT ww_emp_id_fk FOREIGN KEY (employee_id) REFERENCES employee(id) ON DELETE CASCADE,
  CONSTRAINT ww_cli_id_fk FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id NUMBER,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  CONSTRAINT bs_bra_id_sup_name_pk PRIMARY KEY(branch_id, supplier_name),
  CONSTRAINT bs_bra_id_fk FOREIGN KEY (branch_id) REFERENCES branch(id) ON DELETE CASCADE
);