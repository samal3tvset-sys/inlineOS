#define SOUND_BASE 0x40002000

static volatile unsigned int *sound_reg = (unsigned int *)SOUND_BASE;

void sound_init(void) {
    *sound_reg = 1;
}

void sound_play(unsigned int freq, unsigned int duration) {
    *(sound_reg + 1) = freq;
    *(sound_reg + 2) = duration;
    *sound_reg = 3;
}
