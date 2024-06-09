# Awesome Makefile :nerd_face:

**Note:**
- The current version is tailored for C projects.
- A C++ version is not in development yet.

## How to use

Just follow these straightforward steps:

1. **Learn about GNU Make 📚**: If you're not familiar with the ins and outs of [GNU Make](https://www.gnu.org/software/make/manual/make.html), take a moment to acquaint yourself with its wonders. A quick skim through the documentation should do the trick.

2. **Fetch the Makefile 💾**: Secure your very own copy of Makefile by downloading it to your local directory. Simply use the following `wget` command:
    ```bash
    wget "https://raw.githubusercontent.com/tesla33io/awesome_makefile/main/Makefile"
    ```

3. **Customize as needed ✒️**: Open the Makefile in your preferred text editor and make any necessary adjustments. Be sure to fill in any empty variables to tailor it to your specific needs.

4. **Initiate the Magic 🧙‍♂️**: Now it's time to put Makefile to work! Execute the following command in your terminal:
    ```bash
    make
    ```
    Watch as your code transforms like magic ✨, thanks to the power of make.

## Docs
---
##### `CC` - Compiler to be used

Default: `clang`

---
##### `CFLAGS` - Flags passed to the compiler

Default:
```bash
-Wall: Enable all compiler warnings
-Werror: Treat all warnings as errors
-Wextra: Enable extra compiler warnings
-pedantic: Issue all the warnings demanded by strict ISO C and ISO C++
-O3: Optimize code for speed
```

If `DEBUG` environmental variable exists with value `1` next flags added to `CFLAGS`:
```bash
-g3: Enables maximum debug information generation for advanced debugging capabilities
-O0: Disables all optimization, maintaining a one-to-one correspondence between source code and machine instructions for easier debugging
```
---
##### `LIBS` - Libraries to be linked (if any)
---
##### `INCLUDES` - Include directories

Default: `-Iinc/`

---
##### `TARGET` - Name of the target executable
---
##### `SRC_DIR` - Directory containing the source files

Default: `src/`

---
##### `SRC_FILES` - List of source files 

Default: `SRC_FILES += main.c`

> [!NOTE]
> Use += to append additional source files

---
##### `OBJ_DIR` - Directory to store object files

Default: `obj/`

---
##### `OBJ_FILES` - List of object files

> [!NOTE]
> List of object files generated from list of source files by replacing `.c` with `.o`

---
##### `DEP_DIR` - Directory to store dependency files

Default: `dep/`

---
##### `DEPENDS` - List of dependencies files

> [!NOTE]
> List of dependencies generated from list of objects in similar way.

---
##### `-include $(DEPENDS)` - [good explanation](https://stackoverflow.com/a/66119295/12994152)
---
##### `.DEFAULT_GOAL` - Default target to be executed when no specific target is provided

Default: `all`

---
