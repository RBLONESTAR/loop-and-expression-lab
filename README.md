# Assembly Language Lab: Integer Division + Console Text Colors

**32-bit MASM · Irvine32 · Two independent programs**

## Overview

In this lab, you will perform integer division and use a loop to display colored console text. You will practice arithmetic, register management, memory addressing, and procedures from the Irvine32 library.

| Part | Task | Weight |
| --- | --- | :---: |
| 1 | Divide two integers and display the operands, quotient, and remainder. | 50% |
| 2 | Repair a disorganized program that displays one message in four different colors using a loop. | 50% |

**Due date:** See D2L. Submit your completed source files and output screenshots in D2L.

## Files in this repository

| File | Purpose |
| --- | --- |
| `README.md` | Lab instructions and submission checklist. |
| `Part1_Division.asm` | Incomplete starter for the integer division program. |
| `Part2_ColorLoop.asm` | Intentionally disorganized program for you to repair. |
| `.gitignore` | Excludes common Visual Studio settings and generated build files from Git. |

## Before you begin

1. Download this repository using **Code → Download ZIP**, then extract it, or clone it if you already use Git.
2. Use the course's configured **32-bit MASM / Irvine32 environment**. In Visual Studio, select **x86/Win32** rather than x64.
3. Create **two separate projects**, one for each program, using the course's Irvine32 project template or setup instructions.
4. Add only `Part1_Division.asm` to the first project and only `Part2_ColorLoop.asm` to the second. Replace any existing template source file containing `main` so each project has only one entry point.
5. Complete the name, course/section, and date comments in each file.

> **Build each part separately.** Both files define `main`; they are independent programs and should not be linked into the same executable. This repository supplies source files, not a preconfigured Visual Studio solution or the Irvine32 library. Part 2 is expected to have errors until you repair it.

## Part 1: Integer Division Program — 50%

Write a program that divides two integers and displays the result.

### Requirements

Your program must:

1. Define a dividend and a **nonzero** divisor in memory.
2. Perform integer division using the appropriate assembly division instruction.
3. Display labeled values for the dividend, divisor, quotient, and remainder.
4. Use values that produce a **nonzero remainder** to demonstrate integer division.
5. Include comments explaining register preparation, the division operation, and how you preserve the results for output.
6. Exit cleanly.

Positive `DWORD` values provide a straightforward starting point for unsigned division. Keyboard input is not required; you may define the values in the data section.

### Example output

The exact spacing is flexible. You may choose your own valid values.

```text
Dividend: 25
Divisor:  4
Quotient: 6
Remainder: 1
```

### Register reminders

- For 32-bit unsigned `DIV`, the dividend is the register pair `EDX:EAX`. When dividing a value that fits entirely in `EAX`, clear `EDX` before the division.
- After that division, the quotient is in `EAX` and the remainder is in `EDX`.
- Save the results before reusing those registers to print labels or numbers. In particular, loading a string address into `EDX` would overwrite a remainder still stored there.
- Use `WriteDec` for unsigned decimal output. If you choose signed division instead, use `IDIV`, prepare the signed dividend correctly (typically with `CDQ` for a signed value in `EAX`), and use `WriteInt` for signed output.
- Never divide by zero. Runtime input validation is not required for this lab's fixed data values.

### Check your work

For positive values, verify both relationships:

```text
dividend = (divisor × quotient) + remainder
0 ≤ remainder < divisor
```

## Part 2: Colorized Output Using a Loop — 50%

Open `Part2_ColorLoop.asm`. It contains the disorganized program supplied for this lab. Reorganize and repair it so the same message appears exactly four times, each time in a different color.

You may add, remove, or move lines as needed. Keep the task focused on repairing the program and using a loop.

### Requirements

Your corrected program must:

1. Display `This line is displayed in color` **exactly four times**.
2. Use a loop to repeat the output, rather than four manually repeated print sequences.
3. Call `SetTextColor` inside the loop to select a different color on each iteration.
4. Call `WriteString` to print the message.
5. Call `Crlf` after each message so every message appears on its own line.
6. Use correct data/code sections, procedure boundaries, and program termination.
7. Include comments explaining the loop counter, message address, and color changes.

### Color selection

Choose any four distinct, readable foreground colors. Keeping the background constant makes the program easier to manage.

`SetTextColor` takes the color attribute in `EAX`:

```text
color attribute = foreground + (background × 16)
```

Keep foreground and background values within the valid range of 0–15. Select foreground colors that contrast with the background. As an optional finishing touch, restore a standard console color after the loop.

### Repair checklist

- [ ] Data declarations appear in the correct section.
- [ ] Executable instructions appear inside the code section and procedure.
- [ ] The loop counter is initialized before the loop.
- [ ] Each iteration selects a color, prints the message, and starts a new line.
- [ ] The color changes between printed lines.
- [ ] The loop repeats exactly four times.
- [ ] The program exits after the loop finishes.
- [ ] The procedure and program end directives are in the correct order.

> **Formatting tip:** You may set your editor's tab size to 5 for alignment. This is optional and does not change program behavior.

## Irvine32 quick reference

| Procedure | Purpose | Input you prepare |
| --- | --- | --- |
| `WriteString` | Print a null-terminated string. | `EDX` contains the string's address. |
| `WriteDec` | Print an unsigned decimal integer. | `EAX` contains the value. |
| `WriteInt` | Print a signed decimal integer. | `EAX` contains the value. |
| `SetTextColor` | Set the color for subsequent console text. | `EAX` contains the color attribute. |
| `Crlf` | Start a new console line. | No input argument. |

References: [WriteString](https://csc.csudh.edu/mmccullough/asm/help/source/irvinelib/writestring.htm), [WriteDec](https://csc.csudh.edu/mmccullough/asm/help/source/irvinelib/writedec.htm), and [SetTextColor](https://csc.csudh.edu/mmccullough/asm/help/source/irvinelib/settextcolor.htm).

## Submission requirements

Upload the following to **D2L**:

1. **`Part1_Division.asm`** — your completed division program.
2. **`Part2_ColorLoop.asm`** — your repaired color-loop program.
3. **Output screenshot(s)** — evidence clearly showing the console output for both programs. Separate screenshots named `Part1_Output.png` and `Part2_Output.png` are recommended; JPG screenshots are also acceptable.

Your Part 1 evidence must show the dividend, divisor, quotient, and remainder. Your Part 2 evidence must show all four lines in four distinct colors.

> **Submit actual console output.** A screenshot of an `.exe` file in a folder, or a screenshot of source code alone, does not demonstrate program output. Include both `.asm` source files even when your screenshots show correct results.

## Before you submit

- [ ] Both programs build and run independently in the course environment.
- [ ] Part 1 uses a division instruction and demonstrates a nonzero remainder.
- [ ] Part 1 displays all four labeled values correctly.
- [ ] Part 2 uses a loop and all three required procedures: `SetTextColor`, `WriteString`, and `Crlf`.
- [ ] Part 2 prints exactly four message lines in different, readable colors.
- [ ] Both source files contain identifying information and explanatory comments.
- [ ] Screenshots clearly demonstrate the output for both parts.
- [ ] Both source files and the screenshots are attached to the D2L submission.
