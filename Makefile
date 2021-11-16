# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jin-lee <jin-lee@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/16 15:39:38 by jin-lee           #+#    #+#              #
#    Updated: 2021/11/16 15:44:01 by jin-lee          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= so_long

CC			= gcc
CFLAGS		= -Wall -Werror -Wextra

OPTIONS		= -arch x86_64

# -L<library dir> -l<library>
LIB			= -L./mlx -lmlx -framework OpenGL -framework AppKit
LIBFT		= ./libft/libft.a
LIBMLX		= ./mlx/libmlx.a

INCS_DIR	= ./includes
OBJS_DIR	= ./objects
SRCS_DIR	= ./srcs

SRCS		= ./srcs/main.c

OBJS		= $(addprefix $(OBJS_DIR)/, $(notdir $(SRCS:.c=.o)))
vpath %.c $(SRCS_DIR)

RM			= rm -f


all: $(NAME)


# so_long
$(NAME): $(OBJS) $(LIBFT) $(LIBMLX)
	@$(CC) $(LIB) $< -o $@
	@echo "\033[32m\n"so_long built successfully."\033[0m\n"

$(OBJS_DIR)/%.o: %.c | $(OBJS_DIR)
	@$(CC) $(CFLAGS) -I $(INCS_DIR) -c $^ -o $@

$(OBJS_DIR):
	@mkdir -p $@


# library
$(LIBFT):
	@$(MAKE) -C ./libft all

# $(LIBMLX):
# 	@$(MAKE) -C ./mlx all

# clean, fclean, re
clean:
	@$(MAKE) -C ./libft clean
#	@$(MAKE) -C ./mlx clean
	@$(RM) -r $(OBJS_DIR)

fclean: clean
	@$(MAKE) -C ./libft fclean
#	@$(MAKE) -C ./mlx clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all, so_long, claen, fclean, re