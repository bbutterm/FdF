# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tquence <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/16 22:35:12 by tquence           #+#    #+#              #
#    Updated: 2020/01/16 22:35:14 by tquence          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

SRC = main.c\
	ft_fdf.c\
	draw.c\
	valid.c\

OBJ	= $(SRC:.c=.o)

# project header
HEADER = ft_fdf.h
HEADERS_DIR = .

# mlx library
MLX_DIR		= ./minilibx_macos
MLX_LIB	= $(addprefix $(MLX),mlx.a)
MLX_INC	= -I ./minilibx_macos
MLX_LNK	= -L ./minilibx_macos -lmlx -framework OpenGL -framework AppKit

# libft
LIB_DIR = ./libft
LIB_FT	= $(addprefix $(LIB_DIR),libft.a)
LIB_INC	= -I ./libft
LIB_LNK	= -L ./libft -lft

GCC = gcc

.PHONY: all clean fclean re


all: $(NAME)

$(NAME): $(LIB_FT) $(MLX_LIB) $(OBJ)
	$(GCC) $(OBJ) $(MLX_LNK) $(LIB_LNK) -lm -o $(NAME)

$(LIB_FT):
	make -C $(LIB_DIR)

$(MLX_LIB):
	make -C $(MLX_DIR)

%.o: %.c $(HEADER)
	$(GCC) $(MLX_INC) $(LIB_INC) -I $(HEADERS_DIR) -o $@ -c $<

clean:
	rm -rf $(OBJ)
	make -C $(LIB_DIR) clean
	make -C $(MLX_DIR) clean

fclean: clean
	rm -rf $(NAME)

re: fclean all
