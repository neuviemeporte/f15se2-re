/*
 * vgapal.c
 *
 * Program that constructs the standard VGA palette and outputs it as
 * text to standard output.
 *
 * The text output is formatted as rows of decimal values representing
 * unsigned bytes.  Each triple of decimal values specifies the red,
 * green, and blue value of a palette entry (in that order).  Palette
 * entries are output in order, all 256 of them.
 *
 * This program accepts a single command-line argument beyond the
 * program name.  This single argument must either be "64" or "256" and
 * it specifies how many intensity levels each channel has.  "64"
 * indicates each RGB channel has a range from [0, 63] (matching the
 * classic VGA palette), while "256" indicates each RGB channel has a
 * range from [0, 255] (matching modern hardware).
 *
 * The 256-level palette is derived from the 64-level palette by
 * shifting each channel value left by two bits and duplicating the two
 * most significant bits in the two least significant bits.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function prototypes */
static void addColor(int r, int g, int b);
static void addGrayColor(int v);
static void add16Color(int lo, int melo, int mehi, int hi);
static int addRun(
    int start,
    int ch,
    int lo,
    int melo,
    int me,
    int mehi,
    int hi);
static void addCycle(int lo, int melo, int me, int mehi, int hi);
static void buildPalette(void);
static void levelUp(void);
static void printPalette(int levelup);
static void vgapal(int levelup);

/* The array that will contain the calculated palette, in unsigned byte
   triples */
static unsigned char pal[256 * 3];

/* The number of palette entries that have been written to pal */
static int pal_written = 0;

/* 
 * Add another color entry to the palette.
 *
 * All palette entries added here must use 64-level values.
 *
 * Parameters:
 *
 *   r - the red channel value
 *
 *   g - the green channel value
 *
 *   b - the blue channel value
 */
static void addColor(int r, int g, int b) {

  int i = 0;

  /* Check ranges */
  if ((r < 0) || (r > 63) ||
      (g < 0) || (g > 63) ||
      (b < 0) || (b > 63)) {
    abort();
  }

  /* Check that palette isn't full */
  if (pal_written >= 256) {
    abort();
  }

  /* Check that pal_written is sane */
  if (pal_written < 0) {
    abort();
  }

  /* Calculate starting offset in palette */
  i = pal_written * 3;

  /* Write the color to palette */
  pal[i] = (unsigned char) r;
  pal[i + 1] = (unsigned char) g;
  pal[i + 2] = (unsigned char) b;

  /* Update pal_written */
  pal_written++;
}

/*
 * Add a grayscale color to the palette.
 *
 * This calls through to addColor with all channel values equal to
 * the provided v.
 *
 * Parameters:
 *
 *   v - the grayscale value
 */
static void addGrayColor(int v) {
  addColor(v, v, v);
}

/*
 * Add the 16 color entries of the standard 16-color palette.
 *
 * Parameters:
 *
 *   lo - the low intensity value to use
 *
 *   melo - the medium-low intensity value to use
 *
 *   mehi - the medium-high intensity value to use
 *
 *   hi - the high intensity value to use
 */
static void add16Color(int lo, int melo, int mehi, int hi) {

  int r = 0;
  int g = 0;
  int b = 0;
  int i = 0;
  int h = 0;
  int l = 0;

  /* The passed values must be in 64-level range */
  if ((lo < 0) || (lo > 63) ||
      (melo < 0) || (melo > 63) ||
      (mehi < 0) || (mehi > 63) ||
      (hi < 0) || (hi > 63)) {
    abort();
  }

  /* Generate each of the 16 values */
  for(i = 0; i < 16; i++) {
    /* Determine whether low-intensity series or high-intensity */
    if ((i & 8) == 8) {
      /* Intensity bit set -- define intense range */
      h = hi;
      l = melo;

    } else {
      /* Intensity bit clear -- define low-intensity range */
      h = mehi;
      l = lo;
    }

    /* Start by setting each channel to low value */
    r = l;
    g = l;
    b = l;

    /* Activate channels selected by the appropriate bit */
    if ((i & 4) == 4) {
      r = h;
    }
    if ((i & 2) == 2) {
      g = h;
    }
    if ((i & 1) == 1) {
      b = h;
    }

    /* As an exceptional case, for index 6 only, change the green
       component to medium-low intensity so that we get brown instead
       of dark yellow */
    if (i == 6) {
      g = melo;
    }

    /* Add this color */
    addColor(r, g, b);
  } 
}

/*
 * Add four colors to the palette corresponding to a "run" within an
 * RGB cycle.
 *
 * start, ch, and the return value are encoded such that only the three
 * least significant bits are used.  The most significant of these
 * corresponds to red, the next to green, and the least significant to
 * blue.
 *
 * Intensity values must be 64-level.
 *
 * Parameters:
 *
 *   start - high and low starting states for each channel at the start
 *   of the run
 *
 *   ch - the channel to change from high to low or low to high (only
 *   one bit may be set)
 *
 *   lo - the low intensity value
 *
 *   melo - the medium-low intensity value
 *
 *   me - the medium intensity value
 *
 *   mehi - the medium-high intensity value
 *
 *   hi - the high intensity value
 *
 * Return:
 *
 *   the high and low starting states for each channel at the start of
 *   the run after this one
 */
