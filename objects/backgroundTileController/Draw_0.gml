//darken and draw bg tiles
shader_set(shdr_bgTile)
draw_tilemap(gameController.backgroundTile, 0, 0);
shader_reset()