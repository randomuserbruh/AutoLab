function PlotOscXY(TestName, Channels, ChannelNoX, ChannelNoY, Data, PlotOptions, dest)
    home = cd;
    cd(dest);
    mkdir plots;
    cd plots;
    mkdir(TestName);
    cd(TestName);
    xindex = find(Channels == ChannelNoX, 1);
    yindex = find(Channels == ChannelNoY, 1);
    plot(Data{xindex}.(strcat('C',int2str(ChannelNoX),'InV')), Data{yindex}.(strcat('C',int2str(ChannelNoY),'InV')), ...
        Color = PlotOptions.Color, ...
        LineStyle = PlotOptions.LineStyle, ...
        LineWidth = PlotOptions.LineWidth, ...
        Marker = PlotOptions.Marker, ...
        MarkerEdgeColor = PlotOptions.MarkerEdgeColor, ...
        MarkerFaceColor = PlotOptions.MarkerFaceColor, ...
        MarkerSize = PlotOptions.MarkerSize);
    if strcmp(PlotOptions.xlabel, 'Default') == 1
        xlabel(append('Channel ', int2str(ChannelNoX),' Voltage (V)'));
    else
        xlabel(PlotOptions.xlabel)
    end
    if strcmp(PlotOptions.ylabel, 'Default') == 1
        ylabel(append('Channel ', int2str(ChannelNoY),' Voltage (V)'));
    else
        ylabel(PlotOptions.ylabel)
    end
    if strcmp(PlotOptions.title, 'Default') == 1
        title(append(TestName,' with Channel ', int2str(ChannelNoX), ' against ', int2str(ChannelNoY)));
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
    filename = strcat(TestNameDashed,'-xyplot-CH', int2str(ChannelNoX),'-', int2str(ChannelNoY));
    saveas(gcf,filename);
    close;
    cd(home);
end
