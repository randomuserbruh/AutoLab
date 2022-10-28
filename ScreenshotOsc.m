function ScreenshotOsc(TestName, oscdir, dest)
    home = cd;
    cd(dest);
    mkdir Data;
    cd Data;
    mkdir(TestName);
    cd(TestName);
    testhome = cd;
    oldpath = path;         %sus
    path(oldpath, 'oscdir');    %sus
    cd(oscdir);
    cd 'Live Data';       % Hi
    copyfile('SCREENSHOT.png', testhome);
    cd(home);
    path = oldpath;
end
