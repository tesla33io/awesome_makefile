#### MAIN SETTINGS ####

CC				:= clang
CFLAGS			:= -Wall -Werror -Wextra -pedantic -O3
LIBS			:=
INCLUDES		:= -Iinclude/

TARGET			:=

SRC_DIR			:= src/
SRC_FILES		+= main.c		# Main

OBJ_DIR			:= obj/
OBJ_FILES		:= $(patsubst %.c, $(OBJ_DIR)%.o, $(SRC_FILES))

DEP_DIR			:= dep/
DEPENDS			:= $(patsubst %.o, $(DEP_DIR)%.d, $(OBJ_FILES))
-include $(DEPENDS)

#### SHELL COMMANDS ####

RM				:= /bin/rm -f
MKDIR			:= /bin/mkdir -p
TOUCH			:= /bin/touch

#### LOCAL LIBRARIES ####

## FT_PRINTF_PATH	:= ft_printf/
## FT_PRINTF_LIB	:= $(FT_PRINTF_PATH)libftprintf.a

## LIBFT_PATH		:= libft/
## LIBFT_LIB		:= $(LIBFT_PATH)libft.a

#### DEBUG SETTINGS ####

ifeq ($(DEBUG), 1)
	CFLAGS		+= -g3 -O0
endif

#### TARGET COMPILATION ####

.DEFAULT_GOAL	:= all

all: $(TARGET) ## Build this project

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@$(MKDIR) $(@D)
	@echo "$(CYAN)[build]: $@$(RESET)"
	@$(CC) $(CFLAGS) -MMD -MF $(patsubst %.o, %.d, $@) $(INCLUDES) -c $< -o $@

$(TARGET): $(OBJ_FILES) $(LIBFT_LIB) $(FT_PRINTF_LIB)
	@echo "$(GREEN)[build]: Link $(TARGET)$(RESET)"
	@$(CC) $(CFLAGS) -o $(TARGET) $(OBJ_FILES) $(INCLUDES) $(LIBS)
	@echo "$(GREEN)[info ]: Build finished!$(RESET)"
	-@echo -n "$(MAGENTA)" && ls -lah $(TARGET) && echo -n "$(RESET)"

#### LOCAL LIBS COMPILATION ####

## $(FT_PRINTF_LIB):
## 	@$(MAKE) -sC $(FT_PRINTF_PATH)

## $(LIBFT_LIB):
## 	@$(MAKE) -sC $(LIBFT_PATH)

#### ADDITIONAL RULES ####

clean: ## Clean objects and dependencies
	@$(RM) $(OBJ_FILES)
	@$(RM) -r $(OBJ_DIR)
	@echo "$(YELLOW)[clean ]: Remove objects$(RESET)"
	@$(RM) $(DEPENDS)
	@$(RM) -r $(DEP_DIR)
	@echo "$(YELLOW)[clean ]: Remove dependecies$(RESET)"
## 	@(test -s $(FT_PRINTF_LIB) && $(MAKE) -sC $(FT_PRINTF_PATH) clean && \
## 		echo "$(YELLOW)[clean ]: Clean \`ft_printf\` lib$(RESET)") || \
## 		echo "$(RED)[clean ]: Can't clean \`ft_printf\` lib$(RESET)"
## 	@(test -s $(LIBFT_LIB) && $(MAKE) -sC $(LIBFT_PATH) clean && \
## 		echo "$(YELLOW)[clean ]: Clean \`libft\` lib$(RESET)") || \
## 		echo "$(RED)[clean ]: Can't clean \`libft\` lib$(RESET)"

fclean: clean ## Restore project to initial state
	@$(RM) $(TARGET)
	@echo "$(YELLOW)[fclean]: Remove \`$(TARGET)\`$(RESET)"
## 	@(test -s $(FT_PRINTF_LIB) && $(MAKE) -sC $(FT_PRINTF_PATH) fclean && \
## 		echo "$(YELLOW)[fclean]: Remove \`ft_printf\` lib$(RESET)") || \
## 		echo "$(RED)[fclean]: Can't remove \`ft_printf\` lib$(RESET)"
## 	@(test -s $(LIBFT_LIB) && $(MAKE) -sC $(LIBFT_PATH) fclean && \
## 		echo "$(YELLOW)[fclean]: Remove \`libft\` lib$(RESET)") || \
## 		echo "$(RED)[fclean]: Can't remove \`libft\` lib$(RESET)"

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
