function color2gray(color)
    hex_value = parse(UInt, color[2:end], base=16)

    red = (hex_value >> 16) & 0xFF
    green = (hex_value >> 8) & 0xFF
    blue = hex_value & 0xFF

    grayscale_value = Int(round((red + green + blue) / 3))

    # Konvertiere den Graustufenwert zurück in einen Farbcode
    grayscale_hex = "#" * uppercase(string(grayscale_value, base=16))^3
    return grayscale_hex
end
