#### MAIN SETTINGS ####

CC				:= cc
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

#### LOCAL LIBRARIES ####

#### DEBUG SETTINGS ####

ifeq ($(DEBUG), 1)
	CFLAGS		+= -g3 -O0
endif

#### LOGGING ####

LOG_DIR			:= logs/
LOG_FILE		:= $(LOG_DIR)$(TARGET)_build_$(shell date +"%Y-%m-%d_%H-%M-%S").log

#### TARGET COMPILATION ####

all: $(TARGET)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@$(MKDIR) -p $(@D)
	@$(CC) $(CFLAGS) -MMD -MF $(patsubst %.o, %.d, $@) $(INCLUDES) -c $< -o $@\
		2>&1 | tee -a $(LOG_FILE)

$(TARGET): $(OBJ_FILES)
	@echo -e "$(GREEN):: Compile $(TARGET)$(RESET)"
	@$(CC) $(CFLAGS) -o $(TARGET) $(OBJ_FILES) $(INCLUDES) $(LIBS) \
		2>&1 | tee -a $(LOG_FILE)
	@echo -e "$(GREEN):: Compilation finished!$(RESET)"
	@echo -en "$(BLUE)See \`$(LOG_FILE)\` for"
	@echo -e " more details about compilation process.$(RESET)"
	@ls -lah $(TARGET)

#### LOCAL LIBS COMPILATION ####

#### ADDITIONAL RULES ####

clean:
	@$(RM) $(OBJ_FILES)
	@$(RM) -r $(OBJ_DIR)
	@$(RM) $(DEPENDS)
	@$(RM) -r $(DEP_DIR)

fclean:
	@$(RM) $(TARGET)
	@$(RM) $(LOG_FILE)
	@$(RM) -r $(LOG_DIR)

re: fclean all

.PHONY: all re clean fclean

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
