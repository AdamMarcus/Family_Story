CREATE TABLE IF NOT EXISTS "users" 
(
"id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, 
"username" varchar UNIQUE, 
"created_at" datetime NOT NULL, 
"updated_at" datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS "stories" 
(
"id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, 
"title" varchar, 
"body" varchar, 
"created_at" datetime NOT NULL, 
"updated_at" datetime NOT NULL
);