static int addRun(
    int start,
    int ch,
    int lo,
    int melo,
    int me,
    int mehi,
    int hi) {

  int r = 0;
  int g = 0;
  int b = 0;
  int i = 0;
  int up = 0;
  int v = 0;

  /* Check parameters */
  if ((start < 0) || (start > 7)) {
    abort();
  }
  if ((ch != 1) && (ch != 2) && (ch != 4)) {
    abort();
  }
  if ((lo < 0) || (lo > 63) ||
      (melo < 0) || (melo > 63) ||
      (me < 0) || (me > 63) ||
      (mehi < 0) || (mehi > 63) ||
      (hi < 0) || (hi > 63)) {
    abort();
  }

  /* Get the starting RGB color and add it */
  r = lo;
  g = lo;
  b = lo;

  if ((start & 4) == 4) {
    r = hi;
  }
  if ((start & 2) == 2) {
    g = hi;
  }
  if ((start & 1) == 1) {
    b = hi;
  }

  addColor(r, g, b);

  /* If selected channel starts high, we're going down; else, we're
     going up */
  if ((start & ch) == ch) {
    up = 0;
  } else {
    up = 1;
  }

  /* Add remaining three colors of the run */
  for(i = 0; i < 3; i++) {
    /* Value depends if we're going up or down */
    if (up) {
      /* Going up */
      if (i == 0) {
        v = melo;
      } else if (i == 1) {
        v = me;
      } else {
        v = mehi;
      }
    } else {
      /* Going down */
      if (i == 0) {
        v = mehi;
      } else if (i == 1) {
        v = me;
      } else {
        v = melo;
      }
    }

    /* Adjust the proper channel */
    if (ch == 4) {
      r = v;
    } else if (ch == 2) {
      g = v;
    } else {
      b = v;
    }

    /* Add the color */
    addColor(r, g, b);
  }

  /* The next run starts at the starting position of this run, with the
     channel we just handled flipped */
  return (start ^ ch);
}

/*
 * Add a 24-color RGB cycle to the palette.
 *
 * A cycle consists of six 4-color runs, each of which transitions from
 * one hue to another until arriving back at starting position.
 *
 * Intensities must be provided in 64-level scale.
 *
 * Parameters:
 *
 *   lo - low intensity value
 *
 *   melo - medium-low intensity value
 *
 *   me - medium intensity value
 *
 *   mehi - medium-high intensity value
 *
 *   hi - high intensity value
 */
static void addCycle(int lo, int melo, int me, int mehi, int hi) {

  int hue = 0;

  /* Check parameters */
  if ((lo < 0) || (lo > 63) ||
      (melo < 0) || (melo > 63) ||
      (me < 0) || (me > 63) ||
      (mehi < 0) || (mehi > 63) ||
      (hi < 0) || (hi > 63)) {
    abort();
  }

  /* We start out at blue */
  hue = 1;

  /* Add each run, updating the hue each time */
  hue = addRun(hue, 4, lo, melo, me, mehi, hi);
  hue = addRun(hue, 1, lo, melo, me, mehi, hi);
  hue = addRun(hue, 2, lo, melo, me, mehi, hi);

  hue = addRun(hue, 4, lo, melo, me, mehi, hi);
  hue = addRun(hue, 1, lo, melo, me, mehi, hi);
  hue = addRun(hue, 2, lo, melo, me, mehi, hi);
}

/*
 * Write all 256 colors to the palette using addColor.
 *
 * The palette is always written here as 64-level.
 */
static void buildPalette(void) {
  int x = 0;

  /* Add the 16-color palette first */
  add16Color(0, 21, 42, 63);

  /* Next we have 16 shades of gray */
  addGrayColor( 0);
  addGrayColor( 5);
  addGrayColor( 8);
  addGrayColor(11);
  addGrayColor(14);
  addGrayColor(17);
  addGrayColor(20);
  addGrayColor(24);
  addGrayColor(28);
  addGrayColor(32);
  addGrayColor(36);
  addGrayColor(40);
  addGrayColor(45);
  addGrayColor(50);
  addGrayColor(56);
  addGrayColor(63);

  /* Now come the nine RGB cycles, organized in three groups of three
     cycles -- the groups represent high value, medium value, and low
     value, and the cycles within the groups represent high saturation,
     medium saturation, low saturation */
  addCycle( 0, 16, 31, 47, 63);
  addCycle(31, 39, 47, 55, 63);
  addCycle(45, 49, 54, 58, 63);

  addCycle( 0,  7, 14, 21, 28);
  addCycle(14, 17, 21, 24, 28);
  addCycle(20, 22, 24, 26, 28);

  addCycle( 0,  4,  8, 12, 16);
  addCycle( 8, 10, 12, 14, 16);
  addCycle(11, 12, 13, 15, 16);

  /* Fill the last eight palette entries with full black */
  addGrayColor(0);
  addGrayColor(0);
  addGrayColor(0);
  addGrayColor(0);

  addGrayColor(0);
  addGrayColor(0);
  addGrayColor(0);
  addGrayColor(0);
}

