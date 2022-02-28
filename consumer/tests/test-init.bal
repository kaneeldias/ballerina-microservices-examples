import ballerina/test;
import ballerinax/mysql;

@test:BeforeSuite
function databaseInit() returns error? {
    mysql:Client dbClient = check new(host = HOST, port = PORT, user = USER, password = PASSWORD, database = DATABASE);

    _ = check dbClient->execute(`DROP DATABASE IF EXISTS ConsumerTest;`);
    _ = check dbClient->execute(`CREATE DATABASE IF NOT EXISTS ConsumerTest;`);
    _ = check dbClient->execute(`
        CREATE TABLE IF NOT EXISTS ConsumerTest.Consumers (
            id      INTEGER         AUTO_INCREMENT PRIMARY KEY,
            name    VARCHAR(255)    NOT NULL,
            address VARCHAR(255)    NOT NULL,
            email   VARCHAR(255)    NOT NULL
        );
    `);
}
