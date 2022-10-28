# AutoLab (WIP)
## _Simple library to extract and plot data from the R&S RTB2000 in MATLAB_
***v 0.1.1***  
[**GitHub**](https://github.com/zceechu/AutoLab)

Might add quick winforms soon, would also solve matlab path issue as I can move the data with C# instead

AutoLab only requires vanilla MATLAB and a wired data connection to the oscilloscope  
Although designed with the R&S RTB2000 in mind, it may be compatible with other R&S oscilloscopes

template.m is a template script file with some brief descriptions  
The other files are functions and class, make sure to add the folder with these inside to your MATLAB path

**TODO:**  
Handle multiple tests  
Marker Indices  
Plot across different tests  

**Future Additions:**  
SCPI Implementation with Easy Remote Commands  
More Devices  

***Why not use SCPI now?***  
Using SCPI requires non-trivial setup and dependencies unlike just using MATLAB and without careful implementation
becomes more difficult to use than I would like  
AutoLab is meant to be as fast and simple to setup and use as possible, perhaps to the detriment of functionality
That being said, for more specific tasks it should be relatively easy to reconfigure

***Will the TODO and Future Additions be added?***  
Probably, but not for a while  
Most other devices require SCPI, but I want the user to have a much easier experience than standard SCPI provides  
The TODO changes are easy to manually work around, and I'd rather work on moving toward some sort of backend SCPI

***Not working?***  
Check Github for any bug fixes / updates  
Hopefully, most errors should be simple to fix
## Quick Start
If you would like to quickly get started, skim the template.m file, most things should be self-explanatory
## Functions
- SaveOscData(TestName, Channels, oscdir, dest)
> Saves the .csv data for the specified channels under a folder of name TestName in the directory dest  
> Channels should be an array with the desired channel numbers inside  
> oscdir should be the directory of the oscilloscope device
- ScreenshotOsc(TestName, oscdir, dest)
> Saves the SCREENSHOT.png under a folder of name TestName in the directory dest  
> oscdir should be the directory of the oscilloscope device  
- ImportOscData(TestName, Channels, Data, dest);
> Returns a cell array of tables for the specified channels from the directory dest\TestName  
> Channels should be an array with the desired channel numbers inside  
> Data should be a cell array, most of the time this should be empty

> Example: Data = ImportOscData(TestName, Channels, Data, dest);
- PlotOscTime(TestName, Channels, ChannelNo, Data, PlotOptions, dest)
> Saves a .fig plot of the Voltage (V) against Time (s) graph for the specified ChannelNo under a   
> folder of name plots in directory dest with the plot properties stored in the PlotOptions class  
> Channels should be an array with the data's channel numbers inside  
> also see PlotOptions Class
- PlotOscXY(TestName, Channels, ChannelNoX, ChannelNoY, Data, PlotOptions, dest)
> Saves a .fig plot of the Voltage (V) against Voltage (V) graph for the 2 specified Channel numbers under  
> a folder of name plots in directory dest with the plot properties stored in the PlotOptions class  
> Channels should be an array with the data's channel numbers inside  
> also see PlotOptions Class
## Classes
- PlotOptions
> Class to store Name-Value arguments for MATLAB plotting  
> The properties are named the same as the default argument names  
> All of the arguments exist except for MarkerIndicies, DatetimeTickFormat and DurationTickFormat  
> Grid options are also available, major lines are on by default  
> The grid options are changed via PlotOptions.grid, the value 'major' enables major grid lines  
> The value 'minor' enables both major and minor grid lines, and other value will remove grid lines e.g. 'off'  
> These are listed below, with their default (same as MATLAB) values:

> Color = '#0072BD';  
> LineStyle = '-';  
> LineWidth = 0.5;  
> Marker = 'none';  
> MarkerEdgeColor = 'auto';  
> MarkerFaceColor = 'none';  
> MarkerSize = 6;  
> xlabel = 'Default';  
> ylabel = 'Default';  
> title = 'Default';  
> plot = 'major';
