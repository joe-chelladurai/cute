#' Custom bar chart theme
#'
#' This function returns a custom ggplot2 theme for bar charts.
#'
#' @return A ggplot2 theme object
#' @export
#' @import ggplot2
#'
theme_bar <- function() {
  ggplot2::theme(
    panel.grid.major.y = ggplot2::element_blank(),
    panel.grid.minor.y = ggplot2::element_blank(),
    plot.title.position = "plot",
    plot.caption.position = "plot",
    plot.title = ggplot2::element_text(face = "bold", size = 16),
    plot.subtitle = ggplot2::element_text(face = "italic", size = 12),
    axis.text = ggplot2::element_text(size = 12),
    axis.ticks = ggplot2::element_blank(),
    legend.background = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    panel.background = ggplot2::element_rect(fill = "white"),
    panel.grid.major = ggplot2::element_line(color = "gray90"),
    panel.border = ggplot2::element_blank(),
    strip.background = ggplot2::element_blank(),
    plot.background = ggplot2::element_blank()
  )
}
