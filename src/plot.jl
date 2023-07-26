export plotpalette, plotpaletteall

function removeaxis(ax=gca())
    setproperty!(ax,"set_axis_off",true)
    xticks([])
    yticks([])
    ax.spines["right"].set_visible(false)
    ax.spines["top"].set_visible(false)
    ax.spines["bottom"].set_visible(false)
    ax.spines["left"].set_visible(false)
    axis("square")
end

function plotpalette(color; save = false, name="")
    figure()
    for k in 1:size(color,1)
        for l in 1:size(color,2)
            c = color[k,l]
            fill([l,l-1,l-1,l], [k-1,k-1,k,k], color = c)
        end
    end
    removeaxis()
    if save
        savefig("color"*name*".png",dpi=300, bbox_inches="tight", pad_inches=0)
        close()
    end

    figure()
    for k in 1:size(color,1)
        for l in 1:size(color,2)
            c = color[k,l]
            fill([l,l-1,l-1,l], [k-1,k-1,k,k], color = color2gray(c))
        end
    end
    removeaxis()
    if save
        savefig("gray"*name*".png",dpi=300, bbox_inches="tight", pad_inches=0)
        close()
    end
    return true
end

function plotpaletteall()
    plotpalette(color_seasonal, save=true, name="_seasonal")
    plotpalette(color_contrast, save=true, name="_contrast")
    plotpalette(color_coolors, save=true, name="_coolors")
    plotpalette(color_purple, save=true, name="_purple")
    plotpalette(color_hanser, save=true, name="_hanser")
    plotpalette(color_hanser2, save=true, name="_hanser2")
end
