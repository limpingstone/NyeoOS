#define VGA_START   0xB8000
#define VGA_EXTENT  80 * 25

#define STYLE_WB    0x0F

typedef struct {
    char style;
    char character;
} vga_char;

volatile vga_char *text_area = (volatile vga_char*) VGA_START;

void clear_disp() {
    vga_char blank_char = {
        .style = STYLE_WB,
        .character = ' ',
    };

    for (unsigned int i = 0; i < VGA_EXTENT / 2; i++) {
        text_area[i] = blank_char;
    }
}

void print_str(const char *str) {
    for (unsigned int i = 0; i < VGA_EXTENT && str[i] != '\0'; i++) {
        vga_char current_char = {
            .style = STYLE_WB,
            .character = str[i],
        };

        text_area[i] = current_char;
    }
}

int main() {
    clear_disp();
    return 0;
}

