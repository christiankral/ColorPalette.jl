export printpaletteipe, printpaletteipeall,
    printpalettelatex, printpalettelatexall

function printpaletteipe(color; name="")
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

function printpaletteipeall()
    printpaletteipe(ColorPalette.black, name="ColorPalette.black")
    printpaletteipe(ColorPalette.gray, name="ColorPalette.gray")
    printpaletteipe(ColorPalette.seasonal, name="ColorPalette.seasonal")
    printpaletteipe(ColorPalette.coolors, name="ColorPalette.coolors")
    printpaletteipe(ColorPalette.purple, name="ColorPalette.purple")
    printpaletteipe(ColorPalette.purple2, name="ColorPalette.purple2")
    printpaletteipe(ColorPalette.hanser, name="ColorPalette.hanser")
    printpaletteipe(ColorPalette.hanser2, name="ColorPalette.hanser2")
    printpaletteipe(ColorPalette.hanser3, name="ColorPalette.hanser3")
end

function printpalettelatex(color; name="")
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

function printpalettelatexall()
    printpalettelatex(ColorPalette.black, name="ColorPalette.black")
    printpalettelatex(ColorPalette.gray, name="ColorPalette.gray")
    printpalettelatex(ColorPalette.seasonal, name="ColorPalette.seasonal")
    printpalettelatex(ColorPalette.coolors, name="ColorPalette.coolors")
    printpalettelatex(ColorPalette.purple, name="ColorPalette.purple")
    printpalettelatex(ColorPalette.purple2, name="ColorPalette.purple2")
    printpalettelatex(ColorPalette.hanser, name="ColorPalette.hanser")
    printpalettelatex(ColorPalette.hanser2, name="ColorPalette.hanser2")
    printpalettelatex(ColorPalette.hanser3, name="ColorPalette.hanser3")
end
