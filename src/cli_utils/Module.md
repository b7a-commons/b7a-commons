## Module overview

This module allows you to print uni-code aided CLI artifacts in your command prompt.

### Table

`cli_utils:Table` object is used to print uni-code aided tables. 

```ballerina
import ballerina/io;
import b7a_commons/cli_utils;

public function main(string... args) {
    cli_utils:Table table1 = new;
    table1.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    io:println(table1.toString());

    cli_utils:Table table2 = new cli_utils:Table(colWidths = [10, 20, 10]);
    table2.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    io:println(table2.toString());

    cli_utils:Table table3 = new cli_utils:Table(head = ["Index", "Name", "Age"]);
    table3.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    io:println(table3.toString());
}
```