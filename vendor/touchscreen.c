#define TOUCH_BASE 0x40000000

static volatile unsigned int *touch_reg = (unsigned int *)TOUCH_BASE;

void touch_init(void) {
    *touch_reg = 1;
}

int touch_read(int *x, int *y) {
    if (*touch_reg & 0x2) {
        *x = *(touch_reg + 1);
        *y = *(touch_reg + 2);
        return 1;
    }
    return 0;
}
