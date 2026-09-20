#define SCREEN_BASE 0x40001000

static volatile unsigned int *screen_reg = (unsigned int *)SCREEN_BASE;

void screen_init(void) {
    *screen_reg = 1;
}

void screen_draw_pixel(int x, int y, unsigned int color) {
    *(screen_reg + 1) = x;
    *(screen_reg + 2) = y;
    *(screen_reg + 3) = color;
}
