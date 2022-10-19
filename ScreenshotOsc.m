function ScreenshotOsc(TestName, oscdir, dest)
    home = cd;
    cd(dest);
    mkdir Data;
    cd Data;
    mkdir(TestName);
    cd(TestName);
    testhome = cd;
    cd(oscdir);
    cd 'Live Data';       % Hi
    copyfile('SCREENSHOT.png', testhome);
    cd(home);
end