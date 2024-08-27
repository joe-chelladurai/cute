# cute

## Custom ggplot2 Theme for Elegant Data Visualization

The `cute` package provides a custom ggplot2 theme for creating elegant and consistent data visualizations. It features a clean white background with light gray grid lines, customized text elements, and refined styling for various plot components. This theme aims to enhance the readability and aesthetic appeal of your ggplot2 graphics.

## Features

- Clean white background
- Light gray grid lines
- Customized text elements for titles, subtitles, and axis labels
- Refined styling for various plot components

## Installation

You can install the development version of `cute` from GitHub with:

```r
# install.packages("devtools")
devtools::install_github("joe-chelladurai/cute")
```

## Usage

After installation, you can use the `cute` theme in your ggplot2 visualizations:

```r
library(ggplot2)
library(cute)

# Create a plot with the custom theme
ggplot(mtcars, aes(x = mpg, y = rownames(mtcars)) +
  geom_bar(stat = "identity") +
  theme_bar() 
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Issues and Bug Reports

If you encounter any issues or would like to suggest improvements, please file an issue at:
https://github.com/joe-chelladurai/cute/issues

## Contributing

We welcome contributions to `cute`! Please see our [contributing guidelines](CONTRIBUTING.md) for more details on how to get involved.
