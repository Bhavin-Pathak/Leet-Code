
function convert(s, numRows) {
    // Edge case: If only 1 row OR rows >= string length, zigzag is not needed
    if (numRows === 1 || numRows >= s.length) return s;

    // Create an array of strings to hold characters for each row
    let rows = new Array(numRows).fill("");

    // Track current row and direction (down or up)
    let currentRow = 0;
    let goingDown = false;

    // Traverse each character in string
    for (let char of s) {
        // Place character in the current row
        rows[currentRow] += char;

        // Change direction at the top (row 0) or bottom (last row)
        if (currentRow === 0 || currentRow === numRows - 1) goingDown = !goingDown;

        // Move row index (down = +1, up = -1)
        currentRow += goingDown ? 1 : -1;
    }

    // Join all rows together to form final result
    return rows.join("");
}

// Example usage:
console.log(convert("PAYPALISHIRING", 3)); // "PAHNAPLSIIGYIR"
console.log(convert("PAYPALISHIRING", 4)); // "PINALSIGYAHRPI"
console.log(convert("A", 1));              // "A"
