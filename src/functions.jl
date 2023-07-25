export color2gray, brightness, contrast

function color2gray(color)
    hex_value = parse(UInt, color[2:end], base=16)

    red = Int((hex_value >> 16) & 0xFF)
    green = Int((hex_value >> 8) & 0xFF)
    blue = Int(hex_value & 0xFF)

    grayscale_value = Int(round((red + green + blue) / 3))

    # Konvertiere den Graustufenwert zurück in einen Farbcode
    grayscale_hex = "#" * uppercase(string(grayscale_value, base=16))^3
    return grayscale_hex
end

# Calculate difference of brightness
# Source: https://www.had2know.org/technology/color-contrast-calculator-web-design.html
function brightness(color1, color2)
    hex_value1 = parse(UInt, color1[2:end], base=16)
    hex_value2 = parse(UInt, color2[2:end], base=16)

    red1 = Int((hex_value1 >> 16) & 0xFF)
    red2 = Int((hex_value2 >> 16) & 0xFF)
    green1 = Int((hex_value1 >> 8) & 0xFF)
    green2 = Int((hex_value2 >> 8) & 0xFF)
    blue1 = Int(hex_value1 & 0xFF)
    blue2 = Int(hex_value2 & 0xFF)

    brightness1 = (299 * red1 + 587 * green1 + 114 * blue1) / 1000
    brightness2 = (299 * red2 + 587 * green2 + 114 * blue2) / 1000
    diff = abs(brightness1 - brightness2)
    return diff, diff > 125
end

# Calculate difference of contrast
# Source: https://www.had2know.org/technology/color-contrast-calculator-web-design.html
function contrast(color1, color2)
    hex_value1 = parse(UInt, color1[2:end], base=16)
    hex_value2 = parse(UInt, color2[2:end], base=16)

    red1 = Int((hex_value1 >> 16) & 0xFF)
    red2 = Int((hex_value2 >> 16) & 0xFF)
    green1 = Int((hex_value1 >> 8) & 0xFF)
    green2 = Int((hex_value2 >> 8) & 0xFF)
    blue1 = Int(hex_value1 & 0xFF)
    blue2 = Int(hex_value2 & 0xFF)
    println(abs(red1 - red2)," | ",abs(green1 - green2)," | ",abs(blue1 - blue2))
    contrast = abs(red1 - red2) + abs(green1 - green2) + abs(blue1 - blue2)
    return contrast, contrast > 500
end
