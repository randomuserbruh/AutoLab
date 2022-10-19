% v 0.1.1
% You may need to change the directories in SaveOscData.m and
% ScreenshotOsc.m (the cd commands are just based on memory)

addpath('ENTER PATH OF LIBRARY FOLDER')

oscdir = 'This PC\Rohde&Schwarz RTB2002'; % ENTER OSCILLOSCOPE DIRECTORY
dest = 'ENTER DESTINATION DIRECTORY';

% Name the test
TestName = 'Test A';
% Indicate Channels
Channels = [1,2];

% Indicate Channel for time plot
ChannelNo  = 1;
% Indicate Channels for XY plot
ChannelNoX = 1;
ChannelNoY = 2;

% Creates a default Plot Options variable
PO = PlotOptions;
% These options can be easily configured
% They use the same names as the standard plot parameters
% For example:
% PO.Color = '#000000'; will make the color of the plot black
% All of the name value arguments exist except for MarkerIndicies
% DatetimeTickFormat and DurationTickFormat

Data = {};

SaveOscData(TestName, Channels, oscdir, dest)
ScreenshotOsc(TestName, oscdir, dest)
Data = ImportOscData(TestName, Channels, Data, dest);
PlotOscTime(TestName, Channels, ChannelNo, Data, PO, dest)
PlotOscXY(TestName, Channels, ChannelNoX, ChannelNoY, Data, PO, dest)

clc