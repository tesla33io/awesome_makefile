# Awesome Makefile :nerd_face:

**Note:**
- The current version is tailored for C projects.
- A C++ version is not in development yet.
## How to use
1. Read about [GNU Make](https://www.gnu.org/software/make/manual/make.html) if you have not yet.
2. Download Makefile to your local directory
   
```bash
wget "https://raw.githubusercontent.com/tesla33io/awesome_makefile/main/Makefile"
   ```

3. Make any needed changes.
4. Specify empty variables.
5. Run `make`.

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

Default: `-Iinclude/`

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
