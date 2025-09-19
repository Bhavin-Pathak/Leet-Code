String convert(String s, int numRows) {
  // Edge case: If only 1 row OR rows >= string length, zigzag is not needed
  if (numRows == 1 || numRows >= s.length) return s;

  // Use StringBuffer for efficient string building (instead of +=)
  List<StringBuffer> rows = List.generate(numRows, (_) => StringBuffer());

  // Track current row and direction (down or up)
  int currentRow = 0;
  bool goingDown = false;

  // Traverse each character in string
  for (var char in s.split('')) {
    // Place character in the current row
    rows[currentRow].write(char);

    // Change direction at the top (row 0) or bottom (last row)
    if (currentRow == 0 || currentRow == numRows - 1) goingDown = !goingDown;

    // Move row index (down = +1, up = -1)
    currentRow += goingDown ? 1 : -1;
  }

  // Join all rows together to form final result
  return rows.map((sb) => sb.toString()).join('');
}

void main() {
  print(convert("PAYPALISHIRING", 3)); // "PAHNAPLSIIGYIR"
  print(convert("PAYPALISHIRING", 4)); // "PINALSIGYAHRPI"
  print(convert("A", 1)); // "A"
}
