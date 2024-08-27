#' @importFrom grDevices colorRampPalette
NULL


#' Available Color Palettes
#'
#' Use \code{\link{style_palette}} to extract palettes of the desired length
#' @export
style_colors <- list(
  blue_gradient = c("#B0E3FC", "#4DCCE6", "#0070A5", "#004175", "#003057"),
  warm_spectrum = c("#FDA182", "#E105AB", "#FFD84D", "#FFAA00", "#D45511"),
  cool_calm = c("#03E952", "#00B344", "#0070A5", "#004175", "#7C3F93"),
  vibrant_mix = c("#FFD84D", "#E105AF", "#00B344", "#4DCCE6", "#7C3F93"),
  pastel = c("#B0E3FC", "#FDA182", "#D3F261", "#BED21E", "#996CE5")
)

#' Style Color Palette Constructor
#'
#' @description Extract a color palette of the desired length
#'
#' @param option The name of the color palette to use. Options are 'blue_gradient', 'warm_spectrum', 'cool_calm', 'vibrant_mix', and 'pastel'
#' @param n The number of colors to return. Currently, all scales are limited to 5 colors
#'
#' @name style_palette
#'
#' @export
style_palette <- function(option = "blue_gradient", n = NULL) {
  stopifnot(is.null(option) || option %in% names(style_colors))
  pal <- style_colors[[option]]
  if (is.null(n)) {
    return(pal)
  }
  if (n > length(pal)) {
    stop(paste0("Not enough colors in palette ", option))
  }
  return(pal[1:n])
}

# helper to generate a palette for discrete scales
palette_gen <- function(direction = 1, option = "blue_gradient") {
  stopifnot(is.numeric(direction))
  function(n) {
    pal <- style_palette(option, n)
    if (direction >= 0) pal else rev(pal)
  }
}

#helper to generate palette for continuous scales
palette_gen_c <- function(direction = 1, option = "blue_gradient", ...) {
  stopifnot(is.numeric(direction))
  pal <- style_palette(option)[c(1, 5)]
  pal <- if (direction >= 0) pal else rev(pal)
  colorRampPalette(pal, ...)
}

#' Style ggplot2 color scales
#'
#' @description
#' ggplot2 fill and color scales derived from the style guide
#'
#' - `scale_color_style()` and `scale_fill_style()` provide discrete fill functions
#' - `scale_color_style_c()` and `scale_fill_style_c()` provide continuous fill functions
#'
#' @param option The name of the color palette to use. See \code{\link{style_palette}} for available options
#' @param direction If greater than or equal to 0, it will return the standard direction; otherwise it will reverse the direction of the palette
#' @param ... Additional arguments passed to ggplot2 scale functions
#'
#' @name style_ggplot2_scales
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' tmp <- data.frame(x = rnorm(100), y = rnorm(100), z = rep(c("a", "b", "c", "d", "e"), 20))
#'
#' # using a discrete scale
#' ggplot(tmp, aes(x, y, color = z)) +
#' geom_point() +
#' scale_color_style()
#'
#' # changing the palette used when creating a discrete scale
#' ggplot(tmp, aes(x, y, color = z)) +
#' geom_point() +
#' scale_color_style(option = "warm_spectrum")
#'
scale_color_style <- function(option = "blue_gradient", direction = 1, ...) {
  ggplot2::discrete_scale(
    aesthetics = "color",
    scale_name = option,
    palette = palette_gen(direction, option = option),
    ...
  )
}

#' @rdname style_ggplot2_scales
#' @export
scale_fill_style <- function(option = "blue_gradient", direction = 1, ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = option,
    palette = palette_gen(direction, option = option),
    ...
  )
}

#' @rdname style_ggplot2_scales
#' @export
scale_color_style_c <- function(option = "blue_gradient", direction = 1, ...) {
  pal <- palette_gen_c(direction = direction, option = option)
  ggplot2::scale_color_gradient(colors = pal(256), ...)
}

#' @rdname style_ggplot2_scales
#' @export
scale_fill_style_c <- function(option = "blue_gradient", direction = 1, ...) {
  pal <- palette_gen_c(direction = direction, option = option)
  ggplot2::scale_fill_gradient(colors = pal(256), ...)
}
