# Ballerina CLI Tools

## CLI Table
### Usages:

#### 1. Simple
```ballerina
import ballerina/io;
import ballerina-dev/table;

Table table1 = new Table();
table1.push(["1", "Greg", "29"],["2", "Kevin", "41"],["3", "Ann", "35"]);
io:println(table1.toString());
```

```ballerina
# ╔═══╤═════╤═══╗
# ║1  │Greg │29 ║
# ╟───┼─────┼───╢
# ║2  │Kevin│41 ║
# ╟───┼─────┼───╢
# ║3  │Ann  │35 ║
# ╚═══╧═════╧═══╝
```

#### 2. Custom Column Widths
```ballerina
import ballerina/io;
import ballerina-dev/table;

Table table2 = new Table(colWidths = [10,20,10]);
table2.push(["1", "Greg", "29"],["2", "Kevin", "41"],["3", "Ann", "35"]);
io:println(table2.toString());
```

```ballerina
# ╔══════════╤════════════════════╤══════════╗
# ║1         │Greg                │29        ║
# ╟──────────┼────────────────────┼──────────╢
# ║2         │Kevin               │41        ║
# ╟──────────┼────────────────────┼──────────╢
# ║3         │Ann                 │35        ║
# ╚══════════╧════════════════════╧══════════╝
```

#### 3. With Headers
```ballerina
import ballerina/io;
import ballerina-dev/table;

Table table3 = new Table(head = ["Index", "Name", "Age"]);
table3.push(["1", "Greg", "29"],["2", "Kevin", "41"],["3", "Ann", "35"]);
io:println(table3.toString());
```

```ballerina
# ╔═════╤═════╤═══╗
# ║Index│Name │Age║
# ╟═════┼═════┼═══╢
# ║1    │Greg │29 ║
# ╟─────┼─────┼───╢
# ║2    │Kevin│41 ║
# ╟─────┼─────┼───╢
# ║3    │Ann  │35 ║
# ╚═════╧═════╧═══╝
```