/*
 * Convert the palette from 64-level to 256-level.
 *
 * This may only be called once.  All 256 colors of the palette must
 * already have been added.
 */
static void levelUp(void) {
  static int first_call = 1;

  int i = 0;
  int v = 0;

  /* Can only call once */
  if (first_call) {
    first_call = 0;
  } else {
    abort();
  }

  /* Palette must be full */
  if (pal_written != 256) {
    abort();
  }

  /* Convert each individual component from 64-level to 256-level */
  for(i = 0; i < (256 * 3); i++) {
    /* Get component value */
    v = pal[i];

    /* Verify range */
    if (v > 63) {
      abort();
    }

    /* First, shift value two bits left */
    v = (v << 2);

    /* Second, duplicate two most significant bits of byte in two least
       significant bits */
    v = v | (v >> 6);

    /* Write converted value back to palette */
    pal[i] = (unsigned char) v;
  }
}

/*
 * Print the contents of the palette.
 *
 * All 256 colors must already have been added to the palette.  The
 * palette must *not* have already been upconverted from 64-level to
 * 256-level; this procedure will do that if requested.
 *
 * Parameters:
 *
 *   levelup - non-zero if the palette should be upconverted to 256
 *   levels before being printed, zero to leave it at 64 levels
 */
static void printPalette(int levelup) {

  int i = 0;

  /* Palette must be full */
  if (pal_written != 256) {
    abort();
  }

  /* Upconvert the palette if requested */
  if (levelup) {
    levelUp();
  }

  /* Write each component */
  for(i = 0; i < (256 * 3); i++) {
 
     /* Figure out if we need to prefix a separator */
    if (i == 0) {
      /* First component -- no separator */

    } else if ((i % 12) == 0) {
      /* Not first component but multiple of 12 (every four colors), so
         add a line break */
      printf("\n");

    } else if ((i % 3) == 0) {
      /* Not a multiple of 12 but a multiple of three (each color), so
         add double space separator */
      printf("  ");

    } else {
      /* Not a multiple of three, so just add a single space */
      printf(" ");
    }

    /* Output component value, aligned to 3-digit if 256-level or
       2-digit if 64-level */
    if (levelup) {
      printf("%3d", (int) pal[i]);
    } else {
      printf("%2d", (int) pal[i]);
    }

    /* If not the last component, suffix a comma */
    if (i < (256 * 3) - 1) {
      printf(",");
    }
  }

  /* Add a line break at the very end */
  printf("\n");
}

/*
 * Program procedure.
 *
 * Parameters:
 *
 *   levelup - non-zero if output should be converted to 256-level,
 *   zero for output in 64-level
 */
static void vgapal(int levelup) {
  buildPalette();
  printPalette(levelup);
}

/*
 * Main procedure.
 *
 * Parameters:
 *
 *   argc - number of command-line arguments (including program name)
 *
 *   argv - array of pointers to null-terminated ASCII arguments
 *
 * Return:
 * 
 *   zero if successful, one if error
 */
int main(int argc, char *argv[]) {

  int status = 1;
  int levelup = 0;

  /* Number of arguments must be at least one and argument array must
     not be NULL */
  if ((argc < 1) || (argv == NULL)) {
    abort();
  }

  /* If no additional arguments, display help screen and fail */
  if (status && (argc <= 1)) {
    fprintf(stderr, "%s [levels]\n\n", argv[0]);
    fprintf(stderr, "levels - either 64 or 256, indicating maximum\n");
    fprintf(stderr, "channel intensity value\n\n");
    status = 0;
  }

  /* If too many arguments, fail */
  if (status && (argc > 2)) {
    fprintf(stderr, "%s:  Too many arguments!\n", argv[0]);
    status = 0;
  }

  /* Parse parameter, setting levelup flag if we need to convert up to
     256-level output */
  if (status) {
    if (argv[1] == NULL) {
      abort();
    }

    if (strcmp(argv[1], "64") == 0) {
      /* 64-level; no upconversion required */
      levelup = 0;
    } else if (strcmp(argv[1], "256") == 0) {
      /* 256-level; upconversion required */
      levelup = 1;
    } else {
      /* Unrecognized value */
      fprintf(stderr, "%s:  Only 64 and 256 supported for levels.\n",
        argv[0]);
      status = 0;
    }
  }

  /* Call through to main program, passing flag */
  if (status) {
    vgapal(levelup);
  }

  /* Invert status for return */
  if (status) {
    status = 0;
  } else {
    status = 1;
  }

  /* Return inverted status */
  return status;
}