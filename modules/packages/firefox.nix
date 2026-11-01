# modules/packages/firefox.nix
{...}: {
  flake.modules.homeManager.firefox = {pkgs, ...}: let
    firefoxAddons = pkgs.nur.repos.rycee.firefox-addons;
  in {
    programs.firefox = {
      enable = true;

      # nixpkgs' firefox wrapper still forces MOZ_LEGACY_PROFILES=1, so pin
      # the config path to match what the binary actually reads instead of
      # home-manager's newer XDG-path default.
      configPath = ".mozilla/firefox";

      profiles = {
        work = {
          id = 0;
          isDefault = true;

          settings = {
            # no Firefox Account / Sync on either profile
            "identity.fxaccounts.enabled" = false;
            "browser.toolbars.bookmarks.visibility" = "always";

            # keep browsing history
            "places.history.enabled" = true;
            "browser.privatebrowsing.autostart" = false;

            # don't require manually re-enabling declarative extensions
            "extensions.autoDisableScopes" = 0;
          };

          extensions.packages = with firefoxAddons; [
            ublock-origin
            keepassxc-browser
            darkreader
            privacy-badger
            grammarly
          ];

          bookmarks = {
            force = true;
            settings = [
              {
                toolbar = true;
                bookmarks = [
                  {
                    name = "Useful";
                    bookmarks = [
                      {
                        name = "Wolfram|Alpha";
                        url = "https://www.wolframalpha.com/";
                      }
                      {
                        name = "scihub";
                        url = "https://www.sci-hub.st/";
                      }
                      {
                        name = "LibGen";
                        url = "https://libgen.is/";
                      }
                      {
                        name = "Online LaTeX Equation Editor - create, integrate and download";
                        url = "https://latex.codecogs.com/eqneditor/editor.php";
                      }
                      {
                        name = "FSP Meeting 2024 (8-September 12, 2024): Overview · Indico";
                        url = "https://indico.cern.ch/event/1433919/";
                      }
                      {
                        name = "Online LaTeX Equation Editor";
                        url = "https://latexeditor.lagrida.com/";
                      }
                      {
                        name = "PDGCodes";
                        url = "https://pdg.lbl.gov/2007/reviews/montecarlorpp.pdf";
                      }
                    ];
                  }
                  {
                    name = "Mail";
                    bookmarks = [
                      {
                        name = "xmail";
                        url = "https://xmail.mwn.de/owa/auth/logon.aspx?replaceCurrent=1&url=https%3a%2f%2fxmail.mwn.de%2fowa%2f";
                      }
                    ];
                  }
                  {
                    name = "ALICE";
                    bookmarks = [
                      {
                        name = "Get Journal";
                        url = "javascript:void(location.href='https://tum-eaccess.de/login?url='+location.href)";
                      }
                      {
                        name = "Get Journal (old)";
                        url = "javascript:void(location.href='https://eaccess.ub.tum.de/login?url='+location.href)";
                      }
                      {
                        name = "Monalisa";
                        url = "https://alimonitor.cern.ch/";
                      }
                      {
                        name = "CERN";
                        url = "https://home.cern/";
                      }
                      {
                        name = "ROOT Forum";
                        url = "https://root-forum.cern.ch/";
                      }
                      {
                        name = "AliPhysics";
                        url = "https://github.com/alisw/AliPhysics";
                      }
                      {
                        name = "O2 documentation";
                        url = "https://aliceo2group.github.io/analysis-framework/";
                      }
                      {
                        name = "AliPhysics Documentation";
                        url = "https://alice-doc.github.io/alice-analysis-tutorial/building/build.html";
                      }
                      {
                        name = "CERN Mattermost";
                        url = "https://mattermost.web.cern.ch/login";
                      }
                      {
                        name = "github";
                        url = "https://github.com/";
                      }
                      {
                        name = "ALICE Glance";
                        url = "https://alice-glance.cern.ch/alice/";
                      }
                      {
                        name = "EDH";
                        url = "https://edh.cern.ch/Desktop/dir.jsp";
                      }
                      {
                        name = "Greybook";
                        url = "https://greybook.cern.ch/";
                      }
                      {
                        name = "AliceO2Group/O2Physics";
                        url = "https://github.com/AliceO2Group/O2Physics";
                      }
                      {
                        name = "Indico CERN";
                        url = "https://indico.cern.ch/";
                      }
                      {
                        name = "Get a Grid certificate";
                        url = "https://alice-doc.github.io/alice-analysis-tutorial/start/cert.html";
                      }
                      {
                        name = "Particle Data Group";
                        url = "https://pdg.lbl.gov/";
                      }
                      {
                        name = "e-groups";
                        url = "https://e-groups.cern.ch/e-groups/EgroupsSearchForm.do";
                      }
                      {
                        name = "CCDB Browse";
                        url = "http://alice-ccdb.cern.ch/browse/";
                      }
                      {
                        name = "CCDB object upload";
                        url = "https://alimonitor.cern.ch/ccdb/upload.jsp";
                      }
                      {
                        name = "AliceDPG";
                        url = "https://twiki.cern.ch/twiki/bin/viewauth/ALICE/AliceDPG";
                      }
                      {
                        name = "Data skimming for Run3";
                        url = "https://alice.its.cern.ch/jira/browse/ATO-575";
                      }
                      {
                        name = "Analysis Notes";
                        url = "https://alice-notes.web.cern.ch/Documents/Review";
                      }
                      {
                        name = "CERN Gitlab";
                        url = "https://gitlab.cern.ch/";
                      }
                      {
                        name = "CERN Hotel Reservation";
                        url = "https://edh.cern.ch/Hostel/";
                      }
                      {
                        name = "Launch Meeting - Zoom";
                        url = "https://cern.zoom.us/j/4154304563?pwd=c2NVODh2cDh0MEEzeWxxNVJ4SkFxQT09#success";
                      }
                      {
                        name = "JIRA";
                        url = "https://alice.its.cern.ch/jira/secure/Dashboard.jspa";
                      }
                      {
                        name = "ALICE Collaboration";
                        url = "https://alice-collaboration.web.cern.ch/";
                      }
                      {
                        name = "ALICE data taking Operations";
                        url = "https://alice-operations.docs.cern.ch/";
                      }
                      {
                        name = "CodiMD";
                        url = "https://codimd.web.cern.ch/";
                      }
                      {
                        name = "AliceO2 Bookkeeping";
                        url = "https://ali-bookkeeping.cern.ch/?page=home";
                      }
                      {
                        name = "Monalisa Packages";
                        url = "https://alimonitor.cern.ch/packages/?packagename=CEFP&packagedeps=&cvmfsstatus=&platforms=&submitBt=%BB";
                      }
                      {
                        name = "ALICE Publications";
                        url = "https://alice-publications.web.cern.ch/";
                      }
                    ];
                  }
                  {
                    name = "e12";
                    bookmarks = [
                      {
                        name = "KTAs";
                        url = "https://transfer.ktas.ph.tum.de/";
                      }
                      {
                        name = "Bechtle";
                        url = "https://www.bechtle.com/";
                      }
                      {
                        name = "vSphere";
                        url = "https://tuphzit-vc4.mgmt.ph.tum.de/";
                      }
                      {
                        name = "eduVPN";
                        url = "https://tum.eduvpn.lrz.de/vpn-user-portal/home";
                      }
                      {
                        name = "DocGS";
                        url = "https://www.docgs.tum.de/";
                      }
                      {
                        name = "ADS-Anbindung für Linux";
                        url = "https://wiki.tum.de/pages/viewpage.action?pageId=22577898";
                      }
                      {
                        name = "E12";
                        url = "https://www.ph.nat.tum.de/denseandstrange/members/";
                      }
                      {
                        name = "RvServer2021 < Informatik/Benutzerwiki < Foswiki";
                        url = "https://wiki.in.tum.de/Informatik/Benutzerwiki/RvServer2021";
                      }
                      {
                        name = "tuphzit";
                        url = "https://collab.dvb.bayern/display/TUMtuphzit/tuphzit+Startseite";
                      }
                      {
                        name = "WebDNS";
                        url = "https://webdns.lrz.de:8443/namesurfer/";
                      }
                      {
                        name = "Nagios";
                        url = "http://transfer.ktas.ph.tum.de:8080/nagios/";
                      }
                      {
                        name = "IDM-Portal";
                        url = "https://idmportal2.lrz.de/jidmp/";
                      }
                      {
                        name = "GitLab-ce-lrz";
                        url = "https://gitlab-ce.lrz.de/";
                      }
                      {
                        name = "Webshop";
                        url = "https://webshop.edu-bayern.de/webshop/WebShop_Overview?";
                      }
                      {
                        name = "Patchen";
                        url = "https://nv-tools.mwn.de/login";
                      }
                      {
                        name = "NESSI";
                        url = "https://nessi.lrz.de/NeSSI/";
                      }
                    ];
                  }
                  {
                    name = "Slack";
                    bookmarks = [
                      {
                        name = "MUPA";
                        url = "https://mupagroup.slack.com/?redir=%2Fgantry%2Fclient";
                      }
                      {
                        name = "MPP";
                        url = "https://mppphysics.slack.com/?redir=%2Fgantry%2Fclient";
                      }
                      {
                        name = "Femtoboyz";
                        url = "https://femtoboyz.slack.com/";
                      }
                      {
                        name = "DenseAndStrange";
                        url = "https://denseandstrange.slack.com/?redir=%2Fgantry%2Fclient";
                      }
                    ];
                  }
                  {
                    name = "Tum";
                    bookmarks = [
                      {
                        name = "TUMonline";
                        url = "https://campus.tum.de/tumonline/webnav.ini";
                      }
                      {
                        name = "TUM-Moodle";
                        url = "https://www.moodle.tum.de/";
                      }
                      {
                        name = "CIP-Pool";
                        url = "https://wiki.tum.de/display/tuphcip";
                      }
                      {
                        name = "Webdisk";
                        url = "https://webdisk.ads.mwn.de/Default.aspx?ReturnUrl=%2f";
                      }
                      {
                        name = "LRZ_Gitlab";
                        url = "https://gitlab.lrz.de/users/sign_in";
                      }
                      {
                        name = "MWN Teiladminportal";
                        url = "https://tap.ads.mwn.de/login";
                      }
                      {
                        name = "cuda";
                        url = "https://users.ph.tum.de/srecksie/lehre/cuda.html";
                      }
                      {
                        name = "LRZ Sync+Share";
                        url = "https://syncandshare.lrz.de/login";
                      }
                      {
                        name = "Office";
                        url = "https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=8c59ead7-d703-4a27-9e55-c96a0054c8d2&redirect_uri=https%3A%2F%2Fmyaccount.microsoft.com&scope=openid+profile+email+offline_access&response_type=code&response_mode=fragment&code_challenge=kbKfWmbuqi_qn-5ANbHRidufrf0pM5RxD62o9_ckV34&code_challenge_method=S256&state=37f2182d-2238-4b28-8418-63cf94e4b41e";
                      }
                      {
                        name = "eduVPN";
                        url = "https://tum.eduvpn.lrz.de/";
                      }
                      {
                        name = "TUM Microsoft";
                        url = "https://myaccount.microsoft.com/";
                      }
                      {
                        name = "TUM Zoom";
                        url = "https://tum-conf.zoom.us/";
                      }
                    ];
                  }
                  {
                    name = "TEMP";
                    bookmarks = [
                      {
                        name = "AliceO2WP14AF < ALICE < TWiki";
                        url = "https://twiki.cern.ch/twiki/bin/viewauth/ALICE/AliceO2WP14AF";
                      }
                      {
                        name = "Service Work for Juniors - Flash Talks (September 14, 2022) · Indico";
                        url = "https://indico.cern.ch/event/1196611/";
                      }
                      {
                        name = "FEMTOSCOPY IN RELATIVISTIC HEAVY ION COLLISIONS: Two Decades of Progress | Annual Review of Nuclear and Particle Science";
                        url = "https://www.annualreviews.org/doi/abs/10.1146/annurev.nucl.55.090704.151533";
                      }
                      {
                        name = "Demystifying the QCD Vacuum - Part 1 - The Standard Story - Jakob Schwichtenberg";
                        url = "http://jakobschwichtenberg.com/demystifying-the-qcd-vacuum-part-1/";
                      }
                      {
                        name = "Bergamo Days (19-September 22, 2023): Overview · TUM Physikdepartment (Indico)";
                        url = "https://indico.ph.tum.de/event/7428/";
                      }
                      {
                        name = "Triggering Discoveries in High Energy Physics III, High Tatras (9-December 13, 2024): Overview · Indico";
                        url = "https://indico.cern.ch/event/1361472/";
                      }
                      {
                        name = "54. Arbeitstreffen Kernphysik 2025 (20-February 27, 2025): Schleching · Indico Global";
                        url = "https://indico.global/event/6581/page/1341-schleching";
                      }
                      {
                        name = "Installing O2 and O2Physics · ALICE O2 documentation";
                        url = "https://aliceo2group.github.io/analysis-framework/docs/gettingstarted/installing.html?highlight=rebuild";
                      }
                      {
                        name = "FSP Meeting 2025 (August 31, 2025 - September 4, 2025): Overview · Indico";
                        url = "https://indico.cern.ch/event/1547695/";
                      }
                      {
                        name = "Gruppenmanagement - Mengendefinitionen - TUMonline - Technische Universität München";
                        url = "https://campus.tum.de/tumonline/pl/ui/$ctx/webnav.ini?pUrl=!wbMng.listAll%3FpOrgNr%3D21512";
                      }
                      {
                        name = "TUM E62 - CERN Excursion 2026 (10-February 12, 2026): Timetable · Indico";
                        url = "https://indico.cern.ch/event/1604742/timetable/#all";
                      }
                    ];
                  }
                  {
                    name = "ALICE shifts";
                    bookmarks = [
                      {
                        name = "ALICE DCS CONTROLS workspace";
                        url = "https://espace.cern.ch/alicecontrols/SitePages/Home.aspx";
                      }
                      {
                        name = "SLIMOS Training";
                        url = "https://alice-operations.docs.cern.ch/Training_slides/SLIMOS/";
                      }
                      {
                        name = "SRC Display";
                        url = "https://alice-glance.cern.ch/alice/sams/public/src-display";
                      }
                      {
                        name = "EN_SLIMOS_Module 8_CSAM.pdf - Google Drive";
                        url = "https://drive.google.com/file/d/1C8x9bUraJ2oGdGpsYhvCStc5V8DgdVBd/view";
                      }
                      {
                        name = "DAILY SHIFT INSTRUCTIONS";
                        url = "https://alice-operations.docs.cern.ch/Daily_Instructions/Daily_Instructions/";
                      }
                      {
                        name = "Trigger · Indico";
                        url = "https://indico.cern.ch/category/2338/";
                      }
                    ];
                  }
                  {
                    name = "Analysis Notes";
                    bookmarks = [
                      {
                        name = "Transverse mass dependence of the pp and pΛ correlation functions in high-multiplicity pp collisions at 13 TeV | Public & Analysis Notes";
                        url = "https://alice-notes.web.cern.ch/node/1378";
                      }
                      {
                        name = "p–Λ femtoscopy in high multiplicity events in pp collisions at √s=13 TeV | Public & Analysis Notes";
                        url = "https://alice-notes.web.cern.ch/node/900";
                      }
                      {
                        name = "p-p, p-Λ, p-Ξ and Λ-Λ correlations studied via femtoscopy in pp reactions at √s=13 TeV";
                        url = "https://alice-notes.web.cern.ch/node/738";
                      }
                      {
                        name = "Three-body femtoscopy: p-p-p and p-p-Λ in pp collisions at √s=13TeV | Public & Analysis Notes";
                        url = "https://alice-notes.web.cern.ch/node/1153";
                      }
                      {
                        name = "p–p and p–Λ femtoscopy in pp collisions at √s = 13.6 TeV | Public & Analysis Notes";
                        url = "https://alice-notes.web.cern.ch/node/1429";
                      }
                      {
                        name = "p-d and Λ-d correlations in high-multiplicity pp collisions at √s = 13 TeV";
                        url = "https://alice-notes.web.cern.ch/node/1158";
                      }
                      {
                        name = "p-p femtoscopy in pp High Multiplicity Reactions at 13 TeV | Public & Analysis Notes";
                        url = "https://alice-notes.web.cern.ch/node/891";
                      }
                    ];
                  }
                  {
                    name = "Publications";
                    bookmarks = [
                      {
                        name = "[2104.04427] Exploring the NΛ-NΣ coupled system with high precision correlation techniques at the LHC";
                        url = "https://arxiv.org/abs/2104.04427";
                      }
                      {
                        name = "[1905.07209] Study of the Λ-Λ interaction with femtoscopy correlations in pp and p-Pb collisions at the LHC";
                        url = "https://arxiv.org/abs/1905.07209";
                      }
                      {
                        name = "Study of the Λ-Λ interaction with femtoscopy correlations in pp and p-Pb collisions at the LHC - INSPIRE";
                        url = "https://inspirehep.net/literature/1735349";
                      }
                      {
                        name = "ppp and ppL";
                        url = "https://arxiv.org/pdf/2206.03344.pdf";
                      }
                      {
                        name = "pp and pL in Run2";
                        url = "https://inspirehep.net/literature/1791631";
                      }
                      {
                        name = "QM23_FlashTalk.pdf";
                        url = "file:///home/anton/Downloads/QM23_FlashTalk.pdf";
                      }
                      {
                        name = "pd";
                        url = "https://arxiv.org/abs/2308.16120";
                      }
                      {
                        name = "[2005.05012] Exploring the Λ-deuteron interaction via correlations in heavy-ion collisions";
                        url = "https://arxiv.org/abs/2005.05012";
                      }
                      {
                        name = "[2305.08441] Novel model for particle emission in small collision systems";
                        url = "https://arxiv.org/abs/2305.08441";
                      }
                      {
                        name = "Proton-Omega";
                        url = "https://www.nature.com/articles/s41586-020-3001-6";
                      }
                      {
                        name = "Recent results on femtoscopic correlations with the CMS experiment";
                        url = "https://arxiv.org/abs/2211.13770";
                      }
                      {
                        name = "Common femtoscopic hadron-emission source in pp collisions at the LHC";
                        url = "https://arxiv.org/abs/2311.14527";
                      }
                      {
                        name = "NN Potentials";
                        url = "https://arxiv.org/pdf/1306.5687";
                      }
                    ];
                  }
                  {
                    name = "GSI";
                    bookmarks = [
                      {
                        name = "Cluster User Manual";
                        url = "https://hpc.gsi.de/virgo/preface.html";
                      }
                    ];
                  }
                  {
                    name = "QC";
                    bookmarks = [
                      {
                        name = "TPC QC To-Do - CodiMD";
                        url = "https://codimd.web.cern.ch/EzYrN_P-Ts2nhXFKc-KsgA#";
                      }
                      {
                        name = "CCDB test";
                        url = "http://ccdb-test.cern.ch:8080/browse/qc/TPC/";
                      }
                      {
                        name = "QC Bible";
                        url = "https://its.cern.ch/jira/browse/ATO-489";
                      }
                      {
                        name = "QCG";
                        url = "https://qcg-test.cern.ch/?page=objectTree";
                      }
                    ];
                  }
                  {
                    name = "Figures";
                    bookmarks = [
                      {
                        name = "integrated luminosity in pp @ 13.6 TeV";
                        url = "https://alice-figure.web.cern.ch/node/37226";
                      }
                      {
                        name = "Pd";
                        url = "https://alice-figure.web.cern.ch/node/34404";
                      }
                      {
                        name = "Ld1";
                        url = "https://alice-figure.web.cern.ch/node/34405";
                      }
                      {
                        name = "Ld2";
                        url = "https://alice-figure.web.cern.ch/node/34407";
                      }
                      {
                        name = "O2DPG/MC/config/PWGLF/pythia8 at master · AliceO2Group/O2DPG · GitHub";
                        url = "https://github.com/AliceO2Group/O2DPG/tree/master/MC/config/PWGLF/pythia8";
                      }
                    ];
                  }
                ];
              }
              {
                name = "mattermost clien app redirect form browser not working - Google Suche";
                url = "https://www.google.com/search?client=firefox-b-d&channel=entpr&q=mattermost+clien+app+redirect+form+browser+not+working&sei=2xYraYCbGu_lxc8P4vvHsAI";
              }
              {
                name = "Charged particle multiplicity with pair triggers - Claude";
                url = "https://claude.ai/chat/30386726-ffa6-47f4-b02f-5cdc5b37a014";
              }
            ];
          };
        };

        personal = {
          id = 1;
          isDefault = false;

          settings = {
            # no Firefox Account / Sync on either profile
            "identity.fxaccounts.enabled" = false;
            "browser.toolbars.bookmarks.visibility" = "always";

            # don't require manually re-enabling declarative extensions
            "extensions.autoDisableScopes" = 0;
          };

          extensions.packages = with firefoxAddons; [
            ublock-origin
            keepassxc-browser
            darkreader
            privacy-badger
          ];

          bookmarks = {
            force = true;
            settings = [
              {
                toolbar = true;
                bookmarks = [
                  {
                    name = "Useful";
                    bookmarks = [
                      {
                        name = "indeed.com";
                        url = "https://de.indeed.com/?r=us";
                      }
                      {
                        name = "10FastFingers";
                        url = "https://10fastfingers.com/typing-test/english";
                      }
                      {
                        name = "ChatGPT";
                        url = "https://chat.openai.com/chat";
                      }
                      {
                        name = "Regex";
                        url = "https://regexr.com/";
                      }
                      {
                        name = "Blumenkohl-Pizza (Low Carb) | NDR.de - Ratgeber - Kochen - Rezepte";
                        url = "https://www.ndr.de/ratgeber/kochen/rezepte/Blumenkohl-Pizza,rezept1870.html";
                      }
                      {
                        name = "A Terminal Email Client As An Alternative To Gmail: The Old Dog Neomutt And Pals";
                        url = "https://seniormars.com/posts/neomutt/";
                      }
                      {
                        name = "Structuring Your Project — The Hitchhiker's Guide to Python";
                        url = "https://docs.python-guide.org/writing/structure/";
                      }
                      {
                        name = "10 CLI Tools That Made the Biggest Impact On Transforming My Terminal-Based Workflow : r/commandline";
                        url = "https://www.reddit.com/r/commandline/comments/1epjppl/10_cli_tools_that_made_the_biggest_impact_on/";
                      }
                      {
                        name = "GitHub - jlevy/the-art-of-command-line: Master the command line, in one page";
                        url = "https://github.com/jlevy/the-art-of-command-line";
                      }
                      {
                        name = "NixOS Wiki - NixOS Wiki";
                        url = "https://wiki.nixos.org/wiki/NixOS_Wiki";
                      }
                      {
                        name = "Watch TV Online Streaming | Watch Free Movies Online";
                        url = "https://dopebox.to/";
                      }
                      {
                        name = "Multi-Container Neovim Development Environments with Incus (x-post from nvim) : r/commandline";
                        url = "https://www.reddit.com/r/commandline/comments/1eyuoul/multicontainer_neovim_development_environments/";
                      }
                      {
                        name = "my-nixos/hm-modules/ide.nix at master · ahbk/my-nixos · GitHub";
                        url = "https://github.com/ahbk/my-nixos/blob/master/hm-modules/ide.nix#L59";
                      }
                      {
                        name = "NixOS-System/flake.nix at main · knosence/NixOS-System · GitHub";
                        url = "https://github.com/knosence/NixOS-System/blob/main/flake.nix";
                      }
                      {
                        name = "How to Handle Multiple Git Accounts | by Russell Brown | Expedia Group Technology | Medium";
                        url = "https://medium.com/expedia-group-tech/how-to-handle-multiple-git-accounts-385afe430d5a";
                      }
                      {
                        name = "srush/GPU-Puzzles: Solve puzzles. Learn CUDA.";
                        url = "https://github.com/srush/GPU-Puzzles";
                      }
                      {
                        name = "AniGo - Free Watch Anime Online, Stream Subbed & Dubbed Anime in HD";
                        url = "https://anigo.to/";
                      }
                      {
                        name = "NixOS Search - Packages - latexindent";
                        url = "https://search.nixos.org/packages?channel=25.11&query=latexindent#show=texliveFull";
                      }
                      {
                        name = "Aniwave";
                        url = "https://aniwaves.ru/";
                      }
                      {
                        name = "Supported Devices and Features · linux-surface/linux-surface Wiki · GitHub";
                        url = "https://github.com/linux-surface/linux-surface/wiki/Supported-Devices-and-Features#feature-matrix";
                      }
                      {
                        name = "Learn Neovim The Practical Way. All articles on how to configure and… | by alpha2phi | Medium";
                        url = "https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a";
                      }
                      {
                        name = "GitHub - Misterio77/nix-starter-configs: Simple and documented config templates to help you get started with NixOS + home-manager + flakes. All the boilerplate you need!";
                        url = "https://github.com/Misterio77/nix-starter-configs";
                      }
                    ];
                  }
                  {
                    name = "Mail";
                    bookmarks = [
                      {
                        name = "hotmail";
                        url = "https://outlook.live.com/owa/";
                      }
                      {
                        name = "Protonmail";
                        url = "https://protonmail.com/";
                      }
                    ];
                  }
                  {
                    name = "Home";
                    bookmarks = [
                      {
                        name = "Nextcloud";
                        url = "https://nextcloud.gemstones.crabdance.com/index.php/login";
                      }
                      {
                        name = "FreeDNS";
                        url = "https://freedns.afraid.org/";
                      }
                      {
                        name = "NoIP";
                        url = "https://www.noip.com/";
                      }
                      {
                        name = "pihole";
                        url = "http://diamond.nudel.lan:6001/admin/";
                      }
                      {
                        name = "comdirect";
                        url = "https://www.comdirect.de/cms/ueberuns/en/unternehmen/index.html";
                      }
                      {
                        name = "jnovels";
                        url = "https://jnovels.com/";
                      }
                      {
                        name = "WifiExtender";
                        url = "http://mywifiext.net/start.html";
                      }
                      {
                        name = "eduvpn";
                        url = "https://login.tum.de/idp/profile/SAML2/Redirect/SSO?execution=e1s1";
                      }
                      {
                        name = "D&D Beyond";
                        url = "https://www.dndbeyond.com/";
                      }
                      {
                        name = "FRITZ!Box";
                        url = "http://fritz.nudel.lan/";
                      }
                      {
                        name = "pihole";
                        url = "https://pihole.nudel.lan/admin/login";
                      }
                    ];
                  }
                ];
              }
              {
                name = "Fitting The NEW Cab & Welding the Front End! | Franna Crane Project | Part 24 - YouTube";
                url = "https://www.youtube.com/watch?v=GjHZ2oLZwZ8";
              }
            ];
          };
        };
      };
    };
  };
}
