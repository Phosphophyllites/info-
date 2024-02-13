def print_color_range():
    """
    prints table of formatted text format options
    """
    for fg in range(30, 38):
        s1 = ''
        for bg in range(40, 48):
            format = ';'.join(['0', str(fg), str(bg)])
            s1 += f'\033[{format}m {format} \033[0m'
        print(s1)


print_color_range()
a='\033[0;31mNO\033[0m'
print(a)