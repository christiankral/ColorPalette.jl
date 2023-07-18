function PlotPalette(color; save = false)
    figure()
    for k in 1:size(color,1)
        for l in 1:size(color,2)
            c = color[k,l]
            fill([l,l-1,l-1,l], [k-1,k-1,k,k], color = c)
        end
    end
    if save
        savefig("color.png",dpi=300)
    end

    figure(figsize = (3.0, 2.5))
    for k in 1:size(color,1)
        for l in 1:size(color,2)
            c = color[k,l]
            fill([l,l-1,l-1,l], [k-1,k-1,k,k], color = color2gray(c))
        end
    end
    if save
        savefig("gray.png",dpi=300)
    end
end
