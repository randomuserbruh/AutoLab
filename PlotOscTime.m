function PlotOscTime(TestName, Channels, ChannelNo, Data, PlotOptions, dest)
    home = cd;
    cd(dest);
    mkdir plots;
    cd plots;
    mkdir(TestName);
    cd(TestName);
    index = find(Channels == ChannelNo, 1);
    plot(Data{index}.inS, Data{index}.(strcat('C', int2str(ChannelNo),'InV')), ...
        Color = PlotOptions.Color, ...
        LineStyle = PlotOptions.LineStyle, ...
        LineWidth = PlotOptions.LineWidth, ...
        Marker = PlotOptions.Marker, ...
        MarkerEdgeColor = PlotOptions.MarkerEdgeColor, ...
        MarkerFaceColor = PlotOptions.MarkerFaceColor, ...
        MarkerSize = PlotOptions.MarkerSize);
    if strcmp(PlotOptions.xlabel, 'Default') == 1
        xlabel('Time (s)');
    else
        xlabel(PlotOptions.xlabel)
    end
    if strcmp(PlotOptions.ylabel, 'Default') == 1
        ylabel('Voltage (V)');
    else
        ylabel(PlotOptions.ylabel)
    end
    if strcmp(PlotOptions.title, 'Default') == 1
        title(append(TestName,' on Channel ',int2str(ChannelNo)))
    else
        title(PlotOptions.title)
    end
    if strcmp(PlotOptions.grid, 'major') == 1
        grid on;
    elseif strcmp(PlotOptions.grid, 'minor') == 1
        grid on;
        grid minor;
    end
    TestNameDashed = regexprep(TestName,'\s', '-');
    filename = strcat(TestNameDashed,'-tplot-CH', int2str(ChannelNo));
    saveas(gcf,filename);
    close;
    cd(home);
end
