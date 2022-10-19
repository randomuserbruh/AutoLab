function SaveOscData(TestName, Channels, oscdir, dest)
    home = cd;
    cd(dest);
    mkdir Data;
    cd Data;
    mkdir(TestName);
    cd(TestName);
    testhome = cd;
    cd(oscdir);
    cd 'Live Data';       % Hi
    cd Channel;
    for i = 1:length(Channels)
        index = int2str(Channels(i));
        copyfile(strcat('CH', index, '.csv'), testhome);
    end 
    cd(home);
end