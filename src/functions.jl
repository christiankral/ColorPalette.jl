export color2RGB, color2rgb, color2gray,
    brightness, contrast, color2HSV

# Convert color to RGB codes between 0 and 255
function color2RGB(color)
    hex_value = parse(UInt, color[2:end], base=16)

    R = Int((hex_value >> 16) & 0xFF)
    G = Int((hex_value >> 8) & 0xFF)
    B = Int(hex_value & 0xFF)
    return R,G,B
end

# Convert color to rgb codes between 0 and 1
function color2rgb(color)
    R, G, B = color2RGB(color)
    return R/255, G/255, B/255
end

# Convert color to grayscale
function color2gray(color)
    R, G, B = color2RGB(color)
    grayscale = Int(round((R + G + B) / 3))

    # Convert gray scale value to color code
    gray = "#" * string(grayscale, base=16)^3
    return gray
end

# Calculate difference of brightness
# Source: https://www.had2know.org/technology/color-contrast-calculator-web-design.html
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
function contrast(color1, color2)
    R1, G1, B1 = color2RGB(color1)
    R2, G2, B2 = color2RGB(color2)
    contrast = abs(R1 - R2) + abs(G1 - G2) + abs(B1 - B2)
    return contrast, contrast > 500
end

# Convert RGB to HSV
# Source: https://de.wikipedia.org/wiki/HSV-Farbraum
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
