

CREATE TABLE IF NOT EXISTS accounts(
    name TEXT,
    type TEXT,
    currency TEXT,
    balance FLOAT,
    startingBalance FLOAT,
    notes TEXT,
    url TEXT,
    createdDate INT,
    dueDate INT,
    statementDate INT,
    budget FLOAT,
    creditLimit FLOAT,
    isSmartAccount BOOLEAN,
    accountID TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS budget(
    name TEXT,
    type TEXT,
    accountID TEXT,
    currency TEXT,
    amount FLOAT,
    notes TEXT,
    section TEXT,
    dueDate INTEGER,
    createdDate INTEGER,
    withProjection BOOLEAN,
    withdraw BOOLEAN,
    budgetID TEXT PRIMARY KEY

);

CREATE TABLE IF NOT EXISTS transactions(

    transactionDate INTEGER,
    name TEXT,
    category TEXT,
    currency TEXT,
    amount FLOAT,
    notes TEXT,
    isProjected BOOLEAN,
    isBudgeted BOOLEAN,
    accountID TEXT,
    section TEXT,
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    FOREIGN KEY(accountID) REFERENCES accounts(accountID)
);

CREATE TABLE IF NOT EXISTS toDo(
    createdDate INTEGER,
    name TEXT,
    message TEXT,
    isDone BOOLEAN,
    id INTEGER PRIMARY KEY AUTOINCREMENT

);

INSERT INTO "accounts" ("name","type","currency","balance","startingBalance","notes","url","createdDate","dueDate","statementDate","budget","creditLimit","isSmartAccount","accountID") VALUES ('Savings Bank','Savings','Php',5100.0,100.0,'Suggest to put in here your account ID','',1602326688239,0,0,0.0,0.0,0,'1602326688239'),
 ('Cash on hand','Cash','Php',21.5,50.0,'Text here is coming from the Notes field','',1602326766321,0,0,0.0,0.0,0,'1602326766321'),
 ('VISA Credit Card','Credit Card','USD',-1869.0,0.0,'4240 9000 3214 1234','',1602326893444,1604592000000,1602777600000,100.0,0.0,0,'1602326893444');
INSERT INTO "budget" ("name","type","accountID","currency","amount","notes","section","dueDate","createdDate","withProjection","withdraw","budgetID") VALUES ('Regular Company Salary','Income','','Php',5000.0,'','Income',1601481600000,1602326947882,0,0,'1602326947882'),
 ('Rent','Rent','','Php',1200.0,'','Section 1',1602691200000,1602326994208,0,0,'1602326994208'),
 ('Gas','Transportation','','Php',300.0,'','Section 2',1602432000000,1602327033447,0,1,'1602327033447'),
 ('Credit Card','Credit Card','','Php',1500.0,'','Section 1',1602327067536,1602327067536,0,1,'1602327067536'),
 ('Groceries','Groceries','','Php',900.0,'','Section 2',1601481600000,1602327136215,0,0,'1602327136215'),
 ('Car loan','Loans','','Php',1100.0,'','Section 2',1602327457485,1602327457485,0,0,'1602327457485');
INSERT INTO "transactions" ("transactionDate","name","category","currency","amount","notes","isProjected","isBudgeted","accountID","section","id") VALUES (1602326688239,'Beginning balance','Initial','Php',100.0,'Beginning balance',0,NULL,'1602326688239',NULL,1),
 (1602326766321,'Beginning balance','Initial','Php',50.0,'Beginning balance',0,NULL,'1602326766321',NULL,2),
 (1602327333478,'Salary','Income','Php',5000.0,'',0,1,'1602326688239','',1602327349182),
 (1602327380349,'Rent','Rent','Php',-1200.0,'',1,0,'1602326688239','',1602327401837),
 (1602327561501,'Credit card','Payment','Php',-1500.0,'',1,1,'1602326688239','',1602327592478),
 (1602327594647,'Groceries','Food','Php',-900.0,'',1,1,'1602326688239','',1602327622762),
 (1602327644566,'Car loan','Loans','Php',-1100.0,'',1,1,'1602326688239','',1602327655638),
 (1602327717342,'Gas','Transportation','Php',-300.0,'',1,1,'1602326688239','',1602327731730),
 (1602327795976,'McDonalds','Food','Php',-8.5,'',0,1,'1602326766321','',1602327808681),
 (1602068580000,'Apple Mac 2020','Devices','Php',-999.0,'',0,1,'1602326893444','Oct2020',1602327837692),
 (1602068640000,'Gas','Transportation','Php',-20.0,'',0,1,'1602326893444','Oct2020',1602327881071),
 (1601377440000,'Netflix Subscription','Leisure','Php',-40.0,'',0,1,'1602326893444','Oct2020',1602327916048),
 (1601982300000,'Macy’s','Shopping','Php',-750.0,'',0,1,'1602326893444','Oct2020',1602327972262),
 (1602328043591,'Gas','Transportation','Php',-60.0,'',0,1,'1602326893444','',1602328058341),
 (1602329979492,'Movie Night ','Entertainment','Php',-20.0,'',0,1,'1602326766321','',1602329996682);
INSERT INTO "toDo" ("createdDate","name","message","isDone","id") VALUES (1602407740084,'Long press to delete this note','-',0,1602407740084),
 (1602407749927,'Buy dog food','-',0,1602407749927);