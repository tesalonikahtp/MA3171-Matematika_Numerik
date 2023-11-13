function [] = Plot_2D_Heatmap(T, figTitle)
    c_low = min(min(min(T)));
    c_high = max(max(max(T)));
    sz = size(T);
    x = linspace(0, 1, sz(1));
    y = linspace(0, 1, sz(2));
    for i = 1 : sz(3)
        imagesc(x, y, T(:, :, i))
        colormap('parula')
        colorbar
        caxis([c_low c_high])
        set(gca,'YTickLabel',[]);
        set(gca,'XTickLabel',[]);
        title([figTitle " frame = " string(i)], 'fontsize', 15)
        drawnow
    end
end