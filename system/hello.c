void screen_init(void);
void screen_draw_pixel(int x, int y, unsigned int color);

void kernel_main(void) {
    screen_init();
    
    for(int y = 50; y < 150; y++) {
        for(int x = 50; x < 250; x++) {
            screen_draw_pixel(x, y, 0xFFFFFF);
        }
    }

    while(1) {
        __asm__ volatile("wfi");
    }
}
