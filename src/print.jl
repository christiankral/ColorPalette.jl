export printcoloripe, printcoloripeall,
    printcolorlatex, printcolorlatexall

function printcoloripe(color; name="")
    # Write to file
    if name != ""
        file = open(name*".isy", "w")
        println(file, "<?xml version=\"1.0\"?>")
        println(file, "<!DOCTYPE ipestyle SYSTEM \"ipe.dtd\">")
        println(file, "<ipestyle name=\""*name*"\">")
    end
    for k in 1:size(color,1)
        for l in 1:size(color,2)
            c = color[k,l]
            r, g, b = round.(color2rgb(c), sigdigits=4)

            # Print color code in Ipe format
            str = "  <color name=\"color"*string(k)*string(l)*"\" value=\""*string(r)*" "*string(g)*" "*string(b)*"\"/>"
            if name != ""
                println(file, str)
            else
                println(str)
            end
        end
    end
    if name != ""
        println(file, "</ipestyle>")
        close(file)
    end
end

function printcoloripeall()
    printcoloripe(ColorPalette.gray, name="ColorPalette.gray")
    printcoloripe(ColorPalette.seasonal, name="ColorPalette.seasonal")
    printcoloripe(ColorPalette.coolors, name="ColorPalette.coolors")
    printcoloripe(ColorPalette.purple, name="ColorPalette.purple")
    printcoloripe(ColorPalette.purple2, name="ColorPalette.purple2")
    printcoloripe(ColorPalette.hanser, name="ColorPalette.hanser")
    printcoloripe(ColorPalette.hanser2, name="ColorPalette.hanser2")
end

function printcolorlatex(color; name="")
    if name != ""
        file = open(name*".tex", "w")
        println(file, "% Color palette: "*name)
        println(file, "\\usepackage{xcolor}")
    else
        println("% Color palette: "*name)
        println("\\usepackage{xcolor}")
    end
    for k in 1:size(color,1)
        for l in 1:size(color,2)
            c = color[k,l]
            R, G, B = color2RGB(c)

            # Print color code in LaTeX format
            str = "\\definecolor{color"*string(k)*string(l)*"}{RGB}{"*string(R)*","*string(G)*","*string(B)*"}"
            if name != ""
                println(file, str)
            else
                println(str)
            end
        end
    end
    if name != ""
        close(file)
    end
end

function printcolorlatexall()
    printcolorlatex(ColorPalette.gray, name="ColorPalette.gray")
    printcolorlatex(ColorPalette.seasonal, name="ColorPalette.seasonal")
    printcolorlatex(ColorPalette.coolors, name="ColorPalette.coolors")
    printcolorlatex(ColorPalette.purple, name="ColorPalette.purple")
    printcolorlatex(ColorPalette.purple2, name="ColorPalette.purple2")
    printcolorlatex(ColorPalette.hanser, name="ColorPalette.hanser")
    printcolorlatex(ColorPalette.hanser2, name="ColorPalette.hanser2")
end
