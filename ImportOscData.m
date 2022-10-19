function Data = ImportOscData(TestName, Channels, Data, dest)
    home = cd;
    cd(dest);
    cd(strcat('Data\', TestName));
    for i = 1:length(Channels)
        index = int2str(Channels(i));
        Data{end+1} = readtable(strcat('CH',index,'.csv'));
    end
    cd(home);
end