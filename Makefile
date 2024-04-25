#### MAIN SETTINGS ####

# Compiler to be used
CC				:= clang

# Compiler flags
CFLAGS			:= -Wall -Werror -Wextra -pedantic -O3

# Libraries to be linked (if any)
LIBS			:=

# Include directories
INCLUDES		:= -Iinclude/

# Target executable
TARGET			:=

# Source files directory
SRC_DIR			:= src/

# Source files
SRC_FILES		+= main.c		# Main

# Object files directory
OBJ_DIR			:= obj/

# Object files
OBJ_FILES		:= $(patsubst %.c, $(OBJ_DIR)%.o, $(SRC_FILES))

# Dependency files directory
DEP_DIR			:= dep/

# Dependency files
DEPENDS			:= $(patsubst %.o, $(DEP_DIR)%.d, $(OBJ_FILES))
-include $(DEPENDS)

#### SHELL COMMANDS ####

RM				:= /bin/rm -f
MKDIR			:= /bin/mkdir -p
TOUCH			:= /bin/touch

## $(1) - Color of the message type
## $(2) - Message type
## $(3) - Main message text (in bold)
## $(4) - Additional info
## $(5) - Color of the message text
define	PRINT
	@echo "$(strip $(1))[$(TARGET) -" \
	"$(shell printf '%6s' $(strip $(2)))]:$(strip $(5))" \
	"$(BOLD)$(strip $(3))$(RESET) $(strip $(5))$(strip $(4))$(RESET)"	
endef

#### LOCAL LIBRARIES ####

## FT_PRINTF_PATH	:= ft_printf/
## FT_PRINTF_LIB	:= $(FT_PRINTF_PATH)libftprintf.a

## LIBFT_PATH		:= lib/libft/
## LIBFT_LIB		:= $(LIBFT_PATH)libft.a

#### DEBUG SETTINGS ####

ifeq ($(DEBUG), 1)
	CFLAGS		+= -g3 -O0
endif

#### TARGET COMPILATION ####

.DEFAULT_GOAL	:= all

all: $(TARGET) ## Build this project

# Compilation rule for object files
$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@$(MKDIR) $(@D)
	$(call PRINT, $(CYAN), "build", "compiling", "$@", $(CYAN))
	@$(CC) $(CFLAGS) -MMD -MF $(patsubst %.o, %.d, $@) $(INCLUDES) -c $< -o $@

# Rule for linking the target executable
$(TARGET): $(OBJ_FILES) $(LIBFT_LIB)
	$(call PRINT, $(GREEN), "build", "🔗 linking", "-- $(TARGET)", $(GREEN))
	@$(CC) $(CFLAGS) -o $(TARGET) $(OBJ_FILES) $(INCLUDES) $(LIBS)
	$(call PRINT, $(GREEN), "info", "✨ Build finished!")
	-@echo -n "🚀 $(MAGENTA)" && ls -lah $(TARGET) && echo -n "$(RESET)"

#### LOCAL LIBS COMPILATION ####

## $(FT_PRINTF_LIB):
## 	@$(MAKE) -sC $(FT_PRINTF_PATH)

## $(LIBFT_LIB):
## 	@$(MAKE) -C $(LIBFT_PATH)

#### ADDITIONAL RULES ####

clean: ## Clean objects and dependencies
	@$(RM) $(OBJ_FILES)
	@$(RM) -r $(OBJ_DIR)
	$(call PRINT, $(YELLOW), "clean", "Remove objects", $(YELLOW))
	@$(RM) $(DEPENDS)
	@$(RM) -r $(DEP_DIR)
	$(call PRINT, $(YELLOW), "clean", "Remove dependencies", $(YELLOW))
## 	@(test -s $(LIBFT_LIB) && $(MAKE) -C $(LIBFT_PATH) clean) ||:

fclean: clean ## Restore project to initial state
	@$(RM) $(TARGET)
	$(call PRINT, $(YELLOW), "fclean", "Remove \`$(TARGET)\`", $(YELLOW))
## 	@(test -s $(LIBFT_LIB) && $(MAKE) -C $(LIBFT_PATH) fclean) ||:

re: fclean all ## Rebuild project

help: ## Show help info
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "$(CYAN)%-30s$(RESET) %s\n", $$1, $$2}'

.PHONY: all re clean fclean help

#### COLORS ####
# Color codes
RESET		:= \033[0m
BOLD		:= \033[1m
UNDERLINE	:= \033[4m

# Regular colors
BLACK		:= \033[30m
RED			:= \033[31m
GREEN		:= \033[32m
YELLOW		:= \033[33m
BLUE		:= \033[34m
MAGENTA		:= \033[35m
CYAN		:= \033[36m
WHITE		:= \033[37m

# Background colors
BG_BLACK	:= \033[40m
BG_RED		:= \033[41m
BG_GREEN	:= \033[42m
BG_YELLOW	:= \033[43m
BG_BLUE		:= \033[44m
BG_MAGENTA	:= \033[45m
BG_CYAN		:= \033[46m
BG_WHITE	:= \033[47m
