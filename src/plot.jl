export plotpalette

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
        savefig("color"*name*".png",dpi=300)
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
        savefig("gray"*name*".png",dpi=300)
    end
end
