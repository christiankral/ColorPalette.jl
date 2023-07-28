export color2RGB, color2rgb, color2gray,
    brightness, contrast, color2HSV,
    RGB2color, rgb2color

# Convert color to RGB codes between 0 and 255
"""
# Function call

`color2RGB(color)`

# Description

Converts hex color code to R, G, B values, where
- 0 ≤ R ≤ 255 (red)
- 0 ≤ G ≤ 255 (green)
- 0 ≤ B ≤ 255 (blue)

# Variables

`color` Hex color code, e.g. "#ff0000"

# Example

```julia
julia> R, G, B = color2RGB("#ff0000")
(255, 0, 0)
```
"""
function color2RGB(color)
    hex_value = parse(UInt, color[2:end], base=16)

    R = Int((hex_value >> 16) & 0xFF)
    G = Int((hex_value >> 8) & 0xFF)
    B = Int(hex_value & 0xFF)
    return R, G, B
end

# Convert color to rgb codes between 0 and 1
"""
# Function call

`color2rgb(color)`

# Description

Converts hex color code to r, g, b values, where
- 0.0 ≤ r ≤ 1.0 (red)
- 0.0 ≤ g ≤ 1.0 (green)
- 0.0 ≤ b ≤ 1.0 (ble)

# Variables

`color` Hex color code, e.g. "#ff0000"

# Example

```julia
julia> r, g, b = color2rgb("#ff0000")
(1.0, 0.0, 0.0)
```
"""
function color2rgb(color)
    R, G, B = color2RGB(color)
    return R/255, G/255, B/255
end

# Convert color to grayscale
"""
# Function call

`color2gray(color)`

# Description

Converts hex color code to hex gray code

# Variables

`color` Hex color code, e.g. "#ff0000"

# Example

```julia
julia> color2gray("#ff0000")
"#555555"
```
"""
function color2gray(color)
    R, G, B = color2RGB(color)
    grayscale = Int(round((R + G + B) / 3))

    # Convert gray scale value to color code
    gray = "#" * string(grayscale, base=16, pad=2)^3
    return gray
end

# Calculate difference of brightness
# Source: https://www.had2know.org/technology/color-contrast-calculator-web-design.html
"""
# Function call

`brightness(color1, color2)`

# Description

Determines the brigness difference between the two color codes.
If the brightness is difference is greater than 125, the colors have sufficient
light/dark contrast and then the second return variable becomes `true`.

See https://www.had2know.org/technology/color-contrast-calculator-web-design.html

# Variables

`color1` First hex color code

`color2` Second hex color code

# Example

```julia
b, bool = brightness("#ff0000", "#ffffff")
(178.755, true)
```
"""
function brightness(color1, color2)
    R1, G1, B1 = color2RGB(color1)
    R2, G2, B2 = color2RGB(color2)

    brightness1 = (299 * R1 + 587 * G1 + 114 * B1) / 1000
    brightness2 = (299 * R2 + 587 * G2 + 114 * B2) / 1000
    diff = abs(brightness1 - brightness2)
    return diff, diff > 125
end

# Calculate difference of contrast
# Source: https://www.had2know.org/technology/color-contrast-calculator-web-design.html
"""
# Function call

`contrast(color1, color2)`

# Description

Determines the color difference between the two color codes.
If the first return value is greater than 500
there is we have sufficient hue contrast
and then the second return variable becomes `true`.

See https://www.had2know.org/technology/color-contrast-calculator-web-design.html

# Variables

`color1` First hex color code

`color2` Second hex color code

# Example

```julia
b, bool = contrast("#ff0000", "#ffffff")
(510, true)
```
"""
function contrast(color1, color2)
    R1, G1, B1 = color2RGB(color1)
    R2, G2, B2 = color2RGB(color2)
    contrast = abs(R1 - R2) + abs(G1 - G2) + abs(B1 - B2)
    return contrast, contrast > 500
end

# Convert RGB to HSV
# Source: https://de.wikipedia.org/wiki/HSV-Farbraum and
# https://en.wikipedia.org/wiki/HSL_and_HSV
"""
# Function call

`color2HSV(color)`

# Description

Converts the hex color code to
- `H` hue with 0.0 ≤ H ≤ 1.0
- `S` saturation with 0.0 ≤ `S`≤ 1.0
- `V` lightness value with 0 ≤ V ≤ 255

See https://en.wikipedia.org/wiki/HSL_and_HSV

# Variables

`color` Hex color code, e.g. "#ff0000"

# Example

```julia
julia> H, S, V = color2HSV("#ff0000")
(0.0, 1.0, 255)
```
"""
function color2HSV(color)
    R, G, B = color2RGB(color)
    MAX = max(R, G, B)
    MIN = min(R, G, B)
    # Calculate hue
    if MAX == MIN
        H = 0
    elseif MAX == R
        H = 60 * (0 + (G - B) / (MAX - MIN))
    elseif MAX == G
        H = 60 * (2 + (B - R) / (MAX - MIN))
    elseif MAX == B
        H = 60 * (4 + (R - G) / (MAX - MIN))
    end
    # Modulo calculation of hue
    H = H < 0 ? H + 360 : H
    # Calculate saturation
    S = MAX == MIN ? 0 : (MAX - MIN) / MAX
    # Calculate value
    V = MAX
    return H, S, V
end

# Convert RGB to hex color code
"""
# Function call

`RGB2color(R, G, B)`

# Description

Converts R, G, B integer codes to hex color code

# Variables

`R` Red integer code, where 0 ≤ `R` ≤ 255

`G` Green integer code, where 0 ≤ `G` ≤ 255

`B` Blue integer code, where 0 ≤ `B` ≤ 255

# Example

```julia
julia> RGB2color(255,0,0)
"#ff0000"
```
"""
function RGB2color(R, G, B)
    color = "#" * string(R, base=16, pad=2) *
        string(G, base=16, pad=2) *
        string(B, base=16, pad=2)
    return color
end

# Convert rgb to hex color code
"""
# Function call

`rgb2color(r, g, b)`

# Description

Converts r, g, b relative codes to hex color code

# Variables

`r` Red relaitve code, where 0.0 ≤ `r` ≤ 1.0

`g` Green relaitve code, where 0.0 ≤ `g` ≤ 1.0

`b` Blue relaitve code, where 0.0 ≤ `B` ≤ 1.0

# Example

```julia
julia> rgb2color(1.0,0.0,0.0)
"#ff0000"
```
"""
function rgb2color(r, g, b)
    R = Int(round(r * 255))
    G = Int(round(g * 255))
    B = Int(round(b * 255))
    color = "#" * string(R, base=16, pad=2) *
        string(G, base=16, pad=2) *
        string(B, base=16, pad=2)
    return color
end
