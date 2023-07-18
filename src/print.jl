export printcoloripe, printcolorlatex

function printcoloripe(color; name="")
    if name != ""
        println("<?xml version=\"1.0\"?>")
        println("<!DOCTYPE ipestyle SYSTEM \"ipe.dtd\">")
        println("<ipestyle name=\""*name*"\">")
    end
    for k in 1:size(color,1)
        for l in 1:size(color,2)
            c = color[k,l]
            hex_value = parse(UInt, c[2:end], base=16)
            # Color code 0 ≤ red|green|blue ≤ 1
            red = (hex_value >> 16) & 0xFF
            green = (hex_value >> 8) & 0xFF
            blue = hex_value & 0xFF

            # Color code 0 ≤ r|g|b ≤ 1
            r = string(round(red/255,sigdigits=4))
            g = string(round(green/255,sigdigits=4))
            b = string(round(blue/255,sigdigits=4))

            # Print color code in Ipe format
            str = "  <color name=\"color"*string(k)*string(l)*"\" value=\""*string(r)*" "*string(g)*" "*string(b)*"\"/>"
            println(str)
        end
    end
    if name != ""
        println("</ipestyle>")
    end
end


function printcolorlatex(color; name="")
    if name != ""
        println("% Color palette: "*name)
        println("\\usepackage{xcolor}")
    end
    for k in 1:size(color,1)
        for l in 1:size(color,2)
            c = color[k,l]
            hex_value = parse(UInt, c[2:end], base=16)
            # Color code 0 ≤ red|green|blue ≤ 1
            red = (hex_value >> 16) & 0xFF
            green = (hex_value >> 8) & 0xFF
            blue = hex_value & 0xFF

            # Color code 0 ≤ r|g|b ≤ 1
            r = string(round(red/255,sigdigits=4))
            g = string(round(green/255,sigdigits=4))
            b = string(round(blue/255,sigdigits=4))

            # Print color code in Ipe format
            str = "\\definecolor{color"*string(k)*string(l)*"}{RGB}{"*string(red)*","*string(green)*","*string(blue)*"}"
            println(str)
        end
    end
end
