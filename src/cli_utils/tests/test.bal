import ballerina/test;

@test:Config {}
public function testTablesWithColWidths() {
    Table table1 = new Table(colWidths = [10, 20, 10]);
    table1.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    string result = table1.toString();
    string expected = "" +
    "╔══════════╤════════════════════╤══════════╗\n" +
    "║1         │Greg                │29        ║\n" +
    "╟──────────┼────────────────────┼──────────╢\n" +
    "║2         │Kevin               │41        ║\n" +
    "╟──────────┼────────────────────┼──────────╢\n" +
    "║3         │Ann                 │35        ║\n" +
    "╚══════════╧════════════════════╧══════════╝\n";
    test:assertEquals(result, expected);
}

@test:Config {}
public function testTables2() {
    Table table2 = new Table();
    table2.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    string result = table2.toString();
    string expected = "" +
    "╔═══╤═════╤═══╗\n" +
    "║1  │Greg │29 ║\n" +
    "╟───┼─────┼───╢\n" +
    "║2  │Kevin│41 ║\n" +
    "╟───┼─────┼───╢\n" +
    "║3  │Ann  │35 ║\n" +
    "╚═══╧═════╧═══╝\n";
    test:assertEquals(result, expected);
}


@test:Config {}
public function testTablesWithHead() {
    Table table3 = new Table(head = ["Index", "Name", "Age"]);
    table3.push(["1", "Greg", "29"], ["2", "Kevin", "41"], ["3", "Ann", "35"]);
    string result = table3.toString();
    string expected = "" +
    "╔═════╤═════╤═══╗\n" +
    "║Index│Name │Age║\n" +
    "╟═════┼═════┼═══╢\n" +
    "║1    │Greg │29 ║\n" +
    "╟─────┼─────┼───╢\n" +
    "║2    │Kevin│41 ║\n" +
    "╟─────┼─────┼───╢\n" +
    "║3    │Ann  │35 ║\n" +
    "╚═════╧═════╧═══╝\n";
    test:assertEquals(result, expected);
}
