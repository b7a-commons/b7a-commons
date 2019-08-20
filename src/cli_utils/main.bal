import ballerina/io;

public function main(string... args) {
    Table table1 = new Table();
    table1.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    io:println(table1.toString());

    Table table2 = new Table(colWidths = [10, 20, 10]);
    table2.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    io:println(table2.toString());

    Table table3 = new Table(head = ["Index", "Name", "Age"]);
    table3.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    io:println(table3.toString());
}
