# Ballerina CLI Tools

## CLI Table
### Usages:

#### 1. Simple
```ballerina
import ballerina/io;
import b7a_commons/cli_utils;

cli_utils:Table table1 = new;
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
import b7a_commons/cli_utils;

cli_utils:Table table2 = new cli_utils:Table(colWidths = [10,20,10]);
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
import b7a_commons/cli_utils;

cli_utils:Table table3 = new cli_utils:Table(head = ["Index", "Name", "Age"]);
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
