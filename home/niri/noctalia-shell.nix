{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    cliphist
  ];
  services.cliphist = {
    enable = true;
    allowImages = true;
    clipboardPackage = pkgs.wl-clipboard;
    package = pkgs.cliphist;
  };

  programs.noctalia-shell = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      calendarSupport = true;
    };
    systemd.enable = true;
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Source";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        privacy-indicator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        clipper = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 1;
    };

    pluginSettings = {
      privacy-indicator = {
        hideInactive = true;
        removeMargins = false;
        iconSpacing = 4;
      };
      tailscale = {
        refreshInterval = 5000;
        compactMode = true;
        showIpAddress = false;
        showPeerCount = false;
        hideDisconnected = false;
        terminalCommand = "kitty";
        pingCount = 5;
        defaultPeerAction = "ssh";
      };
      clipper = {
        enableTodoIntegration = false;

        cardColors = {
          Text = {
            bg = "mOutline";
            separator = "mSurface";
            fg = "mOnSurface";
          };
          Image = {
            bg = "mTertiary";
            separator = "mSurface";
            fg = "mOnTertiary";
          };
          Link = {
            bg = "mPrimary";
            separator = "mSurface";
            fg = "mOnPrimary";
          };
          Code = {
            bg = "mSecondary";
            separator = "mSurface";
            fg = "mOnSecondary";
          };
          Color = {
            bg = "mSecondary";
            separator = "mSurface";
            fg = "mOnSecondary";
          };
          Emoji = {
            bg = "mHover";
            separator = "mSurface";
            fg = "mOnHover";
          };
          File = {
            bg = "mError";
            separator = "mSurface";
            fg = "mOnError";
          };
        };

        customColors = {
          Text = {
            bg = "#555555";
            separator = "#000000";
            fg = "#e9e4f0";
          };
          Image = {
            bg = "#e0b7c9";
            separator = "#000000";
            fg = "#20161f";
          };
          Link = {
            bg = "#c7a1d8";
            separator = "#000000";
            fg = "#1a151f";
          };
          Code = {
            bg = "#a984c4";
            separator = "#000000";
            fg = "#f3edf7";
          };
          Color = {
            bg = "#a984c4";
            separator = "#000000";
            fg = "#f3edf7";
          };
          Emoji = {
            bg = "#e0b7c9";
            separator = "#000000";
            fg = "#20161f";
          };
          File = {
            bg = "#e9899d";
            separator = "#000000";
            fg = "#1e1418";
          };
        };
      };
    };

    settings = {
      appLauncher = {
        customLaunchPrefix = "";
        customLaunchPrefixEnabled = false;
        enableClipPreview = true;
        enableClipboardHistory = true;
        pinnedExecs = [];
        position = "center";
        showCategories = true;
        sortByMostUsed = true;
        terminalCommand = "kitty";
        useApp2Unit = false;
        viewMode = "list";
      };
      audio = {
        cavaFrameRate = 30;
        externalMixer = "pwvucontrol || pavucontrol";
        mprisBlacklist = [];
        preferredPlayer = "";
        visualizerQuality = "high";
        visualizerType = "linear";
        volumeOverdrive = false;
        volumeStep = 5;
      };
      bar = {
        capsuleOpacity = 1;
        density = "default";
        exclusive = true;
        floating = true;
        marginHorizontal = 0.25;
        marginVertical = 0.25;
        monitors = [];
        outerCorners = true;
        position = "top";
        showCapsule = true;
        showOutline = false;
        transparent = false;
        widgets = {
          center = [
            {
              colorName = "primary";
              hideWhenIdle = true;
              id = "AudioVisualizer";
              width = 500;
            }
          ];
          left = [
            {
              colorizeDistroLogo = false;
              colorizeSystemIcon = "none";
              customIconPath = "";
              enableColorization = false;
              icon = "noctalia";
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              characterCount = 2;
              colorizeIcons = false;
              enableScrollWheel = true;
              followFocusedScreen = true;
              hideUnoccupied = true;
              id = "Workspace";
              labelMode = "none";
              showApplications = true;
              showLabelsOnlyWhenOccupied = true;
            }
          ];
          right = [
            {
              id = "plugin:privacy-indicator";
            }
            {
              displayMode = "alwaysShow";
              id = "Volume";
            }
            {
              displayMode = "alwaysShow";
              id = "Brightness";
            }
            {
              displayMode = "onclick";
              id = "Bluetooth";
            }
            {
              displayMode = "onclick";
              id = "Network";
            }
            {
              displayMode = "onclick";
              id = "plugin:tailscale";
            }
            {
              displayMode = "alwaysShow";
              id = "Battery";
              showNoctaliaPerformance = true;
              showPowerProfiles = true;
              warningThreshold = 20;
            }
            {
              id = "plugin:clipper";
            }
            {
              customFont = "";
              formatHorizontal = "HH:mm ddd, dd MMM";
              formatVertical = "HH mm - dd MM";
              id = "Clock";
              useCustomFont = false;
              usePrimaryColor = false;
            }
            {
              hideWhenZero = true;
              id = "NotificationHistory";
              showUnreadBadge = true;
            }
          ];
        };
      };
      brightness = {
        brightnessStep = 5;
        enableDdcSupport = false;
        enforceMinimum = true;
      };
      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "timer-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };
      colorSchemes = {
        darkMode = true;
        generateTemplatesForPredefined = true;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        matugenSchemeType = "Monochrome";
        predefinedScheme = "Monochrome";
        schedulingMode = "off";
        useWallpaperColors = false;
      };
      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "brightness-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
          {
            displayMode = "onclick";
            id = "plugin:tailscale";
          }
        ];
        position = "close_to_bar_button";
        shortcuts = {
          left = [{id = "WiFi";} {id = "Bluetooth";} {id = "KeepAwake";}];
          right = [{id = "Notifications";} {id = "PowerProfile";} {id = "NightLight";}];
        };
      };
      desktopWidgets = {
        editMode = false;
        enabled = false;
        monitorWidgets = [];
      };
      dock = {
        enabled = true;
        backgroundOpacity = 1;
        colorizeIcons = false;
        deadOpacity = 0.6;
        displayMode = "auto_hide";
        floatingRatio = 1;
        inactiveIndicators = false;
        monitors = [];
        onlySameOutput = true;
        pinnedApps = [];
        pinnedStatic = false;
        size = 1;
      };
      general = {
        allowPanelsOnScreenWithoutBar = true;
        animationDisabled = false;
        animationSpeed = 1;
        avatarImage = "";
        boxRadiusRatio = 1;
        compactLockScreen = false;
        dimmerOpacity = 0.2;
        enableShadows = false;
        forceBlackScreenCorners = false;
        iRadiusRatio = 1;
        language = "";
        lockOnSuspend = true;
        radiusRatio = 1;
        scaleRatio = 1;
        screenRadiusRatio = 1;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        showHibernateOnLockScreen = false;
        showScreenCorners = false;
        showSessionButtonsOnLockScreen = true;
      };
      hooks = {
        darkModeChange = "";
        enabled = false;
        screenLock = "";
        screenUnlock = "";
        wallpaperChange = "";
      };
      location = {
        analogClockInCalendar = false;
        firstDayOfWeek = 1;
        name = "Heidenheim";
        showCalendarEvents = true;
        showCalendarWeather = true;
        showWeekNumberInCalendar = true;
        use12hourFormat = false;
        useFahrenheit = false;
        weatherEnabled = true;
        weatherShowEffects = true;
      };
      network = {wifiEnabled = true;};
      nightLight = {
        autoSchedule = false;
        dayTemp = "6500";
        enabled = false;
        forced = false;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        nightTemp = "4000";
      };
      notifications = {
        enabled = true;
        backgroundOpacity = 1;
        criticalUrgencyDuration = 15;
        enableKeyboardLayoutToast = true;
        location = "top_right";
        lowUrgencyDuration = 3;
        monitors = [];
        normalUrgencyDuration = 8;
        overlayLayer = true;
        respectExpireTimeout = false;
        sounds = {
          criticalSoundFile = "";
          enabled = false;
          excludedApps = "discord,firefox,chrome,chromium,edge";
          lowSoundFile = "";
          normalSoundFile = "";
          separateSounds = false;
          volume = 0.5;
        };
      };
      osd = {
        enabled = true;
        autoHideMs = 2000;
        backgroundOpacity = 1;
        enabledTypes = [0 1 2 4];
        location = "top_right";
        monitors = [];
        overlayLayer = true;
      };
      screenRecorder = {
        audioCodec = "opus";
        audioSource = "default_output";
        colorRange = "limited";
        directory = "";
        frameRate = 60;
        quality = "very_high";
        showCursor = true;
        videoCodec = "h264";
        videoSource = "portal";
      };
      sessionMenu = {
        countdownDuration = 10000;
        enableCountdown = true;
        largeButtonsStyle = false;
        position = "center";
        powerOptions = [
          {
            enabled = true;
            action = "lock";
            command = "";
            countdownEnabled = true;
          }
          {
            enabled = true;
            action = "suspend";
            command = "";
            countdownEnabled = true;
          }
          {
            enabled = true;
            action = "hibernate";
            command = "";
            countdownEnabled = true;
          }
          {
            enabled = true;
            action = "reboot";
            command = "";
            countdownEnabled = true;
          }
          {
            enabled = true;
            action = "logout";
            command = "";
            countdownEnabled = true;
          }
          {
            enabled = true;
            action = "shutdown";
            command = "";
            countdownEnabled = true;
          }
        ];
        showHeader = true;
      };
      systemMonitor = {
        cpuCriticalThreshold = 90;
        cpuPollingInterval = 3000;
        cpuWarningThreshold = 80;
        criticalColor = "";
        diskCriticalThreshold = 90;
        diskPollingInterval = 3000;
        diskWarningThreshold = 80;
        enableNvidiaGpu = false;
        gpuCriticalThreshold = 90;
        gpuPollingInterval = 3000;
        gpuWarningThreshold = 80;
        memCriticalThreshold = 90;
        memPollingInterval = 3000;
        memWarningThreshold = 80;
        networkPollingInterval = 3000;
        tempCriticalThreshold = 90;
        tempPollingInterval = 3000;
        tempWarningThreshold = 80;
        useCustomColors = false;
        warningColor = "";
      };
      templates = {
        alacritty = false;
        cava = false;
        code = false;
        discord = false;
        emacs = false;
        enableUserTemplates = false;
        foot = false;
        fuzzel = false;
        ghostty = false;
        gtk = false;
        kcolorscheme = false;
        kitty = false;
        niri = false;
        pywalfox = false;
        qt = false;
        spicetify = false;
        telegram = false;
        vicinae = false;
        walker = false;
        wezterm = false;
        yazi = false;
        zed = false;
      };
      ui = {
        tooltipsEnabled = true;
        fontDefault = "";
        fontDefaultScale = 1.25;
        fontFixed = "";
        fontFixedScale = 1.25;
        panelBackgroundOpacity = 0.85;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
      };
      wallpaper = {
        enabled = false;
        directory = "";
        enableMultiMonitorDirectories = false;
        fillColor = "#000000";
        fillMode = "crop";
        hideWallpaperFilenames = false;
        monitorDirectories = [];
        overviewEnabled = false;
        panelPosition = "follow_bar";
        randomEnabled = false;
        randomIntervalSec = 300;
        recursiveSearch = false;
        setWallpaperOnAllMonitors = true;
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        transitionType = "random";
        useWallhaven = false;
        wallhavenCategories = "111";
        wallhavenOrder = "desc";
        wallhavenPurity = "100";
        wallhavenQuery = "";
        wallhavenResolutionHeight = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenSorting = "relevance";
      };
    };
  };
}
