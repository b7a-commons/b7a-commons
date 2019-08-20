import ballerina/io;
map<string> defaultChars = {"top": "═", "top-mid": "╤", "top-left": "╔", "top-right": "╗", "bottom": "═", "bottom-mid": "╧", "bottom-left": "╚", "bottom-right": "╝", "left": "║", "left-mid": "╟", "mid": "─", "mid-mid": "┼", "right": "║", "right-mid": "╢", "middle": "│"};

# Represets a CLI Table.
#
# + head - head Parameter Description
# + colWidths - colWidths Parameter Description
# + chars - chars Parameter Description
# + rows - rows Parameter Description
# + maxColCount - maxColCount Parameter Description
public type Table object {
    string[] head;
    int[] colWidths;
    map<string> chars;
    string[][] rows = [];
    int maxColCount = 0;
    boolean colWidthsNeeded;
    # Creates a new CLI Table.
    public function __init(string[] head = [], int[] colWidths = [], map<string> chars = defaultChars) {
        self.head = head;
        self.colWidths = colWidths;
        self.chars = chars;
        //TODO: merge chars

        self.colWidthsNeeded = (colWidths.length() == 0);
        self.caclculateColWidths(self.head);
    }

    # Adds rows into CLI Table.
    #
    # + rows - rows set of rows
    public function push(string[]... rows) {
        rows.forEach(function(any | error row) returns () {
            if (row is string[]) {
                self.caclculateColWidths(row);
                // add row
                self.rows.push(row);
            }
        });
    }

    # Prints CLI Table.
    #
    # + return - Printable text.
    public function toString() returns @tainted string {
        string out = "";
        
        int index = 0;
        if (self.head.length() != 0) {
            // Print Head
            out = out.concat(self.printRow(self.head, true, index == (self.rows.length() - 1)));
        }

        foreach var row in self.rows {
            // Print Row
            out = out.concat(self.printRow(row, ((index == 0) && (self.head.length() == 0)), index == (self.rows.length() - 1)));
            index = index + 1;
        }
        return out;
    }

    private function printRow(string[] row, boolean isFirst, boolean isLast) returns @tainted string {
        string out = "";
        int index = 0;
        string[3] lines = ["", "", ""];
        foreach string col in row {
            self.printCol(col, isFirst, isLast, index == 0, index == (row.length() - 1), index, lines);
            index = index + 1;
        }
        foreach string line in lines {
            if (line.length() > 0) {
                out = out.concat(line);
                out = out.concat("\n");
            }
        }
        return out;
    }

    private function printCol(string text, boolean isFirstRow, boolean isLastRow, boolean isFirstCol, boolean isLastCol, int colIndex, string[3] lines) {
        //╔══════╤═════╤══════╗
        //║ foo  │ bar │ baz  ║
        //╟──────┼─────┼──────╢
        //║ frob │ bar │ quuz ║
        //╚══════╧═════╧══════╝

        // Draw Left Side
        if (isFirstRow) {
            if (isFirstCol) {
                lines[0] = lines[0].concat(self.getChar("top-left"));
                lines[1] = lines[1].concat(self.getChar("left"));
                lines[2] = lines[2].concat(self.getChar("left-mid"));
            } else {
                lines[0] = lines[0].concat(self.getChar("top-mid"));
                lines[1] = lines[1].concat(self.getChar("middle"));
                lines[2] = lines[2].concat(self.getChar("mid-mid"));
            }
        } else if (isLastRow) {
            if (isFirstCol) {
                lines[1] = lines[1].concat(self.getChar("left"));
                lines[2] = lines[2].concat(self.getChar("bottom-left"));
            } else {
                lines[1] = lines[1].concat(self.getChar("middle"));
            }
        } else {
            if (isFirstCol) {
                lines[1] = lines[1].concat(self.getChar("left"));
                lines[2] = lines[2].concat(self.getChar("left-mid"));
            } else {
                lines[1] = lines[1].concat(self.getChar("middle"));
                lines[2] = lines[2].concat(self.getChar("mid-mid"));
            }
        }

        // Draw Middle
        foreach int i in 0 ..< self.colWidths[colIndex] {
            if (isFirstRow) {
                lines[0] = lines[0].concat(self.getChar("top"));
            }
            if (isLastRow || (isFirstRow && self.head.length() != 0)) {
                lines[2] = lines[2].concat(self.getChar("bottom"));
            } else {
                lines[2] = lines[2].concat(self.getChar("mid"));
            }
        }

        lines[1] = lines[1].concat(text);
        int len = self.colWidths[colIndex] - text.length();
        foreach int i in 0 ..< len {
            lines[1] = lines[1].concat(" ");
        }

        // Draw Right Side
        if (isFirstRow) {
            if (isLastCol) {
                lines[0] = lines[0].concat(self.getChar("top-right"));
                lines[1] = lines[1].concat(self.getChar("right"));
                lines[2] = lines[2].concat(self.getChar("right-mid"));
            }
        } else if (isLastRow) {
            if (isLastCol) {
                lines[1] = lines[1].concat(self.getChar("right"));
                lines[2] = lines[2].concat(self.getChar("bottom-right"));
            } else {
                lines[2] = lines[2].concat(self.getChar("bottom-mid"));
            }
        } else {
            if (isLastCol) {
                lines[1] = lines[1].concat(self.getChar("right"));
                lines[2] = lines[2].concat(self.getChar("right-mid"));
            }
        }
    }

    private function caclculateColWidths(string[] row) {
        // calculate max columns count
        int len = row.length();
        self.maxColCount = (len > self.maxColCount) ? len : self.maxColCount;
        // calculate col widths
        if (self.colWidthsNeeded) {
            int counter = 0;
            foreach var col in row {
                if (self.colWidths.length() - 1 < counter) {
                    int newWidth = (col.length() > 3) ? col.length() : 3;
                    self.colWidths.push(newWidth);
                } else {
                    int oldWidth = self.colWidths[counter];
                    self.colWidths[counter] = (col.length() > oldWidth) ? col.length() : oldWidth;
                }
                counter = counter + 1;
            }
        }
    }

    private function getChar(string name) returns string {
        var str = self.chars[name];
        return (str is string) ? str : "?";
    }
};
