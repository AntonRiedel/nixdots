{...}: {
  flake.modules.homeManager.rss = {pkgs, ...}: let
    newsboat-browser = pkgs.writeShellScriptBin "newsboat-browser" ''
      #!/usr/bin/env bash
      # newsboat-browser: route video links to mpv, everything else to brave
      url="$1"

      case "$url" in
        *youtube.com/watch*|*youtube.com/shorts*|*youtu.be/*|*.mp4|*.webm|*.mkv)
          setsid -f ${pkgs.mpv}/bin/mpv --quiet -- "$url" >/dev/null 2>&1 &
          ;;
        *)
          setsid -f ${pkgs.brave}/bin/brave -- "$url" >/dev/null 2>&1 &
          ;;
      esac
    '';
  in {
    home.packages = with pkgs; [
      newsboat
      w3m
      mpv
      yt-dlp
      brave
      newsboat-browser
    ];

    programs.newsboat = {
      enable = true;
      autoReload = true;
      browser = "${newsboat-browser}/bin/newsboat-browser";

      urls = [
        # NEWSFEEDS
        {
          url = "https://static.fsf.org/fsforg/rss/news.xml";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: FSF News";
        }
        {
          url = "https://www.phoronix.com/rss.php";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: Phoronix";
        }
        {
          url = "https://www.zdnet.com/topic/linux/rss.xml";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: ZDNet";
        }
        {
          url = "https://itsfoss.com/feed/";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: It's Foss";
        }
        {
          url = "http://feeds.nature.com/news/rss/news_s13";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: Nature";
        }
        {
          url = "http://feeds.aps.org/rss/recent/physics.xml";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: American Physical Society";
        }
        {
          url = "http://www.tagesschau.de/xml/tagesschau-meldungen/";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: ARD Tagesschau";
        }
        {
          url = "http://www.spiegel.de/schlagzeilen/rss/0,5291,,00.xml";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: Spiegel";
        }
        {
          url = "https://root.cern/feed.xml";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: ROOT";
        }
        {
          url = "https://drewdevault.com/blog/index.xml";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: Drew Devault";
        }
        {
          url = "https://frame.work/de/de/blog.rss";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: Framework";
        }
        {
          url = "https://lwn.net/headlines/newrss";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: LWN";
        }
        {
          url = "https://hnrss.org/frontpage";
          tags = ["NEWSFEED"];
          title = "~NEWSFEED: Hacker News";
        }

        # LBRY
        {
          url = "https://odysee.com/\$/rss/@BrodieRobertson:5";
          tags = ["LBRY"];
          title = "~LBRY: Brodie Robertson";
        }

        # YOUTUBE
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxQKHvKbmSzGMvUrVtJYnUA";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Learn Linux TV";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOWcZ6Wicl-1N34H0zZe38w";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Level1Linux";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4w1YQAJMWOz4qtxinq55LQ";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Level1Tech";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Linus Tech Tips";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3XTzVzaHQEd30rQbuvCtTQ";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Last Week Tonight (John Oliver)";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwWhs_6x42TyRM4Wstoq8HA";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: The Daily Show";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7_gcs09iThXybpVgjHZ_7g";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: PBS Space Time";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzfyYtgvkx5mLy8nlLlayYg";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Vivziepop";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Veritasium";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCY6Ij8zOds0WJEeqCLOnqOQ";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Alex Meyers";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQWHq9e1hN268yjgYq-0hNw";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: QuickyBaby";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjQhd1APsd5NQhiVZV7GYzg";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Official Sabaton Channel";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCaG4CBbZih6nLzD08bTBGfw";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Sabaton History";
        }
        {
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4xJFRySNlu9AgY-u_MtfZw";
          tags = ["YOUTUBE"];
          title = "~YOUTUBE: Nerd Attack";
        }

        # REDDIT (fixed: trailing slash before .rss)
        {
          url = "https://www.reddit.com/r/qutebrowser/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: qutebrowser";
        }
        {
          url = "https://www.reddit.com/r/linux/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: linux";
        }
        {
          url = "https://www.reddit.com/r/commandline/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: commandline";
        }
        {
          url = "https://www.reddit.com/r/linuxmemes/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: linuxmemes";
        }
        {
          url = "https://www.reddit.com/r/linuxhardware/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: linuxhardware";
        }
        {
          url = "https://www.reddit.com/r/archlinux/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: archlinux";
        }
        {
          url = "https://www.reddit.com/r/NixOS/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: nixos";
        }
        {
          url = "https://www.reddit.com/r/zfs/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: zfs";
        }
        {
          url = "https://www.reddit.com/r/neovim/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: Neovim";
        }
        {
          url = "https://www.reddit.com/r/homelab/.rss";
          tags = ["REDDIT"];
          title = "~REDDIT: homelab";
        }

        # NIXOS
        {
          url = "https://weekly.nixos.org/feeds/all.rss";
          tags = ["DISTRO"];
          title = "~NIXOS: Nixos News";
        }

        # ARCHLINUX
        {
          url = "https://www.archlinux.org/feeds/news";
          tags = ["DISTRO"];
          title = "~ARCH: Arch News";
        }

        # ARXIV / PHYSICS
        {
          url = "https://rss.arxiv.org/atom/hep-ex";
          tags = ["PHYSICS"];
          title = "~ARXIV: hep-ex";
        }
        {
          url = "https://rss.arxiv.org/atom/nucl-ex";
          tags = ["PHYSICS"];
          title = "~ARXIV: nucl-ex";
        }
        {
          url = "https://home.cern/api/news/feed.rss";
          tags = ["PHYSICS"];
          title = "~CERN: News";
        }
      ];

      extraConfig = ''
        max-items 1000
        user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0"

        macro w set browser "mpv %u"; open-in-browser; set browser "${newsboat-browser}/bin/newsboat-browser"
        macro b set browser "brave %u"; open-in-browser; set browser "${newsboat-browser}/bin/newsboat-browser"

        bind-key j down
        bind-key k up
        bind-key j next articlelist
        bind-key k prev articlelist
        bind-key J next-feed articlelist
        bind-key K prev-feed articlelist
        bind-key G end
        bind-key g home
        bind-key d pagedown
        bind-key u pageup
        bind-key l open
        bind-key h quit
        bind-key a toggle-article-read
        bind-key n next-unread
        bind-key N prev-unread
        bind-key ; macro-prefix

        confirm-exit yes
        html-renderer "w3m -dump -T text/html"
        highlight article "https?://[^ ]+" blue default underline

        color listnormal cyan default
        color listfocus black yellow standout bold
        color listnormal_unread blue default
        color listfocus_unread green default bold
        color info red black bold
        color article red default
      '';
    };
  };
}
