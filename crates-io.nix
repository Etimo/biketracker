{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# MacTypes-sys-2.1.0

  crates.MacTypes_sys."2.1.0" = deps: { features?(features_.MacTypes_sys."2.1.0" deps {}) }: buildRustCrate {
    crateName = "MacTypes-sys";
    version = "2.1.0";
    authors = [ "George Burton <burtonageo@gmail.com>" ];
    sha256 = "03d1dkb1978pk5qqa5yrp5dr6vbnicmvpyw40rv0b8rva1bqnip8";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."MacTypes_sys"."2.1.0"."libc"}" deps)
    ]);
    features = mkFeatures (features."MacTypes_sys"."2.1.0" or {});
  };
  features_.MacTypes_sys."2.1.0" = deps: f: updateFeatures f (rec {
    MacTypes_sys = fold recursiveUpdate {} [
      { "2.1.0".default = (f.MacTypes_sys."2.1.0".default or true); }
      { "2.1.0".use_std =
        (f.MacTypes_sys."2.1.0".use_std or false) ||
        (f.MacTypes_sys."2.1.0".default or false) ||
        (MacTypes_sys."2.1.0"."default" or false); }
    ];
    libc = fold recursiveUpdate {} [
      { "${deps.MacTypes_sys."2.1.0".libc}"."use_std" =
        (f.libc."${deps.MacTypes_sys."2.1.0".libc}"."use_std" or false) ||
        (MacTypes_sys."2.1.0"."use_std" or false) ||
        (f."MacTypes_sys"."2.1.0"."use_std" or false); }
      { "${deps.MacTypes_sys."2.1.0".libc}".default = (f.libc."${deps.MacTypes_sys."2.1.0".libc}".default or false); }
    ];
  }) [
    (features_.libc."${deps."MacTypes_sys"."2.1.0"."libc"}" deps)
  ];


# end
# adler32-1.0.3

  crates.adler32."1.0.3" = deps: { features?(features_.adler32."1.0.3" deps {}) }: buildRustCrate {
    crateName = "adler32";
    version = "1.0.3";
    authors = [ "Remi Rampin <remirampin@gmail.com>" ];
    sha256 = "1z3mvjgw02mbqk98kizzibrca01d5wfkpazsrp3vkkv3i56pn6fb";
  };
  features_.adler32."1.0.3" = deps: f: updateFeatures f (rec {
    adler32."1.0.3".default = (f.adler32."1.0.3".default or true);
  }) [];


# end
# aho-corasick-0.6.9

  crates.aho_corasick."0.6.9" = deps: { features?(features_.aho_corasick."0.6.9" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.6.9";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1lj20py6bvw3y7m9n2nqh0mkshfl1kjfp72lfika9gpkrp2r204l";
    libName = "aho_corasick";
    crateBin =
      [{  name = "aho-corasick-dot";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.6.9"."memchr"}" deps)
    ]);
  };
  features_.aho_corasick."0.6.9" = deps: f: updateFeatures f (rec {
    aho_corasick."0.6.9".default = (f.aho_corasick."0.6.9".default or true);
    memchr."${deps.aho_corasick."0.6.9".memchr}".default = true;
  }) [
    (features_.memchr."${deps."aho_corasick"."0.6.9"."memchr"}" deps)
  ];


# end
# andrew-0.1.6

  crates.andrew."0.1.6" = deps: { features?(features_.andrew."0.1.6" deps {}) }: buildRustCrate {
    crateName = "andrew";
    version = "0.1.6";
    authors = [ "Lucas Timmins <timmins.s.lucas@gmail.com>" ];
    sha256 = "13ic7x6a4p74ci8pw991dx1ya7hfsf58ws2zhalb5h87yi6nxv7z";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."andrew"."0.1.6"."bitflags"}" deps)
      (crates."line_drawing"."${deps."andrew"."0.1.6"."line_drawing"}" deps)
      (crates."rusttype"."${deps."andrew"."0.1.6"."rusttype"}" deps)
      (crates."walkdir"."${deps."andrew"."0.1.6"."walkdir"}" deps)
      (crates."xdg"."${deps."andrew"."0.1.6"."xdg"}" deps)
      (crates."xml_rs"."${deps."andrew"."0.1.6"."xml_rs"}" deps)
    ]);
  };
  features_.andrew."0.1.6" = deps: f: updateFeatures f (rec {
    andrew."0.1.6".default = (f.andrew."0.1.6".default or true);
    bitflags."${deps.andrew."0.1.6".bitflags}".default = true;
    line_drawing."${deps.andrew."0.1.6".line_drawing}".default = true;
    rusttype."${deps.andrew."0.1.6".rusttype}".default = true;
    walkdir."${deps.andrew."0.1.6".walkdir}".default = true;
    xdg."${deps.andrew."0.1.6".xdg}".default = true;
    xml_rs."${deps.andrew."0.1.6".xml_rs}".default = true;
  }) [
    (features_.bitflags."${deps."andrew"."0.1.6"."bitflags"}" deps)
    (features_.line_drawing."${deps."andrew"."0.1.6"."line_drawing"}" deps)
    (features_.rusttype."${deps."andrew"."0.1.6"."rusttype"}" deps)
    (features_.walkdir."${deps."andrew"."0.1.6"."walkdir"}" deps)
    (features_.xdg."${deps."andrew"."0.1.6"."xdg"}" deps)
    (features_.xml_rs."${deps."andrew"."0.1.6"."xml_rs"}" deps)
  ];


# end
# android_glue-0.2.3

  crates.android_glue."0.2.3" = deps: { features?(features_.android_glue."0.2.3" deps {}) }: buildRustCrate {
    crateName = "android_glue";
    version = "0.2.3";
    authors = [ "Pierre Krieger <pierre.krieger1708@gmail.com>" ];
    sha256 = "15d093f7am93g0bkyk16h011lwn64ppzqmsw898w4ks4j7c3xfkn";
  };
  features_.android_glue."0.2.3" = deps: f: updateFeatures f (rec {
    android_glue."0.2.3".default = (f.android_glue."0.2.3".default or true);
  }) [];


# end
# antidote-1.0.0

  crates.antidote."1.0.0" = deps: { features?(features_.antidote."1.0.0" deps {}) }: buildRustCrate {
    crateName = "antidote";
    version = "1.0.0";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1x2wgaw603jcjwsfvc8s2rpaqjv0aqj8mvws2ahhkvfnwkdf7icw";
  };
  features_.antidote."1.0.0" = deps: f: updateFeatures f (rec {
    antidote."1.0.0".default = (f.antidote."1.0.0".default or true);
  }) [];


# end
# approx-0.3.1

  crates.approx."0.3.1" = deps: { features?(features_.approx."0.3.1" deps {}) }: buildRustCrate {
    crateName = "approx";
    version = "0.3.1";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" ];
    sha256 = "1r3rk6s7n22mq633ak7iyfmga3jjbcx747bksr2li7mm423g5fna";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."approx"."0.3.1"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."approx"."0.3.1" or {});
  };
  features_.approx."0.3.1" = deps: f: updateFeatures f (rec {
    approx = fold recursiveUpdate {} [
      { "0.3.1".default = (f.approx."0.3.1".default or true); }
      { "0.3.1".std =
        (f.approx."0.3.1".std or false) ||
        (f.approx."0.3.1".default or false) ||
        (approx."0.3.1"."default" or false); }
    ];
    num_traits."${deps.approx."0.3.1".num_traits}".default = true;
  }) [
    (features_.num_traits."${deps."approx"."0.3.1"."num_traits"}" deps)
  ];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
      { "0.4.10".serde =
        (f.arrayvec."0.4.10".serde or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10".std =
        (f.arrayvec."0.4.10".std or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# autocfg-0.1.2

  crates.autocfg."0.1.2" = deps: { features?(features_.autocfg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.2";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "0dv81dwnp1al3j4ffz007yrjv4w1c7hw09gnf0xs3icxiw6qqfs3";
  };
  features_.autocfg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."0.1.2".default = (f.autocfg."0.1.2".default or true);
  }) [];


# end
# backtrace-0.3.13

  crates.backtrace."0.3.13" = deps: { features?(features_.backtrace."0.3.13" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.13";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "The Rust Project Developers" ];
    sha256 = "1xx0vjdih9zqj6vp8l69n0f213wmif5471prgpkp24jbzxndvb1v";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.13"."cfg_if"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.13"."rustc_demangle"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "fuchsia") && !(kernel == "emscripten") && !(kernel == "darwin") && !(kernel == "ios") then mapFeatures features ([
    ]
      ++ (if features.backtrace."0.3.13".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.13".backtrace_sys}" deps) ] else [])) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."backtrace"."0.3.13"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."backtrace"."0.3.13"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.13"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.13" or {});
  };
  features_.backtrace."0.3.13" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.13".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.13".addr2line =
        (f.backtrace."0.3.13".addr2line or false) ||
        (f.backtrace."0.3.13".gimli-symbolize or false) ||
        (backtrace."0.3.13"."gimli-symbolize" or false); }
      { "0.3.13".backtrace-sys =
        (f.backtrace."0.3.13".backtrace-sys or false) ||
        (f.backtrace."0.3.13".libbacktrace or false) ||
        (backtrace."0.3.13"."libbacktrace" or false); }
      { "0.3.13".coresymbolication =
        (f.backtrace."0.3.13".coresymbolication or false) ||
        (f.backtrace."0.3.13".default or false) ||
        (backtrace."0.3.13"."default" or false); }
      { "0.3.13".dbghelp =
        (f.backtrace."0.3.13".dbghelp or false) ||
        (f.backtrace."0.3.13".default or false) ||
        (backtrace."0.3.13"."default" or false); }
      { "0.3.13".default = (f.backtrace."0.3.13".default or true); }
      { "0.3.13".dladdr =
        (f.backtrace."0.3.13".dladdr or false) ||
        (f.backtrace."0.3.13".default or false) ||
        (backtrace."0.3.13"."default" or false); }
      { "0.3.13".findshlibs =
        (f.backtrace."0.3.13".findshlibs or false) ||
        (f.backtrace."0.3.13".gimli-symbolize or false) ||
        (backtrace."0.3.13"."gimli-symbolize" or false); }
      { "0.3.13".gimli =
        (f.backtrace."0.3.13".gimli or false) ||
        (f.backtrace."0.3.13".gimli-symbolize or false) ||
        (backtrace."0.3.13"."gimli-symbolize" or false); }
      { "0.3.13".libbacktrace =
        (f.backtrace."0.3.13".libbacktrace or false) ||
        (f.backtrace."0.3.13".default or false) ||
        (backtrace."0.3.13"."default" or false); }
      { "0.3.13".libunwind =
        (f.backtrace."0.3.13".libunwind or false) ||
        (f.backtrace."0.3.13".default or false) ||
        (backtrace."0.3.13"."default" or false); }
      { "0.3.13".memmap =
        (f.backtrace."0.3.13".memmap or false) ||
        (f.backtrace."0.3.13".gimli-symbolize or false) ||
        (backtrace."0.3.13"."gimli-symbolize" or false); }
      { "0.3.13".object =
        (f.backtrace."0.3.13".object or false) ||
        (f.backtrace."0.3.13".gimli-symbolize or false) ||
        (backtrace."0.3.13"."gimli-symbolize" or false); }
      { "0.3.13".rustc-serialize =
        (f.backtrace."0.3.13".rustc-serialize or false) ||
        (f.backtrace."0.3.13".serialize-rustc or false) ||
        (backtrace."0.3.13"."serialize-rustc" or false); }
      { "0.3.13".serde =
        (f.backtrace."0.3.13".serde or false) ||
        (f.backtrace."0.3.13".serialize-serde or false) ||
        (backtrace."0.3.13"."serialize-serde" or false); }
      { "0.3.13".serde_derive =
        (f.backtrace."0.3.13".serde_derive or false) ||
        (f.backtrace."0.3.13".serialize-serde or false) ||
        (backtrace."0.3.13"."serialize-serde" or false); }
      { "0.3.13".std =
        (f.backtrace."0.3.13".std or false) ||
        (f.backtrace."0.3.13".default or false) ||
        (backtrace."0.3.13"."default" or false) ||
        (f.backtrace."0.3.13".libbacktrace or false) ||
        (backtrace."0.3.13"."libbacktrace" or false); }
    ];
    backtrace_sys."${deps.backtrace."0.3.13".backtrace_sys}".default = true;
    cfg_if."${deps.backtrace."0.3.13".cfg_if}".default = true;
    libc."${deps.backtrace."0.3.13".libc}".default = (f.libc."${deps.backtrace."0.3.13".libc}".default or false);
    rustc_demangle."${deps.backtrace."0.3.13".rustc_demangle}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.13".winapi}"."dbghelp" = true; }
      { "${deps.backtrace."0.3.13".winapi}"."minwindef" = true; }
      { "${deps.backtrace."0.3.13".winapi}"."processthreadsapi" = true; }
      { "${deps.backtrace."0.3.13".winapi}"."winnt" = true; }
      { "${deps.backtrace."0.3.13".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."backtrace"."0.3.13"."cfg_if"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.13"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.13"."autocfg"}" deps)
    (features_.backtrace_sys."${deps."backtrace"."0.3.13"."backtrace_sys"}" deps)
    (features_.libc."${deps."backtrace"."0.3.13"."libc"}" deps)
    (features_.winapi."${deps."backtrace"."0.3.13"."winapi"}" deps)
  ];


# end
# backtrace-sys-0.1.28

  crates.backtrace_sys."0.1.28" = deps: { features?(features_.backtrace_sys."0.1.28" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.28";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1bbw8chs0wskxwzz7f3yy7mjqhyqj8lslq8pcjw1rbd2g23c34xl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
    ]);
  };
  features_.backtrace_sys."0.1.28" = deps: f: updateFeatures f (rec {
    backtrace_sys."0.1.28".default = (f.backtrace_sys."0.1.28".default or true);
    cc."${deps.backtrace_sys."0.1.28".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.28".libc}".default = (f.libc."${deps.backtrace_sys."0.1.28".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
  ];


# end
# base64-0.10.1

  crates.base64."0.10.1" = deps: { features?(features_.base64."0.10.1" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.10.1";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "1zz3jq619hahla1f70ra38818b5n8cp4iilij81i90jq6z7hlfhg";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.10.1"."byteorder"}" deps)
    ]);
  };
  features_.base64."0.10.1" = deps: f: updateFeatures f (rec {
    base64."0.10.1".default = (f.base64."0.10.1".default or true);
    byteorder."${deps.base64."0.10.1".byteorder}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.10.1"."byteorder"}" deps)
  ];


# end
# bitflags-1.0.4

  crates.bitflags."1.0.4" = deps: { features?(features_.bitflags."1.0.4" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.0.4";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1g1wmz2001qmfrd37dnd5qiss5njrw26aywmg6yhkmkbyrhjxb08";
    features = mkFeatures (features."bitflags"."1.0.4" or {});
  };
  features_.bitflags."1.0.4" = deps: f: updateFeatures f (rec {
    bitflags."1.0.4".default = (f.bitflags."1.0.4".default or true);
  }) [];


# end
# block-0.1.6

  crates.block."0.1.6" = deps: { features?(features_.block."0.1.6" deps {}) }: buildRustCrate {
    crateName = "block";
    version = "0.1.6";
    authors = [ "Steven Sheldon" ];
    sha256 = "1hwfh5992ya0dsbn1ldrlbbdi2a8fqmnvdnla5rdbnd4g2bsc6q5";
  };
  features_.block."0.1.6" = deps: f: updateFeatures f (rec {
    block."0.1.6".default = (f.block."0.1.6".default or true);
  }) [];


# end
# block-buffer-0.7.0

  crates.block_buffer."0.7.0" = deps: { features?(features_.block_buffer."0.7.0" deps {}) }: buildRustCrate {
    crateName = "block-buffer";
    version = "0.7.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "06m0nbam681zjqsy4j2k3jnvjpwhhgrg2rplzwcnkglbjqf125f9";
    dependencies = mapFeatures features ([
      (crates."block_padding"."${deps."block_buffer"."0.7.0"."block_padding"}" deps)
      (crates."byte_tools"."${deps."block_buffer"."0.7.0"."byte_tools"}" deps)
      (crates."byteorder"."${deps."block_buffer"."0.7.0"."byteorder"}" deps)
      (crates."generic_array"."${deps."block_buffer"."0.7.0"."generic_array"}" deps)
    ]);
  };
  features_.block_buffer."0.7.0" = deps: f: updateFeatures f (rec {
    block_buffer."0.7.0".default = (f.block_buffer."0.7.0".default or true);
    block_padding."${deps.block_buffer."0.7.0".block_padding}".default = true;
    byte_tools."${deps.block_buffer."0.7.0".byte_tools}".default = true;
    byteorder."${deps.block_buffer."0.7.0".byteorder}".default = (f.byteorder."${deps.block_buffer."0.7.0".byteorder}".default or false);
    generic_array."${deps.block_buffer."0.7.0".generic_array}".default = true;
  }) [
    (features_.block_padding."${deps."block_buffer"."0.7.0"."block_padding"}" deps)
    (features_.byte_tools."${deps."block_buffer"."0.7.0"."byte_tools"}" deps)
    (features_.byteorder."${deps."block_buffer"."0.7.0"."byteorder"}" deps)
    (features_.generic_array."${deps."block_buffer"."0.7.0"."generic_array"}" deps)
  ];


# end
# block-padding-0.1.3

  crates.block_padding."0.1.3" = deps: { features?(features_.block_padding."0.1.3" deps {}) }: buildRustCrate {
    crateName = "block-padding";
    version = "0.1.3";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0215kqxwgs5bzrpykg86wz3ix77lnci666b724dxb0iln91ch2ag";
    dependencies = mapFeatures features ([
      (crates."byte_tools"."${deps."block_padding"."0.1.3"."byte_tools"}" deps)
    ]);
  };
  features_.block_padding."0.1.3" = deps: f: updateFeatures f (rec {
    block_padding."0.1.3".default = (f.block_padding."0.1.3".default or true);
    byte_tools."${deps.block_padding."0.1.3".byte_tools}".default = true;
  }) [
    (features_.byte_tools."${deps."block_padding"."0.1.3"."byte_tools"}" deps)
  ];


# end
# byte-tools-0.3.1

  crates.byte_tools."0.3.1" = deps: { features?(features_.byte_tools."0.3.1" deps {}) }: buildRustCrate {
    crateName = "byte-tools";
    version = "0.3.1";
    authors = [ "RustCrypto Developers" ];
    sha256 = "01hfp59bxq74glhfmhvm9wma2migq2kfmvcvqq5pssk5k52g8ja0";
  };
  features_.byte_tools."0.3.1" = deps: f: updateFeatures f (rec {
    byte_tools."0.3.1".default = (f.byte_tools."0.3.1".default or true);
  }) [];


# end
# byteorder-1.3.1

  crates.byteorder."1.3.1" = deps: { features?(features_.byteorder."1.3.1" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.1";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1dd46l7fvmxfq90kh6ip1ghsxzzcdybac8f0mh2jivsdv9vy8k4w";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.1" or {});
  };
  features_.byteorder."1.3.1" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.1".default = (f.byteorder."1.3.1".default or true); }
      { "1.3.1".std =
        (f.byteorder."1.3.1".std or false) ||
        (f.byteorder."1.3.1".default or false) ||
        (byteorder."1.3.1"."default" or false); }
    ];
  }) [];


# end
# bytes-0.4.11

  crates.bytes."0.4.11" = deps: { features?(features_.bytes."0.4.11" deps {}) }: buildRustCrate {
    crateName = "bytes";
    version = "0.4.11";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1lk8bnxcd8shiizarf0n6ljmj1542n90jw6lz6i270gxl7rzplmh";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."bytes"."0.4.11"."byteorder"}" deps)
      (crates."iovec"."${deps."bytes"."0.4.11"."iovec"}" deps)
    ]);
    features = mkFeatures (features."bytes"."0.4.11" or {});
  };
  features_.bytes."0.4.11" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "${deps.bytes."0.4.11".byteorder}"."i128" =
        (f.byteorder."${deps.bytes."0.4.11".byteorder}"."i128" or false) ||
        (bytes."0.4.11"."i128" or false) ||
        (f."bytes"."0.4.11"."i128" or false); }
      { "${deps.bytes."0.4.11".byteorder}".default = true; }
    ];
    bytes."0.4.11".default = (f.bytes."0.4.11".default or true);
    iovec."${deps.bytes."0.4.11".iovec}".default = true;
  }) [
    (features_.byteorder."${deps."bytes"."0.4.11"."byteorder"}" deps)
    (features_.iovec."${deps."bytes"."0.4.11"."iovec"}" deps)
  ];


# end
# cc-1.0.28

  crates.cc."1.0.28" = deps: { features?(features_.cc."1.0.28" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.28";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "07harxg2cjw75qvnq637z088w9qaa0hgj0nmcm6yh9in8m2swl19";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.28" or {});
  };
  features_.cc."1.0.28" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.28".default = (f.cc."1.0.28".default or true); }
      { "1.0.28".rayon =
        (f.cc."1.0.28".rayon or false) ||
        (f.cc."1.0.28".parallel or false) ||
        (cc."1.0.28"."parallel" or false); }
    ];
  }) [];


# end
# cfg-if-0.1.6

  crates.cfg_if."0.1.6" = deps: { features?(features_.cfg_if."0.1.6" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.6";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "11qrix06wagkplyk908i3423ps9m9np6c4vbcq81s9fyl244xv3n";
  };
  features_.cfg_if."0.1.6" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.6".default = (f.cfg_if."0.1.6".default or true);
  }) [];


# end
# cgl-0.2.3

  crates.cgl."0.2.3" = deps: { features?(features_.cgl."0.2.3" deps {}) }: buildRustCrate {
    crateName = "cgl";
    version = "0.2.3";
    authors = [ "The Servo Project Developers" ];
    sha256 = "06s75lh01jdrrhk07abirh4cy65z5q4kkphsi7mz6fb4hzv0ygfa";
    dependencies = mapFeatures features ([
      (crates."gleam"."${deps."cgl"."0.2.3"."gleam"}" deps)
      (crates."libc"."${deps."cgl"."0.2.3"."libc"}" deps)
    ]);
  };
  features_.cgl."0.2.3" = deps: f: updateFeatures f (rec {
    cgl."0.2.3".default = (f.cgl."0.2.3".default or true);
    gleam."${deps.cgl."0.2.3".gleam}".default = true;
    libc."${deps.cgl."0.2.3".libc}".default = true;
  }) [
    (features_.gleam."${deps."cgl"."0.2.3"."gleam"}" deps)
    (features_.libc."${deps."cgl"."0.2.3"."libc"}" deps)
  ];


# end
# chrono-0.4.6

  crates.chrono."0.4.6" = deps: { features?(features_.chrono."0.4.6" deps {}) }: buildRustCrate {
    crateName = "chrono";
    version = "0.4.6";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" "Brandon W Maister <quodlibetor@gmail.com>" ];
    sha256 = "0cxgqgf4lknsii1k806dpmzapi2zccjpa350ns5wpb568mij096x";
    dependencies = mapFeatures features ([
      (crates."num_integer"."${deps."chrono"."0.4.6"."num_integer"}" deps)
      (crates."num_traits"."${deps."chrono"."0.4.6"."num_traits"}" deps)
    ]
      ++ (if features.chrono."0.4.6".time or false then [ (crates.time."${deps."chrono"."0.4.6".time}" deps) ] else []));
    features = mkFeatures (features."chrono"."0.4.6" or {});
  };
  features_.chrono."0.4.6" = deps: f: updateFeatures f (rec {
    chrono = fold recursiveUpdate {} [
      { "0.4.6".clock =
        (f.chrono."0.4.6".clock or false) ||
        (f.chrono."0.4.6".default or false) ||
        (chrono."0.4.6"."default" or false); }
      { "0.4.6".default = (f.chrono."0.4.6".default or true); }
      { "0.4.6".time =
        (f.chrono."0.4.6".time or false) ||
        (f.chrono."0.4.6".clock or false) ||
        (chrono."0.4.6"."clock" or false); }
    ];
    num_integer."${deps.chrono."0.4.6".num_integer}".default = (f.num_integer."${deps.chrono."0.4.6".num_integer}".default or false);
    num_traits."${deps.chrono."0.4.6".num_traits}".default = (f.num_traits."${deps.chrono."0.4.6".num_traits}".default or false);
    time."${deps.chrono."0.4.6".time}".default = true;
  }) [
    (features_.num_integer."${deps."chrono"."0.4.6"."num_integer"}" deps)
    (features_.num_traits."${deps."chrono"."0.4.6"."num_traits"}" deps)
    (features_.time."${deps."chrono"."0.4.6"."time"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3".bitflags =
        (f.cloudabi."0.0.3".bitflags or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# cocoa-0.18.4

  crates.cocoa."0.18.4" = deps: { features?(features_.cocoa."0.18.4" deps {}) }: buildRustCrate {
    crateName = "cocoa";
    version = "0.18.4";
    authors = [ "The Servo Project Developers" ];
    sha256 = "1slh4dpvz7h9silsk43jk2k7wq2d0p3yn48jjq60mp3y7dhas756";
    type = [ "rlib" ];
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."cocoa"."0.18.4"."bitflags"}" deps)
      (crates."block"."${deps."cocoa"."0.18.4"."block"}" deps)
      (crates."core_foundation"."${deps."cocoa"."0.18.4"."core_foundation"}" deps)
      (crates."core_graphics"."${deps."cocoa"."0.18.4"."core_graphics"}" deps)
      (crates."foreign_types"."${deps."cocoa"."0.18.4"."foreign_types"}" deps)
      (crates."libc"."${deps."cocoa"."0.18.4"."libc"}" deps)
      (crates."objc"."${deps."cocoa"."0.18.4"."objc"}" deps)
    ]);
  };
  features_.cocoa."0.18.4" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cocoa."0.18.4".bitflags}".default = true;
    block."${deps.cocoa."0.18.4".block}".default = true;
    cocoa."0.18.4".default = (f.cocoa."0.18.4".default or true);
    core_foundation."${deps.cocoa."0.18.4".core_foundation}".default = true;
    core_graphics."${deps.cocoa."0.18.4".core_graphics}".default = true;
    foreign_types."${deps.cocoa."0.18.4".foreign_types}".default = true;
    libc."${deps.cocoa."0.18.4".libc}".default = true;
    objc."${deps.cocoa."0.18.4".objc}".default = true;
  }) [
    (features_.bitflags."${deps."cocoa"."0.18.4"."bitflags"}" deps)
    (features_.block."${deps."cocoa"."0.18.4"."block"}" deps)
    (features_.core_foundation."${deps."cocoa"."0.18.4"."core_foundation"}" deps)
    (features_.core_graphics."${deps."cocoa"."0.18.4"."core_graphics"}" deps)
    (features_.foreign_types."${deps."cocoa"."0.18.4"."foreign_types"}" deps)
    (features_.libc."${deps."cocoa"."0.18.4"."libc"}" deps)
    (features_.objc."${deps."cocoa"."0.18.4"."objc"}" deps)
  ];


# end
# config-0.9.2

  crates.config."0.9.2" = deps: { features?(features_.config."0.9.2" deps {}) }: buildRustCrate {
    crateName = "config";
    version = "0.9.2";
    authors = [ "Ryan Leckey <leckey.ryan@gmail.com>" ];
    sha256 = "18j4aza6z7g0nibb6yfqd88f32bjl8lrcz3jlz7vzjhp10lvc6rr";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."config"."0.9.2"."lazy_static"}" deps)
      (crates."nom"."${deps."config"."0.9.2"."nom"}" deps)
      (crates."serde"."${deps."config"."0.9.2"."serde"}" deps)
    ]
      ++ (if features.config."0.9.2".rust-ini or false then [ (crates.rust_ini."${deps."config"."0.9.2".rust_ini}" deps) ] else [])
      ++ (if features.config."0.9.2".serde-hjson or false then [ (crates.serde_hjson."${deps."config"."0.9.2".serde_hjson}" deps) ] else [])
      ++ (if features.config."0.9.2".serde_json or false then [ (crates.serde_json."${deps."config"."0.9.2".serde_json}" deps) ] else [])
      ++ (if features.config."0.9.2".toml or false then [ (crates.toml."${deps."config"."0.9.2".toml}" deps) ] else [])
      ++ (if features.config."0.9.2".yaml-rust or false then [ (crates.yaml_rust."${deps."config"."0.9.2".yaml_rust}" deps) ] else []));
    features = mkFeatures (features."config"."0.9.2" or {});
  };
  features_.config."0.9.2" = deps: f: updateFeatures f (rec {
    config = fold recursiveUpdate {} [
      { "0.9.2".default = (f.config."0.9.2".default or true); }
      { "0.9.2".hjson =
        (f.config."0.9.2".hjson or false) ||
        (f.config."0.9.2".default or false) ||
        (config."0.9.2"."default" or false); }
      { "0.9.2".ini =
        (f.config."0.9.2".ini or false) ||
        (f.config."0.9.2".default or false) ||
        (config."0.9.2"."default" or false); }
      { "0.9.2".json =
        (f.config."0.9.2".json or false) ||
        (f.config."0.9.2".default or false) ||
        (config."0.9.2"."default" or false); }
      { "0.9.2".rust-ini =
        (f.config."0.9.2".rust-ini or false) ||
        (f.config."0.9.2".ini or false) ||
        (config."0.9.2"."ini" or false); }
      { "0.9.2".serde-hjson =
        (f.config."0.9.2".serde-hjson or false) ||
        (f.config."0.9.2".hjson or false) ||
        (config."0.9.2"."hjson" or false); }
      { "0.9.2".serde_json =
        (f.config."0.9.2".serde_json or false) ||
        (f.config."0.9.2".json or false) ||
        (config."0.9.2"."json" or false); }
      { "0.9.2".toml =
        (f.config."0.9.2".toml or false) ||
        (f.config."0.9.2".default or false) ||
        (config."0.9.2"."default" or false); }
      { "0.9.2".yaml =
        (f.config."0.9.2".yaml or false) ||
        (f.config."0.9.2".default or false) ||
        (config."0.9.2"."default" or false); }
      { "0.9.2".yaml-rust =
        (f.config."0.9.2".yaml-rust or false) ||
        (f.config."0.9.2".yaml or false) ||
        (config."0.9.2"."yaml" or false); }
    ];
    lazy_static."${deps.config."0.9.2".lazy_static}".default = true;
    nom."${deps.config."0.9.2".nom}".default = true;
    rust_ini."${deps.config."0.9.2".rust_ini}".default = true;
    serde."${deps.config."0.9.2".serde}".default = true;
    serde_hjson."${deps.config."0.9.2".serde_hjson}".default = true;
    serde_json."${deps.config."0.9.2".serde_json}".default = true;
    toml."${deps.config."0.9.2".toml}".default = true;
    yaml_rust."${deps.config."0.9.2".yaml_rust}".default = true;
  }) [
    (features_.lazy_static."${deps."config"."0.9.2"."lazy_static"}" deps)
    (features_.nom."${deps."config"."0.9.2"."nom"}" deps)
    (features_.rust_ini."${deps."config"."0.9.2"."rust_ini"}" deps)
    (features_.serde."${deps."config"."0.9.2"."serde"}" deps)
    (features_.serde_hjson."${deps."config"."0.9.2"."serde_hjson"}" deps)
    (features_.serde_json."${deps."config"."0.9.2"."serde_json"}" deps)
    (features_.toml."${deps."config"."0.9.2"."toml"}" deps)
    (features_.yaml_rust."${deps."config"."0.9.2"."yaml_rust"}" deps)
  ];


# end
# conrod_core-0.63.0

  crates.conrod_core."0.63.0" = deps: { features?(features_.conrod_core."0.63.0" deps {}) }: buildRustCrate {
    crateName = "conrod_core";
    version = "0.63.0";
    authors = [ "Mitchell Nordine <mitchell.nordine@gmail.com>" "Sven Nilsen <bvssvni@gmail.com>" ];
    sha256 = "10wk75y1wl1vd94py8rvz33r0cw1nqqvkf09r8is06dv47hkiggq";
    dependencies = mapFeatures features ([
      (crates."conrod_derive"."${deps."conrod_core"."0.63.0"."conrod_derive"}" deps)
      (crates."daggy"."${deps."conrod_core"."0.63.0"."daggy"}" deps)
      (crates."fnv"."${deps."conrod_core"."0.63.0"."fnv"}" deps)
      (crates."num"."${deps."conrod_core"."0.63.0"."num"}" deps)
      (crates."pistoncore_input"."${deps."conrod_core"."0.63.0"."pistoncore_input"}" deps)
      (crates."rusttype"."${deps."conrod_core"."0.63.0"."rusttype"}" deps)
    ]);
  };
  features_.conrod_core."0.63.0" = deps: f: updateFeatures f (rec {
    conrod_core."0.63.0".default = (f.conrod_core."0.63.0".default or true);
    conrod_derive."${deps.conrod_core."0.63.0".conrod_derive}".default = true;
    daggy."${deps.conrod_core."0.63.0".daggy}".default = true;
    fnv."${deps.conrod_core."0.63.0".fnv}".default = true;
    num."${deps.conrod_core."0.63.0".num}".default = true;
    pistoncore_input."${deps.conrod_core."0.63.0".pistoncore_input}".default = true;
    rusttype = fold recursiveUpdate {} [
      { "${deps.conrod_core."0.63.0".rusttype}"."gpu_cache" = true; }
      { "${deps.conrod_core."0.63.0".rusttype}".default = true; }
    ];
  }) [
    (features_.conrod_derive."${deps."conrod_core"."0.63.0"."conrod_derive"}" deps)
    (features_.daggy."${deps."conrod_core"."0.63.0"."daggy"}" deps)
    (features_.fnv."${deps."conrod_core"."0.63.0"."fnv"}" deps)
    (features_.num."${deps."conrod_core"."0.63.0"."num"}" deps)
    (features_.pistoncore_input."${deps."conrod_core"."0.63.0"."pistoncore_input"}" deps)
    (features_.rusttype."${deps."conrod_core"."0.63.0"."rusttype"}" deps)
  ];


# end
# conrod_derive-0.63.0

  crates.conrod_derive."0.63.0" = deps: { features?(features_.conrod_derive."0.63.0" deps {}) }: buildRustCrate {
    crateName = "conrod_derive";
    version = "0.63.0";
    authors = [ "mitchmindtree <mitchell.nordine@gmail.com>" ];
    sha256 = "0yvzyfxs0by959c10yy8yvqslr7k4383vza73lf4q1wk9jy3nkrn";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."conrod_derive"."0.63.0"."proc_macro2"}" deps)
      (crates."quote"."${deps."conrod_derive"."0.63.0"."quote"}" deps)
      (crates."syn"."${deps."conrod_derive"."0.63.0"."syn"}" deps)
    ]);
  };
  features_.conrod_derive."0.63.0" = deps: f: updateFeatures f (rec {
    conrod_derive."0.63.0".default = (f.conrod_derive."0.63.0".default or true);
    proc_macro2."${deps.conrod_derive."0.63.0".proc_macro2}".default = true;
    quote."${deps.conrod_derive."0.63.0".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.conrod_derive."0.63.0".syn}"."extra-traits" = true; }
      { "${deps.conrod_derive."0.63.0".syn}"."full" = true; }
      { "${deps.conrod_derive."0.63.0".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."conrod_derive"."0.63.0"."proc_macro2"}" deps)
    (features_.quote."${deps."conrod_derive"."0.63.0"."quote"}" deps)
    (features_.syn."${deps."conrod_derive"."0.63.0"."syn"}" deps)
  ];


# end
# conrod_glium-0.63.0

  crates.conrod_glium."0.63.0" = deps: { features?(features_.conrod_glium."0.63.0" deps {}) }: buildRustCrate {
    crateName = "conrod_glium";
    version = "0.63.0";
    authors = [ "Mitchell Nordine <mitchell.nordine@gmail.com>" ];
    sha256 = "0g3lq5fb0plaaxv6ff94rdncfxn46idvf6yyisk8yndydflnwbgm";
    libPath = "./src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."conrod_core"."${deps."conrod_glium"."0.63.0"."conrod_core"}" deps)
      (crates."glium"."${deps."conrod_glium"."0.63.0"."glium"}" deps)
    ]);
  };
  features_.conrod_glium."0.63.0" = deps: f: updateFeatures f (rec {
    conrod_core."${deps.conrod_glium."0.63.0".conrod_core}".default = true;
    conrod_glium."0.63.0".default = (f.conrod_glium."0.63.0".default or true);
    glium."${deps.conrod_glium."0.63.0".glium}".default = true;
  }) [
    (features_.conrod_core."${deps."conrod_glium"."0.63.0"."conrod_core"}" deps)
    (features_.glium."${deps."conrod_glium"."0.63.0"."glium"}" deps)
  ];


# end
# conrod_winit-0.63.0

  crates.conrod_winit."0.63.0" = deps: { features?(features_.conrod_winit."0.63.0" deps {}) }: buildRustCrate {
    crateName = "conrod_winit";
    version = "0.63.0";
    authors = [ "Mitchell Nordine <mitchell.nordine@gmail.com>" "Sven Nilsen <bvssvni@gmail.com>" ];
    sha256 = "1nsk5543qq76c4nsvz1xafqvcb0j6fiphq4irqnipizxabaihrn9";
    libPath = "./src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."conrod_core"."${deps."conrod_winit"."0.63.0"."conrod_core"}" deps)
      (crates."winit"."${deps."conrod_winit"."0.63.0"."winit"}" deps)
    ]);
  };
  features_.conrod_winit."0.63.0" = deps: f: updateFeatures f (rec {
    conrod_core."${deps.conrod_winit."0.63.0".conrod_core}".default = true;
    conrod_winit."0.63.0".default = (f.conrod_winit."0.63.0".default or true);
    winit."${deps.conrod_winit."0.63.0".winit}".default = true;
  }) [
    (features_.conrod_core."${deps."conrod_winit"."0.63.0"."conrod_core"}" deps)
    (features_.winit."${deps."conrod_winit"."0.63.0"."winit"}" deps)
  ];


# end
# core-foundation-0.5.1

  crates.core_foundation."0.5.1" = deps: { features?(features_.core_foundation."0.5.1" deps {}) }: buildRustCrate {
    crateName = "core-foundation";
    version = "0.5.1";
    authors = [ "The Servo Project Developers" ];
    sha256 = "03s11z23rb1kk325c34rmsbd7k0l5rkzk4q6id55n174z28zqln1";
    dependencies = mapFeatures features ([
      (crates."core_foundation_sys"."${deps."core_foundation"."0.5.1"."core_foundation_sys"}" deps)
      (crates."libc"."${deps."core_foundation"."0.5.1"."libc"}" deps)
    ]);
    features = mkFeatures (features."core_foundation"."0.5.1" or {});
  };
  features_.core_foundation."0.5.1" = deps: f: updateFeatures f (rec {
    core_foundation = fold recursiveUpdate {} [
      { "0.5.1".chrono =
        (f.core_foundation."0.5.1".chrono or false) ||
        (f.core_foundation."0.5.1".with-chrono or false) ||
        (core_foundation."0.5.1"."with-chrono" or false); }
      { "0.5.1".default = (f.core_foundation."0.5.1".default or true); }
      { "0.5.1".uuid =
        (f.core_foundation."0.5.1".uuid or false) ||
        (f.core_foundation."0.5.1".with-uuid or false) ||
        (core_foundation."0.5.1"."with-uuid" or false); }
    ];
    core_foundation_sys = fold recursiveUpdate {} [
      { "${deps.core_foundation."0.5.1".core_foundation_sys}"."mac_os_10_7_support" =
        (f.core_foundation_sys."${deps.core_foundation."0.5.1".core_foundation_sys}"."mac_os_10_7_support" or false) ||
        (core_foundation."0.5.1"."mac_os_10_7_support" or false) ||
        (f."core_foundation"."0.5.1"."mac_os_10_7_support" or false); }
      { "${deps.core_foundation."0.5.1".core_foundation_sys}"."mac_os_10_8_features" =
        (f.core_foundation_sys."${deps.core_foundation."0.5.1".core_foundation_sys}"."mac_os_10_8_features" or false) ||
        (core_foundation."0.5.1"."mac_os_10_8_features" or false) ||
        (f."core_foundation"."0.5.1"."mac_os_10_8_features" or false); }
      { "${deps.core_foundation."0.5.1".core_foundation_sys}".default = true; }
    ];
    libc."${deps.core_foundation."0.5.1".libc}".default = true;
  }) [
    (features_.core_foundation_sys."${deps."core_foundation"."0.5.1"."core_foundation_sys"}" deps)
    (features_.libc."${deps."core_foundation"."0.5.1"."libc"}" deps)
  ];


# end
# core-foundation-0.6.3

  crates.core_foundation."0.6.3" = deps: { features?(features_.core_foundation."0.6.3" deps {}) }: buildRustCrate {
    crateName = "core-foundation";
    version = "0.6.3";
    authors = [ "The Servo Project Developers" ];
    sha256 = "1j06ay1jhv9c049kvwkz2myz1r5z3adqrd27nl5fjqqv3d2yl3xk";
    dependencies = mapFeatures features ([
      (crates."core_foundation_sys"."${deps."core_foundation"."0.6.3"."core_foundation_sys"}" deps)
      (crates."libc"."${deps."core_foundation"."0.6.3"."libc"}" deps)
    ]);
    features = mkFeatures (features."core_foundation"."0.6.3" or {});
  };
  features_.core_foundation."0.6.3" = deps: f: updateFeatures f (rec {
    core_foundation = fold recursiveUpdate {} [
      { "0.6.3".chrono =
        (f.core_foundation."0.6.3".chrono or false) ||
        (f.core_foundation."0.6.3".with-chrono or false) ||
        (core_foundation."0.6.3"."with-chrono" or false); }
      { "0.6.3".default = (f.core_foundation."0.6.3".default or true); }
      { "0.6.3".uuid =
        (f.core_foundation."0.6.3".uuid or false) ||
        (f.core_foundation."0.6.3".with-uuid or false) ||
        (core_foundation."0.6.3"."with-uuid" or false); }
    ];
    core_foundation_sys = fold recursiveUpdate {} [
      { "${deps.core_foundation."0.6.3".core_foundation_sys}"."mac_os_10_7_support" =
        (f.core_foundation_sys."${deps.core_foundation."0.6.3".core_foundation_sys}"."mac_os_10_7_support" or false) ||
        (core_foundation."0.6.3"."mac_os_10_7_support" or false) ||
        (f."core_foundation"."0.6.3"."mac_os_10_7_support" or false); }
      { "${deps.core_foundation."0.6.3".core_foundation_sys}"."mac_os_10_8_features" =
        (f.core_foundation_sys."${deps.core_foundation."0.6.3".core_foundation_sys}"."mac_os_10_8_features" or false) ||
        (core_foundation."0.6.3"."mac_os_10_8_features" or false) ||
        (f."core_foundation"."0.6.3"."mac_os_10_8_features" or false); }
      { "${deps.core_foundation."0.6.3".core_foundation_sys}".default = true; }
    ];
    libc."${deps.core_foundation."0.6.3".libc}".default = true;
  }) [
    (features_.core_foundation_sys."${deps."core_foundation"."0.6.3"."core_foundation_sys"}" deps)
    (features_.libc."${deps."core_foundation"."0.6.3"."libc"}" deps)
  ];


# end
# core-foundation-sys-0.5.1

  crates.core_foundation_sys."0.5.1" = deps: { features?(features_.core_foundation_sys."0.5.1" deps {}) }: buildRustCrate {
    crateName = "core-foundation-sys";
    version = "0.5.1";
    authors = [ "The Servo Project Developers" ];
    sha256 = "0qbrasll5nw1bgr071i8s8jc975d0y4qfysf868bh9xp0f6vcypa";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."core_foundation_sys"."0.5.1"."libc"}" deps)
    ]);
    features = mkFeatures (features."core_foundation_sys"."0.5.1" or {});
  };
  features_.core_foundation_sys."0.5.1" = deps: f: updateFeatures f (rec {
    core_foundation_sys."0.5.1".default = (f.core_foundation_sys."0.5.1".default or true);
    libc."${deps.core_foundation_sys."0.5.1".libc}".default = true;
  }) [
    (features_.libc."${deps."core_foundation_sys"."0.5.1"."libc"}" deps)
  ];


# end
# core-foundation-sys-0.6.2

  crates.core_foundation_sys."0.6.2" = deps: { features?(features_.core_foundation_sys."0.6.2" deps {}) }: buildRustCrate {
    crateName = "core-foundation-sys";
    version = "0.6.2";
    authors = [ "The Servo Project Developers" ];
    sha256 = "1n2v6wlqkmqwhl7k6y50irx51p37xb0fcm3njbman82gnyq8di2c";
    build = "build.rs";
    features = mkFeatures (features."core_foundation_sys"."0.6.2" or {});
  };
  features_.core_foundation_sys."0.6.2" = deps: f: updateFeatures f (rec {
    core_foundation_sys."0.6.2".default = (f.core_foundation_sys."0.6.2".default or true);
  }) [];


# end
# core-graphics-0.17.3

  crates.core_graphics."0.17.3" = deps: { features?(features_.core_graphics."0.17.3" deps {}) }: buildRustCrate {
    crateName = "core-graphics";
    version = "0.17.3";
    authors = [ "The Servo Project Developers" ];
    sha256 = "1nqv6k047m33w24mjs58ypqk17sng9yf1hdj108nxb6b3ywsxq96";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."core_graphics"."0.17.3"."bitflags"}" deps)
      (crates."core_foundation"."${deps."core_graphics"."0.17.3"."core_foundation"}" deps)
      (crates."foreign_types"."${deps."core_graphics"."0.17.3"."foreign_types"}" deps)
      (crates."libc"."${deps."core_graphics"."0.17.3"."libc"}" deps)
    ]);
    features = mkFeatures (features."core_graphics"."0.17.3" or {});
  };
  features_.core_graphics."0.17.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.core_graphics."0.17.3".bitflags}".default = true;
    core_foundation."${deps.core_graphics."0.17.3".core_foundation}".default = true;
    core_graphics."0.17.3".default = (f.core_graphics."0.17.3".default or true);
    foreign_types."${deps.core_graphics."0.17.3".foreign_types}".default = true;
    libc."${deps.core_graphics."0.17.3".libc}".default = true;
  }) [
    (features_.bitflags."${deps."core_graphics"."0.17.3"."bitflags"}" deps)
    (features_.core_foundation."${deps."core_graphics"."0.17.3"."core_foundation"}" deps)
    (features_.foreign_types."${deps."core_graphics"."0.17.3"."foreign_types"}" deps)
    (features_.libc."${deps."core_graphics"."0.17.3"."libc"}" deps)
  ];


# end
# crc32fast-1.1.2

  crates.crc32fast."1.1.2" = deps: { features?(features_.crc32fast."1.1.2" deps {}) }: buildRustCrate {
    crateName = "crc32fast";
    version = "1.1.2";
    authors = [ "Sam Rijs <srijs@airpost.net>" "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "19hjgifwvsgcvhm7f6bqkp4sfijnx3ddiv8szdfwjn3sjn4lysd6";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crc32fast"."1.1.2"."cfg_if"}" deps)
    ]);
  };
  features_.crc32fast."1.1.2" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crc32fast."1.1.2".cfg_if}".default = true;
    crc32fast."1.1.2".default = (f.crc32fast."1.1.2".default or true);
  }) [
    (features_.cfg_if."${deps."crc32fast"."1.1.2"."cfg_if"}" deps)
  ];


# end
# crossbeam-0.6.0

  crates.crossbeam."0.6.0" = deps: { features?(features_.crossbeam."0.6.0" deps {}) }: buildRustCrate {
    crateName = "crossbeam";
    version = "0.6.0";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1hsp7ljqhywz1ykdr23ggi33ds87lk0gg45mjlf0m5qd0399x2xf";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crossbeam"."0.6.0"."cfg_if"}" deps)
      (crates."crossbeam_channel"."${deps."crossbeam"."0.6.0"."crossbeam_channel"}" deps)
      (crates."crossbeam_deque"."${deps."crossbeam"."0.6.0"."crossbeam_deque"}" deps)
      (crates."crossbeam_epoch"."${deps."crossbeam"."0.6.0"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam"."0.6.0"."crossbeam_utils"}" deps)
      (crates."lazy_static"."${deps."crossbeam"."0.6.0"."lazy_static"}" deps)
      (crates."num_cpus"."${deps."crossbeam"."0.6.0"."num_cpus"}" deps)
      (crates."parking_lot"."${deps."crossbeam"."0.6.0"."parking_lot"}" deps)
    ]);
    features = mkFeatures (features."crossbeam"."0.6.0" or {});
  };
  features_.crossbeam."0.6.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crossbeam."0.6.0".cfg_if}".default = true;
    crossbeam = fold recursiveUpdate {} [
      { "0.6.0".default = (f.crossbeam."0.6.0".default or true); }
      { "0.6.0".std =
        (f.crossbeam."0.6.0".std or false) ||
        (f.crossbeam."0.6.0".default or false) ||
        (crossbeam."0.6.0"."default" or false); }
    ];
    crossbeam_channel."${deps.crossbeam."0.6.0".crossbeam_channel}".default = true;
    crossbeam_deque."${deps.crossbeam."0.6.0".crossbeam_deque}".default = true;
    crossbeam_epoch = fold recursiveUpdate {} [
      { "${deps.crossbeam."0.6.0".crossbeam_epoch}"."nightly" =
        (f.crossbeam_epoch."${deps.crossbeam."0.6.0".crossbeam_epoch}"."nightly" or false) ||
        (crossbeam."0.6.0"."nightly" or false) ||
        (f."crossbeam"."0.6.0"."nightly" or false); }
      { "${deps.crossbeam."0.6.0".crossbeam_epoch}"."std" =
        (f.crossbeam_epoch."${deps.crossbeam."0.6.0".crossbeam_epoch}"."std" or false) ||
        (crossbeam."0.6.0"."std" or false) ||
        (f."crossbeam"."0.6.0"."std" or false); }
      { "${deps.crossbeam."0.6.0".crossbeam_epoch}".default = true; }
    ];
    crossbeam_utils = fold recursiveUpdate {} [
      { "${deps.crossbeam."0.6.0".crossbeam_utils}"."nightly" =
        (f.crossbeam_utils."${deps.crossbeam."0.6.0".crossbeam_utils}"."nightly" or false) ||
        (crossbeam."0.6.0"."nightly" or false) ||
        (f."crossbeam"."0.6.0"."nightly" or false); }
      { "${deps.crossbeam."0.6.0".crossbeam_utils}"."std" =
        (f.crossbeam_utils."${deps.crossbeam."0.6.0".crossbeam_utils}"."std" or false) ||
        (crossbeam."0.6.0"."std" or false) ||
        (f."crossbeam"."0.6.0"."std" or false); }
      { "${deps.crossbeam."0.6.0".crossbeam_utils}".default = true; }
    ];
    lazy_static."${deps.crossbeam."0.6.0".lazy_static}".default = true;
    num_cpus."${deps.crossbeam."0.6.0".num_cpus}".default = true;
    parking_lot."${deps.crossbeam."0.6.0".parking_lot}".default = true;
  }) [
    (features_.cfg_if."${deps."crossbeam"."0.6.0"."cfg_if"}" deps)
    (features_.crossbeam_channel."${deps."crossbeam"."0.6.0"."crossbeam_channel"}" deps)
    (features_.crossbeam_deque."${deps."crossbeam"."0.6.0"."crossbeam_deque"}" deps)
    (features_.crossbeam_epoch."${deps."crossbeam"."0.6.0"."crossbeam_epoch"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam"."0.6.0"."crossbeam_utils"}" deps)
    (features_.lazy_static."${deps."crossbeam"."0.6.0"."lazy_static"}" deps)
    (features_.num_cpus."${deps."crossbeam"."0.6.0"."num_cpus"}" deps)
    (features_.parking_lot."${deps."crossbeam"."0.6.0"."parking_lot"}" deps)
  ];


# end
# crossbeam-channel-0.3.8

  crates.crossbeam_channel."0.3.8" = deps: { features?(features_.crossbeam_channel."0.3.8" deps {}) }: buildRustCrate {
    crateName = "crossbeam-channel";
    version = "0.3.8";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "0apm8why2qsgr8ykh9x677kc9ml7qp71mvirfkdzdn4c1jyqyyzm";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."crossbeam_channel"."0.3.8"."crossbeam_utils"}" deps)
      (crates."smallvec"."${deps."crossbeam_channel"."0.3.8"."smallvec"}" deps)
    ]);
  };
  features_.crossbeam_channel."0.3.8" = deps: f: updateFeatures f (rec {
    crossbeam_channel."0.3.8".default = (f.crossbeam_channel."0.3.8".default or true);
    crossbeam_utils."${deps.crossbeam_channel."0.3.8".crossbeam_utils}".default = true;
    smallvec."${deps.crossbeam_channel."0.3.8".smallvec}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."crossbeam_channel"."0.3.8"."crossbeam_utils"}" deps)
    (features_.smallvec."${deps."crossbeam_channel"."0.3.8"."smallvec"}" deps)
  ];


# end
# crossbeam-deque-0.6.3

  crates.crossbeam_deque."0.6.3" = deps: { features?(features_.crossbeam_deque."0.6.3" deps {}) }: buildRustCrate {
    crateName = "crossbeam-deque";
    version = "0.6.3";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "07dahkh6rc09nzg7054rnmxhni263pi9arcyjyy822kg59c0lfz8";
    dependencies = mapFeatures features ([
      (crates."crossbeam_epoch"."${deps."crossbeam_deque"."0.6.3"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_deque"."0.6.3"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_deque."0.6.3" = deps: f: updateFeatures f (rec {
    crossbeam_deque."0.6.3".default = (f.crossbeam_deque."0.6.3".default or true);
    crossbeam_epoch."${deps.crossbeam_deque."0.6.3".crossbeam_epoch}".default = true;
    crossbeam_utils."${deps.crossbeam_deque."0.6.3".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_epoch."${deps."crossbeam_deque"."0.6.3"."crossbeam_epoch"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_deque"."0.6.3"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-deque-0.7.1

  crates.crossbeam_deque."0.7.1" = deps: { features?(features_.crossbeam_deque."0.7.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-deque";
    version = "0.7.1";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "11l7idrx3diksrxbaa13f9h9i6f3456qq3647f3kglxfjmz9bm8s";
    dependencies = mapFeatures features ([
      (crates."crossbeam_epoch"."${deps."crossbeam_deque"."0.7.1"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_deque"."0.7.1"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_deque."0.7.1" = deps: f: updateFeatures f (rec {
    crossbeam_deque."0.7.1".default = (f.crossbeam_deque."0.7.1".default or true);
    crossbeam_epoch."${deps.crossbeam_deque."0.7.1".crossbeam_epoch}".default = true;
    crossbeam_utils."${deps.crossbeam_deque."0.7.1".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_epoch."${deps."crossbeam_deque"."0.7.1"."crossbeam_epoch"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_deque"."0.7.1"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-epoch-0.7.1

  crates.crossbeam_epoch."0.7.1" = deps: { features?(features_.crossbeam_epoch."0.7.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-epoch";
    version = "0.7.1";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1n2p8rqsg0g8dws6kvjgi5jsbnd42l45dklnzc8vihjcxa6712bg";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."crossbeam_epoch"."0.7.1"."arrayvec"}" deps)
      (crates."cfg_if"."${deps."crossbeam_epoch"."0.7.1"."cfg_if"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_epoch"."0.7.1"."crossbeam_utils"}" deps)
      (crates."memoffset"."${deps."crossbeam_epoch"."0.7.1"."memoffset"}" deps)
      (crates."scopeguard"."${deps."crossbeam_epoch"."0.7.1"."scopeguard"}" deps)
    ]
      ++ (if features.crossbeam_epoch."0.7.1".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_epoch"."0.7.1".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_epoch"."0.7.1" or {});
  };
  features_.crossbeam_epoch."0.7.1" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.1".arrayvec}"."use_union" =
        (f.arrayvec."${deps.crossbeam_epoch."0.7.1".arrayvec}"."use_union" or false) ||
        (crossbeam_epoch."0.7.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.1".arrayvec}".default = (f.arrayvec."${deps.crossbeam_epoch."0.7.1".arrayvec}".default or false); }
    ];
    cfg_if."${deps.crossbeam_epoch."0.7.1".cfg_if}".default = true;
    crossbeam_epoch = fold recursiveUpdate {} [
      { "0.7.1".default = (f.crossbeam_epoch."0.7.1".default or true); }
      { "0.7.1".lazy_static =
        (f.crossbeam_epoch."0.7.1".lazy_static or false) ||
        (f.crossbeam_epoch."0.7.1".std or false) ||
        (crossbeam_epoch."0.7.1"."std" or false); }
      { "0.7.1".std =
        (f.crossbeam_epoch."0.7.1".std or false) ||
        (f.crossbeam_epoch."0.7.1".default or false) ||
        (crossbeam_epoch."0.7.1"."default" or false); }
    ];
    crossbeam_utils = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."nightly" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."nightly" or false) ||
        (crossbeam_epoch."0.7.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."std" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."std" or false) ||
        (crossbeam_epoch."0.7.1"."std" or false) ||
        (f."crossbeam_epoch"."0.7.1"."std" or false); }
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}".default = (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}".default or false); }
    ];
    lazy_static."${deps.crossbeam_epoch."0.7.1".lazy_static}".default = true;
    memoffset."${deps.crossbeam_epoch."0.7.1".memoffset}".default = true;
    scopeguard."${deps.crossbeam_epoch."0.7.1".scopeguard}".default = (f.scopeguard."${deps.crossbeam_epoch."0.7.1".scopeguard}".default or false);
  }) [
    (features_.arrayvec."${deps."crossbeam_epoch"."0.7.1"."arrayvec"}" deps)
    (features_.cfg_if."${deps."crossbeam_epoch"."0.7.1"."cfg_if"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_epoch"."0.7.1"."crossbeam_utils"}" deps)
    (features_.lazy_static."${deps."crossbeam_epoch"."0.7.1"."lazy_static"}" deps)
    (features_.memoffset."${deps."crossbeam_epoch"."0.7.1"."memoffset"}" deps)
    (features_.scopeguard."${deps."crossbeam_epoch"."0.7.1"."scopeguard"}" deps)
  ];


# end
# crossbeam-utils-0.6.5

  crates.crossbeam_utils."0.6.5" = deps: { features?(features_.crossbeam_utils."0.6.5" deps {}) }: buildRustCrate {
    crateName = "crossbeam-utils";
    version = "0.6.5";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1z7wgcl9d22r2x6769r5945rnwf3jqfrrmb16q7kzk292r1d4rdg";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crossbeam_utils"."0.6.5"."cfg_if"}" deps)
    ]
      ++ (if features.crossbeam_utils."0.6.5".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_utils"."0.6.5".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_utils"."0.6.5" or {});
  };
  features_.crossbeam_utils."0.6.5" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crossbeam_utils."0.6.5".cfg_if}".default = true;
    crossbeam_utils = fold recursiveUpdate {} [
      { "0.6.5".default = (f.crossbeam_utils."0.6.5".default or true); }
      { "0.6.5".lazy_static =
        (f.crossbeam_utils."0.6.5".lazy_static or false) ||
        (f.crossbeam_utils."0.6.5".std or false) ||
        (crossbeam_utils."0.6.5"."std" or false); }
      { "0.6.5".std =
        (f.crossbeam_utils."0.6.5".std or false) ||
        (f.crossbeam_utils."0.6.5".default or false) ||
        (crossbeam_utils."0.6.5"."default" or false); }
    ];
    lazy_static."${deps.crossbeam_utils."0.6.5".lazy_static}".default = true;
  }) [
    (features_.cfg_if."${deps."crossbeam_utils"."0.6.5"."cfg_if"}" deps)
    (features_.lazy_static."${deps."crossbeam_utils"."0.6.5"."lazy_static"}" deps)
  ];


# end
# crypto-mac-0.7.0

  crates.crypto_mac."0.7.0" = deps: { features?(features_.crypto_mac."0.7.0" deps {}) }: buildRustCrate {
    crateName = "crypto-mac";
    version = "0.7.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0kdsnk9930cdp5z7m239i9sf0yrsrc9hdhjwkpsd6sfr0i33q0qq";
    dependencies = mapFeatures features ([
      (crates."generic_array"."${deps."crypto_mac"."0.7.0"."generic_array"}" deps)
      (crates."subtle"."${deps."crypto_mac"."0.7.0"."subtle"}" deps)
    ]);
    features = mkFeatures (features."crypto_mac"."0.7.0" or {});
  };
  features_.crypto_mac."0.7.0" = deps: f: updateFeatures f (rec {
    crypto_mac = fold recursiveUpdate {} [
      { "0.7.0".blobby =
        (f.crypto_mac."0.7.0".blobby or false) ||
        (f.crypto_mac."0.7.0".dev or false) ||
        (crypto_mac."0.7.0"."dev" or false); }
      { "0.7.0".default = (f.crypto_mac."0.7.0".default or true); }
    ];
    generic_array."${deps.crypto_mac."0.7.0".generic_array}".default = true;
    subtle."${deps.crypto_mac."0.7.0".subtle}".default = (f.subtle."${deps.crypto_mac."0.7.0".subtle}".default or false);
  }) [
    (features_.generic_array."${deps."crypto_mac"."0.7.0"."generic_array"}" deps)
    (features_.subtle."${deps."crypto_mac"."0.7.0"."subtle"}" deps)
  ];


# end
# daggy-0.5.0

  crates.daggy."0.5.0" = deps: { features?(features_.daggy."0.5.0" deps {}) }: buildRustCrate {
    crateName = "daggy";
    version = "0.5.0";
    authors = [ "mitchmindtree <mitchell.nordine@gmail.com>" ];
    sha256 = "0z3646ddb6v9snjvd25rjy6hrx77bf74iwgb2am06icqirixrd51";
    dependencies = mapFeatures features ([
      (crates."petgraph"."${deps."daggy"."0.5.0"."petgraph"}" deps)
    ]);
  };
  features_.daggy."0.5.0" = deps: f: updateFeatures f (rec {
    daggy."0.5.0".default = (f.daggy."0.5.0".default or true);
    petgraph."${deps.daggy."0.5.0".petgraph}".default = (f.petgraph."${deps.daggy."0.5.0".petgraph}".default or false);
  }) [
    (features_.petgraph."${deps."daggy"."0.5.0"."petgraph"}" deps)
  ];


# end
# darling-0.8.5

  crates.darling."0.8.5" = deps: { features?(features_.darling."0.8.5" deps {}) }: buildRustCrate {
    crateName = "darling";
    version = "0.8.5";
    authors = [ "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "1wdnpv9m1sb11hgcs25d3ha1hxx488kb8wil19cl0is63qw4n9vk";
    dependencies = mapFeatures features ([
      (crates."darling_core"."${deps."darling"."0.8.5"."darling_core"}" deps)
      (crates."darling_macro"."${deps."darling"."0.8.5"."darling_macro"}" deps)
    ]);
    features = mkFeatures (features."darling"."0.8.5" or {});
  };
  features_.darling."0.8.5" = deps: f: updateFeatures f (rec {
    darling."0.8.5".default = (f.darling."0.8.5".default or true);
    darling_core = fold recursiveUpdate {} [
      { "${deps.darling."0.8.5".darling_core}"."diagnostics" =
        (f.darling_core."${deps.darling."0.8.5".darling_core}"."diagnostics" or false) ||
        (darling."0.8.5"."diagnostics" or false) ||
        (f."darling"."0.8.5"."diagnostics" or false); }
      { "${deps.darling."0.8.5".darling_core}".default = true; }
    ];
    darling_macro."${deps.darling."0.8.5".darling_macro}".default = true;
  }) [
    (features_.darling_core."${deps."darling"."0.8.5"."darling_core"}" deps)
    (features_.darling_macro."${deps."darling"."0.8.5"."darling_macro"}" deps)
  ];


# end
# darling_core-0.8.5

  crates.darling_core."0.8.5" = deps: { features?(features_.darling_core."0.8.5" deps {}) }: buildRustCrate {
    crateName = "darling_core";
    version = "0.8.5";
    authors = [ "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "01z8z65gr3s9gyxcq5yp7afa59fgzkbi6qb7wj0yryv6hg4a2yll";
    dependencies = mapFeatures features ([
      (crates."fnv"."${deps."darling_core"."0.8.5"."fnv"}" deps)
      (crates."ident_case"."${deps."darling_core"."0.8.5"."ident_case"}" deps)
      (crates."proc_macro2"."${deps."darling_core"."0.8.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."darling_core"."0.8.5"."quote"}" deps)
      (crates."syn"."${deps."darling_core"."0.8.5"."syn"}" deps)
    ]);
    features = mkFeatures (features."darling_core"."0.8.5" or {});
  };
  features_.darling_core."0.8.5" = deps: f: updateFeatures f (rec {
    darling_core."0.8.5".default = (f.darling_core."0.8.5".default or true);
    fnv."${deps.darling_core."0.8.5".fnv}".default = true;
    ident_case."${deps.darling_core."0.8.5".ident_case}".default = true;
    proc_macro2."${deps.darling_core."0.8.5".proc_macro2}".default = true;
    quote."${deps.darling_core."0.8.5".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.darling_core."0.8.5".syn}"."extra-traits" = true; }
      { "${deps.darling_core."0.8.5".syn}"."full" =
        (f.syn."${deps.darling_core."0.8.5".syn}"."full" or false) ||
        (darling_core."0.8.5"."default" or false) ||
        (f."darling_core"."0.8.5"."default" or false); }
      { "${deps.darling_core."0.8.5".syn}".default = true; }
    ];
  }) [
    (features_.fnv."${deps."darling_core"."0.8.5"."fnv"}" deps)
    (features_.ident_case."${deps."darling_core"."0.8.5"."ident_case"}" deps)
    (features_.proc_macro2."${deps."darling_core"."0.8.5"."proc_macro2"}" deps)
    (features_.quote."${deps."darling_core"."0.8.5"."quote"}" deps)
    (features_.syn."${deps."darling_core"."0.8.5"."syn"}" deps)
  ];


# end
# darling_macro-0.8.5

  crates.darling_macro."0.8.5" = deps: { features?(features_.darling_macro."0.8.5" deps {}) }: buildRustCrate {
    crateName = "darling_macro";
    version = "0.8.5";
    authors = [ "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "1l0qxr3xbi3l9mw7w5cr44xj35c4riwpjhg4l8zj26i156g4qsfv";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."darling_core"."${deps."darling_macro"."0.8.5"."darling_core"}" deps)
      (crates."quote"."${deps."darling_macro"."0.8.5"."quote"}" deps)
      (crates."syn"."${deps."darling_macro"."0.8.5"."syn"}" deps)
    ]);
  };
  features_.darling_macro."0.8.5" = deps: f: updateFeatures f (rec {
    darling_core."${deps.darling_macro."0.8.5".darling_core}".default = true;
    darling_macro."0.8.5".default = (f.darling_macro."0.8.5".default or true);
    quote."${deps.darling_macro."0.8.5".quote}".default = true;
    syn."${deps.darling_macro."0.8.5".syn}".default = true;
  }) [
    (features_.darling_core."${deps."darling_macro"."0.8.5"."darling_core"}" deps)
    (features_.quote."${deps."darling_macro"."0.8.5"."quote"}" deps)
    (features_.syn."${deps."darling_macro"."0.8.5"."syn"}" deps)
  ];


# end
# dbus-0.6.4

  crates.dbus."0.6.4" = deps: { features?(features_.dbus."0.6.4" deps {}) }: buildRustCrate {
    crateName = "dbus";
    version = "0.6.4";
    authors = [ "David Henningsson <diwic@ubuntu.com>" ];
    sha256 = "12grli329w452p98n1jin1ps4r2794rh4xq9h6racm7h9hrqb6bm";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."dbus"."0.6.4"."libc"}" deps)
      (crates."libdbus_sys"."${deps."dbus"."0.6.4"."libdbus_sys"}" deps)
    ]);
    features = mkFeatures (features."dbus"."0.6.4" or {});
  };
  features_.dbus."0.6.4" = deps: f: updateFeatures f (rec {
    dbus."0.6.4".default = (f.dbus."0.6.4".default or true);
    libc."${deps.dbus."0.6.4".libc}".default = true;
    libdbus_sys."${deps.dbus."0.6.4".libdbus_sys}".default = true;
  }) [
    (features_.libc."${deps."dbus"."0.6.4"."libc"}" deps)
    (features_.libdbus_sys."${deps."dbus"."0.6.4"."libdbus_sys"}" deps)
  ];


# end
# digest-0.8.0

  crates.digest."0.8.0" = deps: { features?(features_.digest."0.8.0" deps {}) }: buildRustCrate {
    crateName = "digest";
    version = "0.8.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "1bsddd8vdmncmprks8b392yccf132wjwzrcy5wdy1kh05qm23il8";
    dependencies = mapFeatures features ([
      (crates."generic_array"."${deps."digest"."0.8.0"."generic_array"}" deps)
    ]);
    features = mkFeatures (features."digest"."0.8.0" or {});
  };
  features_.digest."0.8.0" = deps: f: updateFeatures f (rec {
    digest = fold recursiveUpdate {} [
      { "0.8.0".blobby =
        (f.digest."0.8.0".blobby or false) ||
        (f.digest."0.8.0".dev or false) ||
        (digest."0.8.0"."dev" or false); }
      { "0.8.0".default = (f.digest."0.8.0".default or true); }
    ];
    generic_array."${deps.digest."0.8.0".generic_array}".default = true;
  }) [
    (features_.generic_array."${deps."digest"."0.8.0"."generic_array"}" deps)
  ];


# end
# dlib-0.4.1

  crates.dlib."0.4.1" = deps: { features?(features_.dlib."0.4.1" deps {}) }: buildRustCrate {
    crateName = "dlib";
    version = "0.4.1";
    authors = [ "Victor Berger <victor.berger@m4x.org>" ];
    sha256 = "0h5xm6lanbl6v9y16g592bia33g7xb0n0fg98pvz6nsvg0layxlk";
    dependencies = mapFeatures features ([
      (crates."libloading"."${deps."dlib"."0.4.1"."libloading"}" deps)
    ]);
    features = mkFeatures (features."dlib"."0.4.1" or {});
  };
  features_.dlib."0.4.1" = deps: f: updateFeatures f (rec {
    dlib."0.4.1".default = (f.dlib."0.4.1".default or true);
    libloading."${deps.dlib."0.4.1".libloading}".default = true;
  }) [
    (features_.libloading."${deps."dlib"."0.4.1"."libloading"}" deps)
  ];


# end
# downcast-rs-1.0.3

  crates.downcast_rs."1.0.3" = deps: { features?(features_.downcast_rs."1.0.3" deps {}) }: buildRustCrate {
    crateName = "downcast-rs";
    version = "1.0.3";
    authors = [ "Ashish Myles <marcianx@gmail.com>" ];
    sha256 = "1fg8l3j97lac8xf74s8x96c8fj50g9rmwb6hyqbmdwdy6db7ns2r";
  };
  features_.downcast_rs."1.0.3" = deps: f: updateFeatures f (rec {
    downcast_rs."1.0.3".default = (f.downcast_rs."1.0.3".default or true);
  }) [];


# end
# dtoa-0.4.3

  crates.dtoa."0.4.3" = deps: { features?(features_.dtoa."0.4.3" deps {}) }: buildRustCrate {
    crateName = "dtoa";
    version = "0.4.3";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1xysdxdm24sk5ysim7lps4r2qaxfnj0sbakhmps4d42yssx30cw8";
  };
  features_.dtoa."0.4.3" = deps: f: updateFeatures f (rec {
    dtoa."0.4.3".default = (f.dtoa."0.4.3".default or true);
  }) [];


# end
# encoding_rs-0.8.16

  crates.encoding_rs."0.8.16" = deps: { features?(features_.encoding_rs."0.8.16" deps {}) }: buildRustCrate {
    crateName = "encoding_rs";
    version = "0.8.16";
    authors = [ "Henri Sivonen <hsivonen@hsivonen.fi>" ];
    sha256 = "1i8szz93nrsydvj4q8qydmwkhkhvp0cya28lpg24b8zs5l78cj3c";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."encoding_rs"."0.8.16"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."encoding_rs"."0.8.16" or {});
  };
  features_.encoding_rs."0.8.16" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.encoding_rs."0.8.16".cfg_if}".default = true;
    encoding_rs = fold recursiveUpdate {} [
      { "0.8.16".default = (f.encoding_rs."0.8.16".default or true); }
      { "0.8.16".fast-big5-hanzi-encode =
        (f.encoding_rs."0.8.16".fast-big5-hanzi-encode or false) ||
        (f.encoding_rs."0.8.16".fast-legacy-encode or false) ||
        (encoding_rs."0.8.16"."fast-legacy-encode" or false); }
      { "0.8.16".fast-gb-hanzi-encode =
        (f.encoding_rs."0.8.16".fast-gb-hanzi-encode or false) ||
        (f.encoding_rs."0.8.16".fast-legacy-encode or false) ||
        (encoding_rs."0.8.16"."fast-legacy-encode" or false); }
      { "0.8.16".fast-hangul-encode =
        (f.encoding_rs."0.8.16".fast-hangul-encode or false) ||
        (f.encoding_rs."0.8.16".fast-legacy-encode or false) ||
        (encoding_rs."0.8.16"."fast-legacy-encode" or false); }
      { "0.8.16".fast-hanja-encode =
        (f.encoding_rs."0.8.16".fast-hanja-encode or false) ||
        (f.encoding_rs."0.8.16".fast-legacy-encode or false) ||
        (encoding_rs."0.8.16"."fast-legacy-encode" or false); }
      { "0.8.16".fast-kanji-encode =
        (f.encoding_rs."0.8.16".fast-kanji-encode or false) ||
        (f.encoding_rs."0.8.16".fast-legacy-encode or false) ||
        (encoding_rs."0.8.16"."fast-legacy-encode" or false); }
      { "0.8.16".packed_simd =
        (f.encoding_rs."0.8.16".packed_simd or false) ||
        (f.encoding_rs."0.8.16".simd-accel or false) ||
        (encoding_rs."0.8.16"."simd-accel" or false); }
    ];
  }) [
    (features_.cfg_if."${deps."encoding_rs"."0.8.16"."cfg_if"}" deps)
  ];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5".backtrace =
        (f.failure."0.1.5".backtrace or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
      { "0.1.5".derive =
        (f.failure."0.1.5".derive or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".failure_derive =
        (f.failure."0.1.5".failure_derive or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5".std =
        (f.failure."0.1.5".std or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
    ];
    failure_derive."${deps.failure."0.1.5".failure_derive}".default = true;
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
    (features_.failure_derive."${deps."failure"."0.1.5"."failure_derive"}" deps)
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_.failure_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1wzk484b87r4qszcvdl2bkniv5ls4r2f2dshz7hmgiv6z4ln12g0";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."failure_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."failure_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
    ]);
    features = mkFeatures (features."failure_derive"."0.1.5" or {});
  };
  features_.failure_derive."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."failure_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."failure_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
  ];


# end
# fake-simd-0.1.2

  crates.fake_simd."0.1.2" = deps: { features?(features_.fake_simd."0.1.2" deps {}) }: buildRustCrate {
    crateName = "fake-simd";
    version = "0.1.2";
    authors = [ "The Rust-Crypto Project Developers" ];
    sha256 = "1a0f1j66nkwfy17s06vm2bn9vh8vy8llcijfhh9m10p58v08661a";
  };
  features_.fake_simd."0.1.2" = deps: f: updateFeatures f (rec {
    fake_simd."0.1.2".default = (f.fake_simd."0.1.2".default or true);
  }) [];


# end
# fallible-iterator-0.1.6

  crates.fallible_iterator."0.1.6" = deps: { features?(features_.fallible_iterator."0.1.6" deps {}) }: buildRustCrate {
    crateName = "fallible-iterator";
    version = "0.1.6";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "05fkfql4i0n93mz43k157xvkw1sjxahnkq9z8amzpv7y5r4w9bzj";
    features = mkFeatures (features."fallible_iterator"."0.1.6" or {});
  };
  features_.fallible_iterator."0.1.6" = deps: f: updateFeatures f (rec {
    fallible_iterator = fold recursiveUpdate {} [
      { "0.1.6".default = (f.fallible_iterator."0.1.6".default or true); }
      { "0.1.6".std =
        (f.fallible_iterator."0.1.6".std or false) ||
        (f.fallible_iterator."0.1.6".default or false) ||
        (fallible_iterator."0.1.6"."default" or false); }
    ];
  }) [];


# end
# fixedbitset-0.1.9

  crates.fixedbitset."0.1.9" = deps: { features?(features_.fixedbitset."0.1.9" deps {}) }: buildRustCrate {
    crateName = "fixedbitset";
    version = "0.1.9";
    authors = [ "bluss" ];
    sha256 = "1bkb5aq7h9p4rzlgxagnda1f0dd11q0qz41bmdy11z18q1p8igy1";
  };
  features_.fixedbitset."0.1.9" = deps: f: updateFeatures f (rec {
    fixedbitset."0.1.9".default = (f.fixedbitset."0.1.9".default or true);
  }) [];


# end
# fnv-1.0.6

  crates.fnv."1.0.6" = deps: { features?(features_.fnv."1.0.6" deps {}) }: buildRustCrate {
    crateName = "fnv";
    version = "1.0.6";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "128mlh23y3gg6ag5h8iiqlcbl59smisdzraqy88ldrf75kbw27ip";
    libPath = "lib.rs";
  };
  features_.fnv."1.0.6" = deps: f: updateFeatures f (rec {
    fnv."1.0.6".default = (f.fnv."1.0.6".default or true);
  }) [];


# end
# foreign-types-0.3.2

  crates.foreign_types."0.3.2" = deps: { features?(features_.foreign_types."0.3.2" deps {}) }: buildRustCrate {
    crateName = "foreign-types";
    version = "0.3.2";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "105n8sp2djb1s5lzrw04p7ss3dchr5qa3canmynx396nh3vwm2p8";
    dependencies = mapFeatures features ([
      (crates."foreign_types_shared"."${deps."foreign_types"."0.3.2"."foreign_types_shared"}" deps)
    ]);
  };
  features_.foreign_types."0.3.2" = deps: f: updateFeatures f (rec {
    foreign_types."0.3.2".default = (f.foreign_types."0.3.2".default or true);
    foreign_types_shared."${deps.foreign_types."0.3.2".foreign_types_shared}".default = true;
  }) [
    (features_.foreign_types_shared."${deps."foreign_types"."0.3.2"."foreign_types_shared"}" deps)
  ];


# end
# foreign-types-shared-0.1.1

  crates.foreign_types_shared."0.1.1" = deps: { features?(features_.foreign_types_shared."0.1.1" deps {}) }: buildRustCrate {
    crateName = "foreign-types-shared";
    version = "0.1.1";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0b6cnvqbflws8dxywk4589vgbz80049lz4x1g9dfy4s1ppd3g4z5";
  };
  features_.foreign_types_shared."0.1.1" = deps: f: updateFeatures f (rec {
    foreign_types_shared."0.1.1".default = (f.foreign_types_shared."0.1.1".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# fuchsia-zircon-0.3.3

  crates.fuchsia_zircon."0.3.3" = deps: { features?(features_.fuchsia_zircon."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon";
    version = "0.3.3";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "0jrf4shb1699r4la8z358vri8318w4mdi6qzfqy30p2ymjlca4gk";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
    ]);
  };
  features_.fuchsia_zircon."0.3.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fuchsia_zircon."0.3.3".bitflags}".default = true;
    fuchsia_zircon."0.3.3".default = (f.fuchsia_zircon."0.3.3".default or true);
    fuchsia_zircon_sys."${deps.fuchsia_zircon."0.3.3".fuchsia_zircon_sys}".default = true;
  }) [
    (features_.bitflags."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
    (features_.fuchsia_zircon_sys."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
  ];


# end
# fuchsia-zircon-sys-0.3.3

  crates.fuchsia_zircon_sys."0.3.3" = deps: { features?(features_.fuchsia_zircon_sys."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon-sys";
    version = "0.3.3";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "08jp1zxrm9jbrr6l26bjal4dbm8bxfy57ickdgibsqxr1n9j3hf5";
  };
  features_.fuchsia_zircon_sys."0.3.3" = deps: f: updateFeatures f (rec {
    fuchsia_zircon_sys."0.3.3".default = (f.fuchsia_zircon_sys."0.3.3".default or true);
  }) [];


# end
# futures-0.1.25

  crates.futures."0.1.25" = deps: { features?(features_.futures."0.1.25" deps {}) }: buildRustCrate {
    crateName = "futures";
    version = "0.1.25";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1gdn9z3mi3jjzbxgvawqh90895130c3ydks55rshja0ncpn985q3";
    features = mkFeatures (features."futures"."0.1.25" or {});
  };
  features_.futures."0.1.25" = deps: f: updateFeatures f (rec {
    futures = fold recursiveUpdate {} [
      { "0.1.25".default = (f.futures."0.1.25".default or true); }
      { "0.1.25".use_std =
        (f.futures."0.1.25".use_std or false) ||
        (f.futures."0.1.25".default or false) ||
        (futures."0.1.25"."default" or false); }
      { "0.1.25".with-deprecated =
        (f.futures."0.1.25".with-deprecated or false) ||
        (f.futures."0.1.25".default or false) ||
        (futures."0.1.25"."default" or false); }
    ];
  }) [];


# end
# futures-cpupool-0.1.8

  crates.futures_cpupool."0.1.8" = deps: { features?(features_.futures_cpupool."0.1.8" deps {}) }: buildRustCrate {
    crateName = "futures-cpupool";
    version = "0.1.8";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0ficd31n5ljiixy6x0vjglhq4fp0v1p4qzxm3v6ymsrb3z080l5c";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."futures_cpupool"."0.1.8"."futures"}" deps)
      (crates."num_cpus"."${deps."futures_cpupool"."0.1.8"."num_cpus"}" deps)
    ]);
    features = mkFeatures (features."futures_cpupool"."0.1.8" or {});
  };
  features_.futures_cpupool."0.1.8" = deps: f: updateFeatures f (rec {
    futures = fold recursiveUpdate {} [
      { "${deps.futures_cpupool."0.1.8".futures}"."use_std" = true; }
      { "${deps.futures_cpupool."0.1.8".futures}"."with-deprecated" =
        (f.futures."${deps.futures_cpupool."0.1.8".futures}"."with-deprecated" or false) ||
        (futures_cpupool."0.1.8"."with-deprecated" or false) ||
        (f."futures_cpupool"."0.1.8"."with-deprecated" or false); }
      { "${deps.futures_cpupool."0.1.8".futures}".default = (f.futures."${deps.futures_cpupool."0.1.8".futures}".default or false); }
    ];
    futures_cpupool = fold recursiveUpdate {} [
      { "0.1.8".default = (f.futures_cpupool."0.1.8".default or true); }
      { "0.1.8".with-deprecated =
        (f.futures_cpupool."0.1.8".with-deprecated or false) ||
        (f.futures_cpupool."0.1.8".default or false) ||
        (futures_cpupool."0.1.8"."default" or false); }
    ];
    num_cpus."${deps.futures_cpupool."0.1.8".num_cpus}".default = true;
  }) [
    (features_.futures."${deps."futures_cpupool"."0.1.8"."futures"}" deps)
    (features_.num_cpus."${deps."futures_cpupool"."0.1.8"."num_cpus"}" deps)
  ];


# end
# generic-array-0.12.0

  crates.generic_array."0.12.0" = deps: { features?(features_.generic_array."0.12.0" deps {}) }: buildRustCrate {
    crateName = "generic-array";
    version = "0.12.0";
    authors = [ "Bartłomiej Kamiński <fizyk20@gmail.com>" "Aaron Trent <novacrazy@gmail.com>" ];
    sha256 = "12fjpkx1ilqlmynis45g0gh69zkad6jnsc589j64z3idk18lvv91";
    libName = "generic_array";
    dependencies = mapFeatures features ([
      (crates."typenum"."${deps."generic_array"."0.12.0"."typenum"}" deps)
    ]);
  };
  features_.generic_array."0.12.0" = deps: f: updateFeatures f (rec {
    generic_array."0.12.0".default = (f.generic_array."0.12.0".default or true);
    typenum."${deps.generic_array."0.12.0".typenum}".default = true;
  }) [
    (features_.typenum."${deps."generic_array"."0.12.0"."typenum"}" deps)
  ];


# end
# gl_generator-0.10.0

  crates.gl_generator."0.10.0" = deps: { features?(features_.gl_generator."0.10.0" deps {}) }: buildRustCrate {
    crateName = "gl_generator";
    version = "0.10.0";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" "Corey Richardson" "Arseny Kapoulkine" ];
    sha256 = "1h72jwvrd054mh8gkc1cr0x4wpl1gqndsyk48fhv15xv18fgdbs9";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
      (crates."khronos_api"."${deps."gl_generator"."0.10.0"."khronos_api"}" deps)
      (crates."log"."${deps."gl_generator"."0.10.0"."log"}" deps)
      (crates."xml_rs"."${deps."gl_generator"."0.10.0"."xml_rs"}" deps)
    ]);
    features = mkFeatures (features."gl_generator"."0.10.0" or {});
  };
  features_.gl_generator."0.10.0" = deps: f: updateFeatures f (rec {
    gl_generator."0.10.0".default = (f.gl_generator."0.10.0".default or true);
    khronos_api."${deps.gl_generator."0.10.0".khronos_api}".default = true;
    log."${deps.gl_generator."0.10.0".log}".default = true;
    xml_rs."${deps.gl_generator."0.10.0".xml_rs}".default = true;
  }) [
    (features_.khronos_api."${deps."gl_generator"."0.10.0"."khronos_api"}" deps)
    (features_.log."${deps."gl_generator"."0.10.0"."log"}" deps)
    (features_.xml_rs."${deps."gl_generator"."0.10.0"."xml_rs"}" deps)
  ];


# end
# gleam-0.6.8

  crates.gleam."0.6.8" = deps: { features?(features_.gleam."0.6.8" deps {}) }: buildRustCrate {
    crateName = "gleam";
    version = "0.6.8";
    authors = [ "The Servo Project Developers" ];
    sha256 = "0dgy1zbl4r4q612b8pgnd936d131y4yngms81xrkgbzh226acbrm";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."gl_generator"."${deps."gleam"."0.6.8"."gl_generator"}" deps)
    ]);
  };
  features_.gleam."0.6.8" = deps: f: updateFeatures f (rec {
    gl_generator."${deps.gleam."0.6.8".gl_generator}".default = true;
    gleam."0.6.8".default = (f.gleam."0.6.8".default or true);
  }) [
    (features_.gl_generator."${deps."gleam"."0.6.8"."gl_generator"}" deps)
  ];


# end
# glium-0.23.0

  crates.glium."0.23.0" = deps: { features?(features_.glium."0.23.0" deps {}) }: buildRustCrate {
    crateName = "glium";
    version = "0.23.0";
    authors = [ "Pierre Krieger <pierre.krieger1708@gmail.com>" ];
    sha256 = "05pdh0fciyxln3nyzad7cr2gfxz3aj6axrl21vdpzm682k4ijwm0";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."backtrace"."${deps."glium"."0.23.0"."backtrace"}" deps)
      (crates."fnv"."${deps."glium"."0.23.0"."fnv"}" deps)
      (crates."lazy_static"."${deps."glium"."0.23.0"."lazy_static"}" deps)
      (crates."smallvec"."${deps."glium"."0.23.0"."smallvec"}" deps)
    ]
      ++ (if features.glium."0.23.0".glutin or false then [ (crates.glutin."${deps."glium"."0.23.0".glutin}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."gl_generator"."${deps."glium"."0.23.0"."gl_generator"}" deps)
    ]);
    features = mkFeatures (features."glium"."0.23.0" or {});
  };
  features_.glium."0.23.0" = deps: f: updateFeatures f (rec {
    backtrace."${deps.glium."0.23.0".backtrace}".default = true;
    fnv."${deps.glium."0.23.0".fnv}".default = true;
    gl_generator."${deps.glium."0.23.0".gl_generator}".default = true;
    glium = fold recursiveUpdate {} [
      { "0.23.0".default = (f.glium."0.23.0".default or true); }
      { "0.23.0".glutin =
        (f.glium."0.23.0".glutin or false) ||
        (f.glium."0.23.0".default or false) ||
        (glium."0.23.0"."default" or false); }
    ];
    glutin = fold recursiveUpdate {} [
      { "${deps.glium."0.23.0".glutin}"."icon_loading" =
        (f.glutin."${deps.glium."0.23.0".glutin}"."icon_loading" or false) ||
        (glium."0.23.0"."icon_loading" or false) ||
        (f."glium"."0.23.0"."icon_loading" or false); }
      { "${deps.glium."0.23.0".glutin}".default = true; }
    ];
    lazy_static."${deps.glium."0.23.0".lazy_static}".default = true;
    smallvec."${deps.glium."0.23.0".smallvec}".default = true;
  }) [
    (features_.backtrace."${deps."glium"."0.23.0"."backtrace"}" deps)
    (features_.fnv."${deps."glium"."0.23.0"."fnv"}" deps)
    (features_.glutin."${deps."glium"."0.23.0"."glutin"}" deps)
    (features_.lazy_static."${deps."glium"."0.23.0"."lazy_static"}" deps)
    (features_.smallvec."${deps."glium"."0.23.0"."smallvec"}" deps)
    (features_.gl_generator."${deps."glium"."0.23.0"."gl_generator"}" deps)
  ];


# end
# glutin-0.19.0

  crates.glutin."0.19.0" = deps: { features?(features_.glutin."0.19.0" deps {}) }: buildRustCrate {
    crateName = "glutin";
    version = "0.19.0";
    authors = [ "The glutin contributors" "Pierre Krieger <pierre.krieger1708@gmail.com>" ];
    sha256 = "0w94fcrwbkma99dnjzsf3x73hb5xg5yc8fa22jrl9jankpgsk6zm";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."glutin"."0.19.0"."lazy_static"}" deps)
      (crates."libc"."${deps."glutin"."0.19.0"."libc"}" deps)
      (crates."shared_library"."${deps."glutin"."0.19.0"."shared_library"}" deps)
      (crates."winit"."${deps."glutin"."0.19.0"."winit"}" deps)
    ])
      ++ (if kernel == "linux" || kernel == "freebsd" || kernel == "dragonfly" || kernel == "openbsd" then mapFeatures features ([
      (crates."osmesa_sys"."${deps."glutin"."0.19.0"."osmesa_sys"}" deps)
      (crates."wayland_client"."${deps."glutin"."0.19.0"."wayland_client"}" deps)
      (crates."x11_dl"."${deps."glutin"."0.19.0"."x11_dl"}" deps)
    ]) else [])
      ++ (if kernel == "android" then mapFeatures features ([
      (crates."android_glue"."${deps."glutin"."0.19.0"."android_glue"}" deps)
    ]) else [])
      ++ (if kernel == "ios" then mapFeatures features ([
      (crates."objc"."${deps."glutin"."0.19.0"."objc"}" deps)
    ]) else [])
      ++ (if kernel == "darwin" then mapFeatures features ([
      (crates."cgl"."${deps."glutin"."0.19.0"."cgl"}" deps)
      (crates."cocoa"."${deps."glutin"."0.19.0"."cocoa"}" deps)
      (crates."core_foundation"."${deps."glutin"."0.19.0"."core_foundation"}" deps)
      (crates."core_graphics"."${deps."glutin"."0.19.0"."core_graphics"}" deps)
      (crates."objc"."${deps."glutin"."0.19.0"."objc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."glutin"."0.19.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."gl_generator"."${deps."glutin"."0.19.0"."gl_generator"}" deps)
    ]);
    features = mkFeatures (features."glutin"."0.19.0" or {});
  };
  features_.glutin."0.19.0" = deps: f: updateFeatures f (rec {
    android_glue."${deps.glutin."0.19.0".android_glue}".default = true;
    cgl."${deps.glutin."0.19.0".cgl}".default = true;
    cocoa."${deps.glutin."0.19.0".cocoa}".default = true;
    core_foundation."${deps.glutin."0.19.0".core_foundation}".default = true;
    core_graphics."${deps.glutin."0.19.0".core_graphics}".default = true;
    gl_generator."${deps.glutin."0.19.0".gl_generator}".default = true;
    glutin."0.19.0".default = (f.glutin."0.19.0".default or true);
    lazy_static."${deps.glutin."0.19.0".lazy_static}".default = true;
    libc."${deps.glutin."0.19.0".libc}".default = true;
    objc."${deps.glutin."0.19.0".objc}".default = true;
    osmesa_sys."${deps.glutin."0.19.0".osmesa_sys}".default = true;
    shared_library."${deps.glutin."0.19.0".shared_library}".default = true;
    wayland_client = fold recursiveUpdate {} [
      { "${deps.glutin."0.19.0".wayland_client}"."dlopen" = true; }
      { "${deps.glutin."0.19.0".wayland_client}"."egl" = true; }
      { "${deps.glutin."0.19.0".wayland_client}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.glutin."0.19.0".winapi}"."libloaderapi" = true; }
      { "${deps.glutin."0.19.0".winapi}"."wingdi" = true; }
      { "${deps.glutin."0.19.0".winapi}"."winnt" = true; }
      { "${deps.glutin."0.19.0".winapi}"."winuser" = true; }
      { "${deps.glutin."0.19.0".winapi}".default = true; }
    ];
    winit = fold recursiveUpdate {} [
      { "${deps.glutin."0.19.0".winit}"."icon_loading" =
        (f.winit."${deps.glutin."0.19.0".winit}"."icon_loading" or false) ||
        (glutin."0.19.0"."icon_loading" or false) ||
        (f."glutin"."0.19.0"."icon_loading" or false); }
      { "${deps.glutin."0.19.0".winit}"."serde" =
        (f.winit."${deps.glutin."0.19.0".winit}"."serde" or false) ||
        (glutin."0.19.0"."serde" or false) ||
        (f."glutin"."0.19.0"."serde" or false); }
      { "${deps.glutin."0.19.0".winit}".default = true; }
    ];
    x11_dl."${deps.glutin."0.19.0".x11_dl}".default = true;
  }) [
    (features_.lazy_static."${deps."glutin"."0.19.0"."lazy_static"}" deps)
    (features_.libc."${deps."glutin"."0.19.0"."libc"}" deps)
    (features_.shared_library."${deps."glutin"."0.19.0"."shared_library"}" deps)
    (features_.winit."${deps."glutin"."0.19.0"."winit"}" deps)
    (features_.gl_generator."${deps."glutin"."0.19.0"."gl_generator"}" deps)
    (features_.osmesa_sys."${deps."glutin"."0.19.0"."osmesa_sys"}" deps)
    (features_.wayland_client."${deps."glutin"."0.19.0"."wayland_client"}" deps)
    (features_.x11_dl."${deps."glutin"."0.19.0"."x11_dl"}" deps)
    (features_.android_glue."${deps."glutin"."0.19.0"."android_glue"}" deps)
    (features_.objc."${deps."glutin"."0.19.0"."objc"}" deps)
    (features_.cgl."${deps."glutin"."0.19.0"."cgl"}" deps)
    (features_.cocoa."${deps."glutin"."0.19.0"."cocoa"}" deps)
    (features_.core_foundation."${deps."glutin"."0.19.0"."core_foundation"}" deps)
    (features_.core_graphics."${deps."glutin"."0.19.0"."core_graphics"}" deps)
    (features_.objc."${deps."glutin"."0.19.0"."objc"}" deps)
    (features_.winapi."${deps."glutin"."0.19.0"."winapi"}" deps)
  ];


# end
# h2-0.1.16

  crates.h2."0.1.16" = deps: { features?(features_.h2."0.1.16" deps {}) }: buildRustCrate {
    crateName = "h2";
    version = "0.1.16";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1c50yfizd5x9hdcnj07bjlaa1wjzqlkxqjf89a15jq6j39i24r04";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."h2"."0.1.16"."byteorder"}" deps)
      (crates."bytes"."${deps."h2"."0.1.16"."bytes"}" deps)
      (crates."fnv"."${deps."h2"."0.1.16"."fnv"}" deps)
      (crates."futures"."${deps."h2"."0.1.16"."futures"}" deps)
      (crates."http"."${deps."h2"."0.1.16"."http"}" deps)
      (crates."indexmap"."${deps."h2"."0.1.16"."indexmap"}" deps)
      (crates."log"."${deps."h2"."0.1.16"."log"}" deps)
      (crates."slab"."${deps."h2"."0.1.16"."slab"}" deps)
      (crates."string"."${deps."h2"."0.1.16"."string"}" deps)
      (crates."tokio_io"."${deps."h2"."0.1.16"."tokio_io"}" deps)
    ]);
    features = mkFeatures (features."h2"."0.1.16" or {});
  };
  features_.h2."0.1.16" = deps: f: updateFeatures f (rec {
    byteorder."${deps.h2."0.1.16".byteorder}".default = true;
    bytes."${deps.h2."0.1.16".bytes}".default = true;
    fnv."${deps.h2."0.1.16".fnv}".default = true;
    futures."${deps.h2."0.1.16".futures}".default = true;
    h2."0.1.16".default = (f.h2."0.1.16".default or true);
    http."${deps.h2."0.1.16".http}".default = true;
    indexmap."${deps.h2."0.1.16".indexmap}".default = true;
    log."${deps.h2."0.1.16".log}".default = true;
    slab."${deps.h2."0.1.16".slab}".default = true;
    string."${deps.h2."0.1.16".string}".default = true;
    tokio_io."${deps.h2."0.1.16".tokio_io}".default = true;
  }) [
    (features_.byteorder."${deps."h2"."0.1.16"."byteorder"}" deps)
    (features_.bytes."${deps."h2"."0.1.16"."bytes"}" deps)
    (features_.fnv."${deps."h2"."0.1.16"."fnv"}" deps)
    (features_.futures."${deps."h2"."0.1.16"."futures"}" deps)
    (features_.http."${deps."h2"."0.1.16"."http"}" deps)
    (features_.indexmap."${deps."h2"."0.1.16"."indexmap"}" deps)
    (features_.log."${deps."h2"."0.1.16"."log"}" deps)
    (features_.slab."${deps."h2"."0.1.16"."slab"}" deps)
    (features_.string."${deps."h2"."0.1.16"."string"}" deps)
    (features_.tokio_io."${deps."h2"."0.1.16"."tokio_io"}" deps)
  ];


# end
# heck-0.3.1

  crates.heck."0.3.1" = deps: { features?(features_.heck."0.3.1" deps {}) }: buildRustCrate {
    crateName = "heck";
    version = "0.3.1";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1q7vmnlh62kls6cvkfhbcacxkawaznaqa5wwm9dg1xkcza846c3d";
    dependencies = mapFeatures features ([
      (crates."unicode_segmentation"."${deps."heck"."0.3.1"."unicode_segmentation"}" deps)
    ]);
  };
  features_.heck."0.3.1" = deps: f: updateFeatures f (rec {
    heck."0.3.1".default = (f.heck."0.3.1".default or true);
    unicode_segmentation."${deps.heck."0.3.1".unicode_segmentation}".default = true;
  }) [
    (features_.unicode_segmentation."${deps."heck"."0.3.1"."unicode_segmentation"}" deps)
  ];


# end
# hex-0.3.2

  crates.hex."0.3.2" = deps: { features?(features_.hex."0.3.2" deps {}) }: buildRustCrate {
    crateName = "hex";
    version = "0.3.2";
    authors = [ "KokaKiwi <kokakiwi@kokakiwi.net>" ];
    sha256 = "0hs0xfb4x67y4ss9mmbjmibkwakbn3xf23i21m409bw2zqk9b6kz";
    features = mkFeatures (features."hex"."0.3.2" or {});
  };
  features_.hex."0.3.2" = deps: f: updateFeatures f (rec {
    hex."0.3.2".default = (f.hex."0.3.2".default or true);
  }) [];


# end
# hmac-0.7.0

  crates.hmac."0.7.0" = deps: { features?(features_.hmac."0.7.0" deps {}) }: buildRustCrate {
    crateName = "hmac";
    version = "0.7.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0fijqj51n59fc7902kf057499mqkqh2n0hahq0p3f3i2d96qrm50";
    dependencies = mapFeatures features ([
      (crates."crypto_mac"."${deps."hmac"."0.7.0"."crypto_mac"}" deps)
      (crates."digest"."${deps."hmac"."0.7.0"."digest"}" deps)
    ]);
  };
  features_.hmac."0.7.0" = deps: f: updateFeatures f (rec {
    crypto_mac."${deps.hmac."0.7.0".crypto_mac}".default = true;
    digest."${deps.hmac."0.7.0".digest}".default = true;
    hmac."0.7.0".default = (f.hmac."0.7.0".default or true);
  }) [
    (features_.crypto_mac."${deps."hmac"."0.7.0"."crypto_mac"}" deps)
    (features_.digest."${deps."hmac"."0.7.0"."digest"}" deps)
  ];


# end
# http-0.1.15

  crates.http."0.1.15" = deps: { features?(features_.http."0.1.15" deps {}) }: buildRustCrate {
    crateName = "http";
    version = "0.1.15";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Carl Lerche <me@carllerche.com>" "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0h93aig6l3wxjisa6iy9glb3qiddy8528i8wvvpn0n3y8wa31h5d";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."http"."0.1.15"."bytes"}" deps)
      (crates."fnv"."${deps."http"."0.1.15"."fnv"}" deps)
      (crates."itoa"."${deps."http"."0.1.15"."itoa"}" deps)
    ]);
  };
  features_.http."0.1.15" = deps: f: updateFeatures f (rec {
    bytes."${deps.http."0.1.15".bytes}".default = true;
    fnv."${deps.http."0.1.15".fnv}".default = true;
    http."0.1.15".default = (f.http."0.1.15".default or true);
    itoa."${deps.http."0.1.15".itoa}".default = true;
  }) [
    (features_.bytes."${deps."http"."0.1.15"."bytes"}" deps)
    (features_.fnv."${deps."http"."0.1.15"."fnv"}" deps)
    (features_.itoa."${deps."http"."0.1.15"."itoa"}" deps)
  ];


# end
# httparse-1.3.3

  crates.httparse."1.3.3" = deps: { features?(features_.httparse."1.3.3" deps {}) }: buildRustCrate {
    crateName = "httparse";
    version = "1.3.3";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1jymxy4bl0mzgp2dx0pzqzbr72sw5jmr5sjqiry4xr88z4z9qlyx";
    build = "build.rs";
    features = mkFeatures (features."httparse"."1.3.3" or {});
  };
  features_.httparse."1.3.3" = deps: f: updateFeatures f (rec {
    httparse = fold recursiveUpdate {} [
      { "1.3.3".default = (f.httparse."1.3.3".default or true); }
      { "1.3.3".std =
        (f.httparse."1.3.3".std or false) ||
        (f.httparse."1.3.3".default or false) ||
        (httparse."1.3.3"."default" or false); }
    ];
  }) [];


# end
# hyper-0.12.24

  crates.hyper."0.12.24" = deps: { features?(features_.hyper."0.12.24" deps {}) }: buildRustCrate {
    crateName = "hyper";
    version = "0.12.24";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0y1wl8ijg3a6r3c3061w73r9w5472bamcq487c1vcm7z5651in31";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."hyper"."0.12.24"."bytes"}" deps)
      (crates."futures"."${deps."hyper"."0.12.24"."futures"}" deps)
      (crates."h2"."${deps."hyper"."0.12.24"."h2"}" deps)
      (crates."http"."${deps."hyper"."0.12.24"."http"}" deps)
      (crates."httparse"."${deps."hyper"."0.12.24"."httparse"}" deps)
      (crates."iovec"."${deps."hyper"."0.12.24"."iovec"}" deps)
      (crates."itoa"."${deps."hyper"."0.12.24"."itoa"}" deps)
      (crates."log"."${deps."hyper"."0.12.24"."log"}" deps)
      (crates."time"."${deps."hyper"."0.12.24"."time"}" deps)
      (crates."tokio_io"."${deps."hyper"."0.12.24"."tokio_io"}" deps)
      (crates."want"."${deps."hyper"."0.12.24"."want"}" deps)
    ]
      ++ (if features.hyper."0.12.24".futures-cpupool or false then [ (crates.futures_cpupool."${deps."hyper"."0.12.24".futures_cpupool}" deps) ] else [])
      ++ (if features.hyper."0.12.24".net2 or false then [ (crates.net2."${deps."hyper"."0.12.24".net2}" deps) ] else [])
      ++ (if features.hyper."0.12.24".tokio or false then [ (crates.tokio."${deps."hyper"."0.12.24".tokio}" deps) ] else [])
      ++ (if features.hyper."0.12.24".tokio-executor or false then [ (crates.tokio_executor."${deps."hyper"."0.12.24".tokio_executor}" deps) ] else [])
      ++ (if features.hyper."0.12.24".tokio-reactor or false then [ (crates.tokio_reactor."${deps."hyper"."0.12.24".tokio_reactor}" deps) ] else [])
      ++ (if features.hyper."0.12.24".tokio-tcp or false then [ (crates.tokio_tcp."${deps."hyper"."0.12.24".tokio_tcp}" deps) ] else [])
      ++ (if features.hyper."0.12.24".tokio-threadpool or false then [ (crates.tokio_threadpool."${deps."hyper"."0.12.24".tokio_threadpool}" deps) ] else [])
      ++ (if features.hyper."0.12.24".tokio-timer or false then [ (crates.tokio_timer."${deps."hyper"."0.12.24".tokio_timer}" deps) ] else []));
    features = mkFeatures (features."hyper"."0.12.24" or {});
  };
  features_.hyper."0.12.24" = deps: f: updateFeatures f (rec {
    bytes."${deps.hyper."0.12.24".bytes}".default = true;
    futures."${deps.hyper."0.12.24".futures}".default = true;
    futures_cpupool."${deps.hyper."0.12.24".futures_cpupool}".default = true;
    h2."${deps.hyper."0.12.24".h2}".default = true;
    http."${deps.hyper."0.12.24".http}".default = true;
    httparse."${deps.hyper."0.12.24".httparse}".default = true;
    hyper = fold recursiveUpdate {} [
      { "0.12.24".__internal_flaky_tests =
        (f.hyper."0.12.24".__internal_flaky_tests or false) ||
        (f.hyper."0.12.24".default or false) ||
        (hyper."0.12.24"."default" or false); }
      { "0.12.24".default = (f.hyper."0.12.24".default or true); }
      { "0.12.24".futures-cpupool =
        (f.hyper."0.12.24".futures-cpupool or false) ||
        (f.hyper."0.12.24".runtime or false) ||
        (hyper."0.12.24"."runtime" or false); }
      { "0.12.24".net2 =
        (f.hyper."0.12.24".net2 or false) ||
        (f.hyper."0.12.24".runtime or false) ||
        (hyper."0.12.24"."runtime" or false); }
      { "0.12.24".runtime =
        (f.hyper."0.12.24".runtime or false) ||
        (f.hyper."0.12.24".default or false) ||
        (hyper."0.12.24"."default" or false); }
      { "0.12.24".tokio =
        (f.hyper."0.12.24".tokio or false) ||
        (f.hyper."0.12.24".runtime or false) ||
        (hyper."0.12.24"."runtime" or false); }
      { "0.12.24".tokio-executor =
        (f.hyper."0.12.24".tokio-executor or false) ||
        (f.hyper."0.12.24".runtime or false) ||
        (hyper."0.12.24"."runtime" or false); }
      { "0.12.24".tokio-reactor =
        (f.hyper."0.12.24".tokio-reactor or false) ||
        (f.hyper."0.12.24".runtime or false) ||
        (hyper."0.12.24"."runtime" or false); }
      { "0.12.24".tokio-tcp =
        (f.hyper."0.12.24".tokio-tcp or false) ||
        (f.hyper."0.12.24".runtime or false) ||
        (hyper."0.12.24"."runtime" or false); }
      { "0.12.24".tokio-threadpool =
        (f.hyper."0.12.24".tokio-threadpool or false) ||
        (f.hyper."0.12.24".runtime or false) ||
        (hyper."0.12.24"."runtime" or false); }
      { "0.12.24".tokio-timer =
        (f.hyper."0.12.24".tokio-timer or false) ||
        (f.hyper."0.12.24".runtime or false) ||
        (hyper."0.12.24"."runtime" or false); }
    ];
    iovec."${deps.hyper."0.12.24".iovec}".default = true;
    itoa."${deps.hyper."0.12.24".itoa}".default = true;
    log."${deps.hyper."0.12.24".log}".default = true;
    net2."${deps.hyper."0.12.24".net2}".default = true;
    time."${deps.hyper."0.12.24".time}".default = true;
    tokio = fold recursiveUpdate {} [
      { "${deps.hyper."0.12.24".tokio}"."rt-full" = true; }
      { "${deps.hyper."0.12.24".tokio}".default = (f.tokio."${deps.hyper."0.12.24".tokio}".default or false); }
    ];
    tokio_executor."${deps.hyper."0.12.24".tokio_executor}".default = true;
    tokio_io."${deps.hyper."0.12.24".tokio_io}".default = true;
    tokio_reactor."${deps.hyper."0.12.24".tokio_reactor}".default = true;
    tokio_tcp."${deps.hyper."0.12.24".tokio_tcp}".default = true;
    tokio_threadpool."${deps.hyper."0.12.24".tokio_threadpool}".default = true;
    tokio_timer."${deps.hyper."0.12.24".tokio_timer}".default = true;
    want."${deps.hyper."0.12.24".want}".default = true;
  }) [
    (features_.bytes."${deps."hyper"."0.12.24"."bytes"}" deps)
    (features_.futures."${deps."hyper"."0.12.24"."futures"}" deps)
    (features_.futures_cpupool."${deps."hyper"."0.12.24"."futures_cpupool"}" deps)
    (features_.h2."${deps."hyper"."0.12.24"."h2"}" deps)
    (features_.http."${deps."hyper"."0.12.24"."http"}" deps)
    (features_.httparse."${deps."hyper"."0.12.24"."httparse"}" deps)
    (features_.iovec."${deps."hyper"."0.12.24"."iovec"}" deps)
    (features_.itoa."${deps."hyper"."0.12.24"."itoa"}" deps)
    (features_.log."${deps."hyper"."0.12.24"."log"}" deps)
    (features_.net2."${deps."hyper"."0.12.24"."net2"}" deps)
    (features_.time."${deps."hyper"."0.12.24"."time"}" deps)
    (features_.tokio."${deps."hyper"."0.12.24"."tokio"}" deps)
    (features_.tokio_executor."${deps."hyper"."0.12.24"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."hyper"."0.12.24"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."hyper"."0.12.24"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."hyper"."0.12.24"."tokio_tcp"}" deps)
    (features_.tokio_threadpool."${deps."hyper"."0.12.24"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."hyper"."0.12.24"."tokio_timer"}" deps)
    (features_.want."${deps."hyper"."0.12.24"."want"}" deps)
  ];


# end
# hyper-tls-0.3.1

  crates.hyper_tls."0.3.1" = deps: { features?(features_.hyper_tls."0.3.1" deps {}) }: buildRustCrate {
    crateName = "hyper-tls";
    version = "0.3.1";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0sk46mmnccxgxwn62rl5m58c2ivwgxgd590cjwg60pjkhx9qn5r7";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."hyper_tls"."0.3.1"."bytes"}" deps)
      (crates."futures"."${deps."hyper_tls"."0.3.1"."futures"}" deps)
      (crates."hyper"."${deps."hyper_tls"."0.3.1"."hyper"}" deps)
      (crates."native_tls"."${deps."hyper_tls"."0.3.1"."native_tls"}" deps)
      (crates."tokio_io"."${deps."hyper_tls"."0.3.1"."tokio_io"}" deps)
    ]);
    features = mkFeatures (features."hyper_tls"."0.3.1" or {});
  };
  features_.hyper_tls."0.3.1" = deps: f: updateFeatures f (rec {
    bytes."${deps.hyper_tls."0.3.1".bytes}".default = true;
    futures."${deps.hyper_tls."0.3.1".futures}".default = true;
    hyper."${deps.hyper_tls."0.3.1".hyper}".default = true;
    hyper_tls."0.3.1".default = (f.hyper_tls."0.3.1".default or true);
    native_tls = fold recursiveUpdate {} [
      { "${deps.hyper_tls."0.3.1".native_tls}"."vendored" =
        (f.native_tls."${deps.hyper_tls."0.3.1".native_tls}"."vendored" or false) ||
        (hyper_tls."0.3.1"."vendored" or false) ||
        (f."hyper_tls"."0.3.1"."vendored" or false); }
      { "${deps.hyper_tls."0.3.1".native_tls}".default = true; }
    ];
    tokio_io."${deps.hyper_tls."0.3.1".tokio_io}".default = true;
  }) [
    (features_.bytes."${deps."hyper_tls"."0.3.1"."bytes"}" deps)
    (features_.futures."${deps."hyper_tls"."0.3.1"."futures"}" deps)
    (features_.hyper."${deps."hyper_tls"."0.3.1"."hyper"}" deps)
    (features_.native_tls."${deps."hyper_tls"."0.3.1"."native_tls"}" deps)
    (features_.tokio_io."${deps."hyper_tls"."0.3.1"."tokio_io"}" deps)
  ];


# end
# ident_case-1.0.0

  crates.ident_case."1.0.0" = deps: { features?(features_.ident_case."1.0.0" deps {}) }: buildRustCrate {
    crateName = "ident_case";
    version = "1.0.0";
    authors = [ "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "030qq2fqx2m49j4p816mkrji7ljwi551ff3i592wrwk134zwvcd2";
  };
  features_.ident_case."1.0.0" = deps: f: updateFeatures f (rec {
    ident_case."1.0.0".default = (f.ident_case."1.0.0".default or true);
  }) [];


# end
# idna-0.1.5

  crates.idna."0.1.5" = deps: { features?(features_.idna."0.1.5" deps {}) }: buildRustCrate {
    crateName = "idna";
    version = "0.1.5";
    authors = [ "The rust-url developers" ];
    sha256 = "1gwgl19rz5vzi67rrhamczhxy050f5ynx4ybabfapyalv7z1qmjy";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."idna"."0.1.5"."matches"}" deps)
      (crates."unicode_bidi"."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
      (crates."unicode_normalization"."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
    ]);
  };
  features_.idna."0.1.5" = deps: f: updateFeatures f (rec {
    idna."0.1.5".default = (f.idna."0.1.5".default or true);
    matches."${deps.idna."0.1.5".matches}".default = true;
    unicode_bidi."${deps.idna."0.1.5".unicode_bidi}".default = true;
    unicode_normalization."${deps.idna."0.1.5".unicode_normalization}".default = true;
  }) [
    (features_.matches."${deps."idna"."0.1.5"."matches"}" deps)
    (features_.unicode_bidi."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
    (features_.unicode_normalization."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
  ];


# end
# indexmap-1.0.2

  crates.indexmap."1.0.2" = deps: { features?(features_.indexmap."1.0.2" deps {}) }: buildRustCrate {
    crateName = "indexmap";
    version = "1.0.2";
    authors = [ "bluss" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "18a0cn5xy3a7wswxg5lwfg3j4sh5blk28ykw0ysgr486djd353gf";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."indexmap"."1.0.2" or {});
  };
  features_.indexmap."1.0.2" = deps: f: updateFeatures f (rec {
    indexmap = fold recursiveUpdate {} [
      { "1.0.2".default = (f.indexmap."1.0.2".default or true); }
      { "1.0.2".serde =
        (f.indexmap."1.0.2".serde or false) ||
        (f.indexmap."1.0.2".serde-1 or false) ||
        (indexmap."1.0.2"."serde-1" or false); }
    ];
  }) [];


# end
# iovec-0.1.2

  crates.iovec."0.1.2" = deps: { features?(features_.iovec."0.1.2" deps {}) }: buildRustCrate {
    crateName = "iovec";
    version = "0.1.2";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0vjymmb7wj4v4kza5jjn48fcdb85j3k37y7msjl3ifz0p9yiyp2r";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."iovec"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."iovec"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.iovec."0.1.2" = deps: f: updateFeatures f (rec {
    iovec."0.1.2".default = (f.iovec."0.1.2".default or true);
    libc."${deps.iovec."0.1.2".libc}".default = true;
    winapi."${deps.iovec."0.1.2".winapi}".default = true;
  }) [
    (features_.libc."${deps."iovec"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."iovec"."0.1.2"."winapi"}" deps)
  ];


# end
# itoa-0.4.3

  crates.itoa."0.4.3" = deps: { features?(features_.itoa."0.4.3" deps {}) }: buildRustCrate {
    crateName = "itoa";
    version = "0.4.3";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0zadimmdgvili3gdwxqg7ljv3r4wcdg1kkdfp9nl15vnm23vrhy1";
    features = mkFeatures (features."itoa"."0.4.3" or {});
  };
  features_.itoa."0.4.3" = deps: f: updateFeatures f (rec {
    itoa = fold recursiveUpdate {} [
      { "0.4.3".default = (f.itoa."0.4.3".default or true); }
      { "0.4.3".std =
        (f.itoa."0.4.3".std or false) ||
        (f.itoa."0.4.3".default or false) ||
        (itoa."0.4.3"."default" or false); }
    ];
  }) [];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# khronos_api-3.0.0

  crates.khronos_api."3.0.0" = deps: { features?(features_.khronos_api."3.0.0" deps {}) }: buildRustCrate {
    crateName = "khronos_api";
    version = "3.0.0";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" "Corey Richardson" "Arseny Kapoulkine" "Pierre Krieger <pierre.krieger1708@gmail.com>" ];
    sha256 = "1w8n6b69zpf2vfdd9pq63g2x2l35g1k93n0p0m8jdl26dlk3khz0";
  };
  features_.khronos_api."3.0.0" = deps: f: updateFeatures f (rec {
    khronos_api."3.0.0".default = (f.khronos_api."3.0.0".default or true);
  }) [];


# end
# lazy_static-0.2.11

  crates.lazy_static."0.2.11" = deps: { features?(features_.lazy_static."0.2.11" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "0.2.11";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1x6871cvpy5b96yv4c7jvpq316fp5d4609s9py7qk6cd6x9k34vm";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."0.2.11" or {});
  };
  features_.lazy_static."0.2.11" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "0.2.11".compiletest_rs =
        (f.lazy_static."0.2.11".compiletest_rs or false) ||
        (f.lazy_static."0.2.11".compiletest or false) ||
        (lazy_static."0.2.11"."compiletest" or false); }
      { "0.2.11".default = (f.lazy_static."0.2.11".default or true); }
      { "0.2.11".nightly =
        (f.lazy_static."0.2.11".nightly or false) ||
        (f.lazy_static."0.2.11".spin_no_std or false) ||
        (lazy_static."0.2.11"."spin_no_std" or false); }
      { "0.2.11".spin =
        (f.lazy_static."0.2.11".spin or false) ||
        (f.lazy_static."0.2.11".spin_no_std or false) ||
        (lazy_static."0.2.11"."spin_no_std" or false); }
    ];
  }) [];


# end
# lazy_static-1.2.0

  crates.lazy_static."1.2.0" = deps: { features?(features_.lazy_static."1.2.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.2.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "07p3b30k2akyr6xw08ggd5qiz5nw3vd3agggj360fcc1njz7d0ss";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.2.0" or {});
  };
  features_.lazy_static."1.2.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.2.0".default = (f.lazy_static."1.2.0".default or true); }
      { "1.2.0".spin =
        (f.lazy_static."1.2.0".spin or false) ||
        (f.lazy_static."1.2.0".spin_no_std or false) ||
        (lazy_static."1.2.0"."spin_no_std" or false); }
    ];
  }) [];


# end
# lazycell-1.2.1

  crates.lazycell."1.2.1" = deps: { features?(features_.lazycell."1.2.1" deps {}) }: buildRustCrate {
    crateName = "lazycell";
    version = "1.2.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Nikita Pekin <contact@nikitapek.in>" ];
    sha256 = "1m4h2q9rgxrgc7xjnws1x81lrb68jll8w3pykx1a9bhr29q2mcwm";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazycell"."1.2.1" or {});
  };
  features_.lazycell."1.2.1" = deps: f: updateFeatures f (rec {
    lazycell = fold recursiveUpdate {} [
      { "1.2.1".clippy =
        (f.lazycell."1.2.1".clippy or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
      { "1.2.1".default = (f.lazycell."1.2.1".default or true); }
      { "1.2.1".nightly =
        (f.lazycell."1.2.1".nightly or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
    ];
  }) [];


# end
# libc-0.2.48

  crates.libc."0.2.48" = deps: { features?(features_.libc."0.2.48" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.48";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1jnjd4g9ibs02gd7z81amj7p1xkari0ciwg9if285fxnml4lmwxs";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.48" or {});
  };
  features_.libc."0.2.48" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.48".align =
        (f.libc."0.2.48".align or false) ||
        (f.libc."0.2.48".rustc-dep-of-std or false) ||
        (libc."0.2.48"."rustc-dep-of-std" or false); }
      { "0.2.48".default = (f.libc."0.2.48".default or true); }
      { "0.2.48".rustc-std-workspace-core =
        (f.libc."0.2.48".rustc-std-workspace-core or false) ||
        (f.libc."0.2.48".rustc-dep-of-std or false) ||
        (libc."0.2.48"."rustc-dep-of-std" or false); }
      { "0.2.48".use_std =
        (f.libc."0.2.48".use_std or false) ||
        (f.libc."0.2.48".default or false) ||
        (libc."0.2.48"."default" or false); }
    ];
  }) [];


# end
# libdbus-sys-0.1.5

  crates.libdbus_sys."0.1.5" = deps: { features?(features_.libdbus_sys."0.1.5" deps {}) }: buildRustCrate {
    crateName = "libdbus-sys";
    version = "0.1.5";
    authors = [ "David Henningsson <diwic@ubuntu.com>" ];
    sha256 = "0g0mfqgwpqggxiy7ccxq997kk8c23djikhgqla3xzsqnmjwxs79i";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."pkg_config"."${deps."libdbus_sys"."0.1.5"."pkg_config"}" deps)
    ]);
  };
  features_.libdbus_sys."0.1.5" = deps: f: updateFeatures f (rec {
    libdbus_sys."0.1.5".default = (f.libdbus_sys."0.1.5".default or true);
    pkg_config."${deps.libdbus_sys."0.1.5".pkg_config}".default = true;
  }) [
    (features_.pkg_config."${deps."libdbus_sys"."0.1.5"."pkg_config"}" deps)
  ];


# end
# libflate-0.1.19

  crates.libflate."0.1.19" = deps: { features?(features_.libflate."0.1.19" deps {}) }: buildRustCrate {
    crateName = "libflate";
    version = "0.1.19";
    authors = [ "Takeru Ohta <phjgt308@gmail.com>" ];
    sha256 = "1klhvys9541xrwspyyv41qbr37xnwx4bdaspk6gbiprhrsqqkjp0";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."libflate"."0.1.19"."adler32"}" deps)
      (crates."byteorder"."${deps."libflate"."0.1.19"."byteorder"}" deps)
      (crates."crc32fast"."${deps."libflate"."0.1.19"."crc32fast"}" deps)
    ]);
  };
  features_.libflate."0.1.19" = deps: f: updateFeatures f (rec {
    adler32."${deps.libflate."0.1.19".adler32}".default = true;
    byteorder."${deps.libflate."0.1.19".byteorder}".default = true;
    crc32fast."${deps.libflate."0.1.19".crc32fast}".default = true;
    libflate."0.1.19".default = (f.libflate."0.1.19".default or true);
  }) [
    (features_.adler32."${deps."libflate"."0.1.19"."adler32"}" deps)
    (features_.byteorder."${deps."libflate"."0.1.19"."byteorder"}" deps)
    (features_.crc32fast."${deps."libflate"."0.1.19"."crc32fast"}" deps)
  ];


# end
# libloading-0.5.0

  crates.libloading."0.5.0" = deps: { features?(features_.libloading."0.5.0" deps {}) }: buildRustCrate {
    crateName = "libloading";
    version = "0.5.0";
    authors = [ "Simonas Kazlauskas <libloading@kazlauskas.me>" ];
    sha256 = "11vzjaka1y979aril4ggwp33p35yz2isvx9m5w88r5sdcmq6iscn";
    build = "build.rs";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."libloading"."0.5.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libloading"."0.5.0"."cc"}" deps)
    ]);
  };
  features_.libloading."0.5.0" = deps: f: updateFeatures f (rec {
    cc."${deps.libloading."0.5.0".cc}".default = true;
    libloading."0.5.0".default = (f.libloading."0.5.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.libloading."0.5.0".winapi}"."errhandlingapi" = true; }
      { "${deps.libloading."0.5.0".winapi}"."libloaderapi" = true; }
      { "${deps.libloading."0.5.0".winapi}"."winerror" = true; }
      { "${deps.libloading."0.5.0".winapi}".default = true; }
    ];
  }) [
    (features_.cc."${deps."libloading"."0.5.0"."cc"}" deps)
    (features_.winapi."${deps."libloading"."0.5.0"."winapi"}" deps)
  ];


# end
# line_drawing-0.7.0

  crates.line_drawing."0.7.0" = deps: { features?(features_.line_drawing."0.7.0" deps {}) }: buildRustCrate {
    crateName = "line_drawing";
    version = "0.7.0";
    authors = [ "Expenses <expenses@airmail.cc>" ];
    sha256 = "0fmb608ybsihc78187s36z54lw1a244wsjks4f0b45capgfdq7fw";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."line_drawing"."0.7.0"."num_traits"}" deps)
    ]);
  };
  features_.line_drawing."0.7.0" = deps: f: updateFeatures f (rec {
    line_drawing."0.7.0".default = (f.line_drawing."0.7.0".default or true);
    num_traits."${deps.line_drawing."0.7.0".num_traits}".default = true;
  }) [
    (features_.num_traits."${deps."line_drawing"."0.7.0"."num_traits"}" deps)
  ];


# end
# linked-hash-map-0.3.0

  crates.linked_hash_map."0.3.0" = deps: { features?(features_.linked_hash_map."0.3.0" deps {}) }: buildRustCrate {
    crateName = "linked-hash-map";
    version = "0.3.0";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" "Andrew Paseltiner <apaseltiner@gmail.com>" ];
    sha256 = "03fh0w77z5fwry1y37nfim9d23gikz7855050hzjds6k419vs4ls";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.linked_hash_map."0.3.0".serde or false then [ (crates.serde."${deps."linked_hash_map"."0.3.0".serde}" deps) ] else [])
      ++ (if features.linked_hash_map."0.3.0".serde_test or false then [ (crates.serde_test."${deps."linked_hash_map"."0.3.0".serde_test}" deps) ] else []));
    features = mkFeatures (features."linked_hash_map"."0.3.0" or {});
  };
  features_.linked_hash_map."0.3.0" = deps: f: updateFeatures f (rec {
    linked_hash_map = fold recursiveUpdate {} [
      { "0.3.0".default = (f.linked_hash_map."0.3.0".default or true); }
      { "0.3.0".serde =
        (f.linked_hash_map."0.3.0".serde or false) ||
        (f.linked_hash_map."0.3.0".serde_impl or false) ||
        (linked_hash_map."0.3.0"."serde_impl" or false); }
      { "0.3.0".serde_test =
        (f.linked_hash_map."0.3.0".serde_test or false) ||
        (f.linked_hash_map."0.3.0".serde_impl or false) ||
        (linked_hash_map."0.3.0"."serde_impl" or false); }
    ];
    serde."${deps.linked_hash_map."0.3.0".serde}".default = true;
    serde_test."${deps.linked_hash_map."0.3.0".serde_test}".default = true;
  }) [
    (features_.serde."${deps."linked_hash_map"."0.3.0"."serde"}" deps)
    (features_.serde_test."${deps."linked_hash_map"."0.3.0"."serde_test"}" deps)
  ];


# end
# linked-hash-map-0.5.1

  crates.linked_hash_map."0.5.1" = deps: { features?(features_.linked_hash_map."0.5.1" deps {}) }: buildRustCrate {
    crateName = "linked-hash-map";
    version = "0.5.1";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" "Andrew Paseltiner <apaseltiner@gmail.com>" ];
    sha256 = "1f29c7j53z7w5v0g115yii9dmmbsahr93ak375g48vi75v3p4030";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."linked_hash_map"."0.5.1" or {});
  };
  features_.linked_hash_map."0.5.1" = deps: f: updateFeatures f (rec {
    linked_hash_map = fold recursiveUpdate {} [
      { "0.5.1".default = (f.linked_hash_map."0.5.1".default or true); }
      { "0.5.1".heapsize =
        (f.linked_hash_map."0.5.1".heapsize or false) ||
        (f.linked_hash_map."0.5.1".heapsize_impl or false) ||
        (linked_hash_map."0.5.1"."heapsize_impl" or false); }
      { "0.5.1".serde =
        (f.linked_hash_map."0.5.1".serde or false) ||
        (f.linked_hash_map."0.5.1".serde_impl or false) ||
        (linked_hash_map."0.5.1"."serde_impl" or false); }
      { "0.5.1".serde_test =
        (f.linked_hash_map."0.5.1".serde_test or false) ||
        (f.linked_hash_map."0.5.1".serde_impl or false) ||
        (linked_hash_map."0.5.1"."serde_impl" or false); }
    ];
  }) [];


# end
# lock_api-0.1.5

  crates.lock_api."0.1.5" = deps: { features?(features_.lock_api."0.1.5" deps {}) }: buildRustCrate {
    crateName = "lock_api";
    version = "0.1.5";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "132sidr5hvjfkaqm3l95zpcpi8yk5ddd0g79zf1ad4v65sxirqqm";
    dependencies = mapFeatures features ([
      (crates."scopeguard"."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
    ]
      ++ (if features.lock_api."0.1.5".owning_ref or false then [ (crates.owning_ref."${deps."lock_api"."0.1.5".owning_ref}" deps) ] else []));
    features = mkFeatures (features."lock_api"."0.1.5" or {});
  };
  features_.lock_api."0.1.5" = deps: f: updateFeatures f (rec {
    lock_api."0.1.5".default = (f.lock_api."0.1.5".default or true);
    owning_ref."${deps.lock_api."0.1.5".owning_ref}".default = true;
    scopeguard."${deps.lock_api."0.1.5".scopeguard}".default = (f.scopeguard."${deps.lock_api."0.1.5".scopeguard}".default or false);
  }) [
    (features_.owning_ref."${deps."lock_api"."0.1.5"."owning_ref"}" deps)
    (features_.scopeguard."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# malloc_buf-0.0.6

  crates.malloc_buf."0.0.6" = deps: { features?(features_.malloc_buf."0.0.6" deps {}) }: buildRustCrate {
    crateName = "malloc_buf";
    version = "0.0.6";
    authors = [ "Steven Sheldon" ];
    sha256 = "0g3n9a74vnvz3ip8fp90ss2jwr27mzkb5q6r61fcv8n829rwhxfp";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."malloc_buf"."0.0.6"."libc"}" deps)
    ]);
  };
  features_.malloc_buf."0.0.6" = deps: f: updateFeatures f (rec {
    libc."${deps.malloc_buf."0.0.6".libc}".default = true;
    malloc_buf."0.0.6".default = (f.malloc_buf."0.0.6".default or true);
  }) [
    (features_.libc."${deps."malloc_buf"."0.0.6"."libc"}" deps)
  ];


# end
# matches-0.1.8

  crates.matches."0.1.8" = deps: { features?(features_.matches."0.1.8" deps {}) }: buildRustCrate {
    crateName = "matches";
    version = "0.1.8";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "03hl636fg6xggy0a26200xs74amk3k9n0908rga2szn68agyz3cv";
    libPath = "lib.rs";
  };
  features_.matches."0.1.8" = deps: f: updateFeatures f (rec {
    matches."0.1.8".default = (f.matches."0.1.8".default or true);
  }) [];


# end
# md5-0.6.1

  crates.md5."0.6.1" = deps: { features?(features_.md5."0.6.1" deps {}) }: buildRustCrate {
    crateName = "md5";
    version = "0.6.1";
    authors = [ "Ivan Ukhov <ivan.ukhov@gmail.com>" "Kamal Ahmad <shibe@openmailbox.org>" "Konstantin Stepanov <milezv@gmail.com>" "Lukas Kalbertodt <lukas.kalbertodt@gmail.com>" "Nathan Musoke <nathan.musoke@gmail.com>" "Tony Arcieri <bascule@gmail.com>" "Wim de With <register@dewith.io>" "Yosef Dinerstein <yosefdi@gmail.com>" ];
    sha256 = "0kkg05igb50l4v9c3dxd2mll548gkxqnj97sd2bnq3r433wa82d4";
  };
  features_.md5."0.6.1" = deps: f: updateFeatures f (rec {
    md5."0.6.1".default = (f.md5."0.6.1".default or true);
  }) [];


# end
# memchr-2.1.3

  crates.memchr."2.1.3" = deps: { features?(features_.memchr."2.1.3" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.1.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "14nakv3gc8qvjdaal329nxp109zbmn710l2al7zjbcpij6i19nnk";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."memchr"."2.1.3"."cfg_if"}" deps)
    ]
      ++ (if features.memchr."2.1.3".libc or false then [ (crates.libc."${deps."memchr"."2.1.3".libc}" deps) ] else []));
    features = mkFeatures (features."memchr"."2.1.3" or {});
  };
  features_.memchr."2.1.3" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.memchr."2.1.3".cfg_if}".default = true;
    libc = fold recursiveUpdate {} [
      { "${deps.memchr."2.1.3".libc}"."use_std" =
        (f.libc."${deps.memchr."2.1.3".libc}"."use_std" or false) ||
        (memchr."2.1.3"."use_std" or false) ||
        (f."memchr"."2.1.3"."use_std" or false); }
      { "${deps.memchr."2.1.3".libc}".default = (f.libc."${deps.memchr."2.1.3".libc}".default or false); }
    ];
    memchr = fold recursiveUpdate {} [
      { "2.1.3".default = (f.memchr."2.1.3".default or true); }
      { "2.1.3".libc =
        (f.memchr."2.1.3".libc or false) ||
        (f.memchr."2.1.3".default or false) ||
        (memchr."2.1.3"."default" or false) ||
        (f.memchr."2.1.3".use_std or false) ||
        (memchr."2.1.3"."use_std" or false); }
      { "2.1.3".use_std =
        (f.memchr."2.1.3".use_std or false) ||
        (f.memchr."2.1.3".default or false) ||
        (memchr."2.1.3"."default" or false); }
    ];
  }) [
    (features_.cfg_if."${deps."memchr"."2.1.3"."cfg_if"}" deps)
    (features_.libc."${deps."memchr"."2.1.3"."libc"}" deps)
  ];


# end
# memmap-0.7.0

  crates.memmap."0.7.0" = deps: { features?(features_.memmap."0.7.0" deps {}) }: buildRustCrate {
    crateName = "memmap";
    version = "0.7.0";
    authors = [ "Dan Burkert <dan@danburkert.com>" ];
    sha256 = "1j1rz5p4vh3i5p6rxy620wypj36xc7qarw6dj3353ym67zfaml18";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."memmap"."0.7.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."memmap"."0.7.0"."winapi"}" deps)
    ]) else []);
  };
  features_.memmap."0.7.0" = deps: f: updateFeatures f (rec {
    libc."${deps.memmap."0.7.0".libc}".default = true;
    memmap."0.7.0".default = (f.memmap."0.7.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.memmap."0.7.0".winapi}"."basetsd" = true; }
      { "${deps.memmap."0.7.0".winapi}"."handleapi" = true; }
      { "${deps.memmap."0.7.0".winapi}"."memoryapi" = true; }
      { "${deps.memmap."0.7.0".winapi}"."minwindef" = true; }
      { "${deps.memmap."0.7.0".winapi}"."std" = true; }
      { "${deps.memmap."0.7.0".winapi}"."sysinfoapi" = true; }
      { "${deps.memmap."0.7.0".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."memmap"."0.7.0"."libc"}" deps)
    (features_.winapi."${deps."memmap"."0.7.0"."winapi"}" deps)
  ];


# end
# memoffset-0.2.1

  crates.memoffset."0.2.1" = deps: { features?(features_.memoffset."0.2.1" deps {}) }: buildRustCrate {
    crateName = "memoffset";
    version = "0.2.1";
    authors = [ "Gilad Naaman <gilad.naaman@gmail.com>" ];
    sha256 = "00vym01jk9slibq2nsiilgffp7n6k52a4q3n4dqp0xf5kzxvffcf";
  };
  features_.memoffset."0.2.1" = deps: f: updateFeatures f (rec {
    memoffset."0.2.1".default = (f.memoffset."0.2.1".default or true);
  }) [];


# end
# mime-0.3.13

  crates.mime."0.3.13" = deps: { features?(features_.mime."0.3.13" deps {}) }: buildRustCrate {
    crateName = "mime";
    version = "0.3.13";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "191b240rj0l8hq2bmn74z1c9rqnrfx0dbfxgyq7vnf3jkrbc5v86";
    dependencies = mapFeatures features ([
      (crates."unicase"."${deps."mime"."0.3.13"."unicase"}" deps)
    ]);
  };
  features_.mime."0.3.13" = deps: f: updateFeatures f (rec {
    mime."0.3.13".default = (f.mime."0.3.13".default or true);
    unicase."${deps.mime."0.3.13".unicase}".default = true;
  }) [
    (features_.unicase."${deps."mime"."0.3.13"."unicase"}" deps)
  ];


# end
# mime_guess-2.0.0-alpha.6

  crates.mime_guess."2.0.0-alpha.6" = deps: { features?(features_.mime_guess."2.0.0-alpha.6" deps {}) }: buildRustCrate {
    crateName = "mime_guess";
    version = "2.0.0-alpha.6";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "1k2mdq43gi2qr63b7m5zs624rfi40ysk33cay49jlhq97jwnk9db";
    dependencies = mapFeatures features ([
      (crates."mime"."${deps."mime_guess"."2.0.0-alpha.6"."mime"}" deps)
      (crates."phf"."${deps."mime_guess"."2.0.0-alpha.6"."phf"}" deps)
      (crates."unicase"."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."phf_codegen"."${deps."mime_guess"."2.0.0-alpha.6"."phf_codegen"}" deps)
      (crates."unicase"."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    ]);
    features = mkFeatures (features."mime_guess"."2.0.0-alpha.6" or {});
  };
  features_.mime_guess."2.0.0-alpha.6" = deps: f: updateFeatures f (rec {
    mime."${deps.mime_guess."2.0.0-alpha.6".mime}".default = true;
    mime_guess."2.0.0-alpha.6".default = (f.mime_guess."2.0.0-alpha.6".default or true);
    phf = fold recursiveUpdate {} [
      { "${deps.mime_guess."2.0.0-alpha.6".phf}"."unicase" = true; }
      { "${deps.mime_guess."2.0.0-alpha.6".phf}".default = true; }
    ];
    phf_codegen."${deps.mime_guess."2.0.0-alpha.6".phf_codegen}".default = true;
    unicase."${deps.mime_guess."2.0.0-alpha.6".unicase}".default = true;
  }) [
    (features_.mime."${deps."mime_guess"."2.0.0-alpha.6"."mime"}" deps)
    (features_.phf."${deps."mime_guess"."2.0.0-alpha.6"."phf"}" deps)
    (features_.unicase."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    (features_.phf_codegen."${deps."mime_guess"."2.0.0-alpha.6"."phf_codegen"}" deps)
    (features_.unicase."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
  ];


# end
# mio-0.6.16

  crates.mio."0.6.16" = deps: { features?(features_.mio."0.6.16" deps {}) }: buildRustCrate {
    crateName = "mio";
    version = "0.6.16";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "14vyrlmf0w984pi7ad9qvmlfj6vrb0wn6i8ik9j87w5za2r3rban";
    dependencies = mapFeatures features ([
      (crates."iovec"."${deps."mio"."0.6.16"."iovec"}" deps)
      (crates."lazycell"."${deps."mio"."0.6.16"."lazycell"}" deps)
      (crates."log"."${deps."mio"."0.6.16"."log"}" deps)
      (crates."net2"."${deps."mio"."0.6.16"."net2"}" deps)
      (crates."slab"."${deps."mio"."0.6.16"."slab"}" deps)
    ])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_zircon"."${deps."mio"."0.6.16"."fuchsia_zircon"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."mio"."0.6.16"."fuchsia_zircon_sys"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."mio"."0.6.16"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."mio"."0.6.16"."kernel32_sys"}" deps)
      (crates."miow"."${deps."mio"."0.6.16"."miow"}" deps)
      (crates."winapi"."${deps."mio"."0.6.16"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."mio"."0.6.16" or {});
  };
  features_.mio."0.6.16" = deps: f: updateFeatures f (rec {
    fuchsia_zircon."${deps.mio."0.6.16".fuchsia_zircon}".default = true;
    fuchsia_zircon_sys."${deps.mio."0.6.16".fuchsia_zircon_sys}".default = true;
    iovec."${deps.mio."0.6.16".iovec}".default = true;
    kernel32_sys."${deps.mio."0.6.16".kernel32_sys}".default = true;
    lazycell."${deps.mio."0.6.16".lazycell}".default = true;
    libc."${deps.mio."0.6.16".libc}".default = true;
    log."${deps.mio."0.6.16".log}".default = true;
    mio = fold recursiveUpdate {} [
      { "0.6.16".default = (f.mio."0.6.16".default or true); }
      { "0.6.16".with-deprecated =
        (f.mio."0.6.16".with-deprecated or false) ||
        (f.mio."0.6.16".default or false) ||
        (mio."0.6.16"."default" or false); }
    ];
    miow."${deps.mio."0.6.16".miow}".default = true;
    net2."${deps.mio."0.6.16".net2}".default = true;
    slab."${deps.mio."0.6.16".slab}".default = true;
    winapi."${deps.mio."0.6.16".winapi}".default = true;
  }) [
    (features_.iovec."${deps."mio"."0.6.16"."iovec"}" deps)
    (features_.lazycell."${deps."mio"."0.6.16"."lazycell"}" deps)
    (features_.log."${deps."mio"."0.6.16"."log"}" deps)
    (features_.net2."${deps."mio"."0.6.16"."net2"}" deps)
    (features_.slab."${deps."mio"."0.6.16"."slab"}" deps)
    (features_.fuchsia_zircon."${deps."mio"."0.6.16"."fuchsia_zircon"}" deps)
    (features_.fuchsia_zircon_sys."${deps."mio"."0.6.16"."fuchsia_zircon_sys"}" deps)
    (features_.libc."${deps."mio"."0.6.16"."libc"}" deps)
    (features_.kernel32_sys."${deps."mio"."0.6.16"."kernel32_sys"}" deps)
    (features_.miow."${deps."mio"."0.6.16"."miow"}" deps)
    (features_.winapi."${deps."mio"."0.6.16"."winapi"}" deps)
  ];


# end
# mio-uds-0.6.7

  crates.mio_uds."0.6.7" = deps: { features?(features_.mio_uds."0.6.7" deps {}) }: buildRustCrate {
    crateName = "mio-uds";
    version = "0.6.7";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1gff9908pvvysv7zgxvyxy7x34fnhs088cr0j8mgwj8j24mswrhm";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."iovec"."${deps."mio_uds"."0.6.7"."iovec"}" deps)
      (crates."libc"."${deps."mio_uds"."0.6.7"."libc"}" deps)
      (crates."mio"."${deps."mio_uds"."0.6.7"."mio"}" deps)
    ]) else []);
  };
  features_.mio_uds."0.6.7" = deps: f: updateFeatures f (rec {
    iovec."${deps.mio_uds."0.6.7".iovec}".default = true;
    libc."${deps.mio_uds."0.6.7".libc}".default = true;
    mio."${deps.mio_uds."0.6.7".mio}".default = true;
    mio_uds."0.6.7".default = (f.mio_uds."0.6.7".default or true);
  }) [
    (features_.iovec."${deps."mio_uds"."0.6.7"."iovec"}" deps)
    (features_.libc."${deps."mio_uds"."0.6.7"."libc"}" deps)
    (features_.mio."${deps."mio_uds"."0.6.7"."mio"}" deps)
  ];


# end
# miow-0.2.1

  crates.miow."0.2.1" = deps: { features?(features_.miow."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miow";
    version = "0.2.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "14f8zkc6ix7mkyis1vsqnim8m29b6l55abkba3p2yz7j1ibcvrl0";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
      (crates."net2"."${deps."miow"."0.2.1"."net2"}" deps)
      (crates."winapi"."${deps."miow"."0.2.1"."winapi"}" deps)
      (crates."ws2_32_sys"."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
    ]);
  };
  features_.miow."0.2.1" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.miow."0.2.1".kernel32_sys}".default = true;
    miow."0.2.1".default = (f.miow."0.2.1".default or true);
    net2."${deps.miow."0.2.1".net2}".default = (f.net2."${deps.miow."0.2.1".net2}".default or false);
    winapi."${deps.miow."0.2.1".winapi}".default = true;
    ws2_32_sys."${deps.miow."0.2.1".ws2_32_sys}".default = true;
  }) [
    (features_.kernel32_sys."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
    (features_.net2."${deps."miow"."0.2.1"."net2"}" deps)
    (features_.winapi."${deps."miow"."0.2.1"."winapi"}" deps)
    (features_.ws2_32_sys."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
  ];


# end
# native-tls-0.2.2

  crates.native_tls."0.2.2" = deps: { features?(features_.native_tls."0.2.2" deps {}) }: buildRustCrate {
    crateName = "native-tls";
    version = "0.2.2";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0vl2hmmnrcjfylzjfsbnav20ri2n1qjgxn7bklb4mk3fyxfqm1m9";
    dependencies = (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."lazy_static"."${deps."native_tls"."0.2.2"."lazy_static"}" deps)
      (crates."libc"."${deps."native_tls"."0.2.2"."libc"}" deps)
      (crates."security_framework"."${deps."native_tls"."0.2.2"."security_framework"}" deps)
      (crates."security_framework_sys"."${deps."native_tls"."0.2.2"."security_framework_sys"}" deps)
      (crates."tempfile"."${deps."native_tls"."0.2.2"."tempfile"}" deps)
    ]) else [])
      ++ (if !(kernel == "windows" || kernel == "darwin" || kernel == "ios") then mapFeatures features ([
      (crates."openssl"."${deps."native_tls"."0.2.2"."openssl"}" deps)
      (crates."openssl_probe"."${deps."native_tls"."0.2.2"."openssl_probe"}" deps)
      (crates."openssl_sys"."${deps."native_tls"."0.2.2"."openssl_sys"}" deps)
    ]) else [])
      ++ (if kernel == "android" then mapFeatures features ([
      (crates."log"."${deps."native_tls"."0.2.2"."log"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."schannel"."${deps."native_tls"."0.2.2"."schannel"}" deps)
    ]) else []);
    features = mkFeatures (features."native_tls"."0.2.2" or {});
  };
  features_.native_tls."0.2.2" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.native_tls."0.2.2".lazy_static}".default = true;
    libc."${deps.native_tls."0.2.2".libc}".default = true;
    log."${deps.native_tls."0.2.2".log}".default = true;
    native_tls."0.2.2".default = (f.native_tls."0.2.2".default or true);
    openssl."${deps.native_tls."0.2.2".openssl}".default = true;
    openssl_probe."${deps.native_tls."0.2.2".openssl_probe}".default = true;
    openssl_sys."${deps.native_tls."0.2.2".openssl_sys}".default = true;
    schannel."${deps.native_tls."0.2.2".schannel}".default = true;
    security_framework."${deps.native_tls."0.2.2".security_framework}".default = true;
    security_framework_sys."${deps.native_tls."0.2.2".security_framework_sys}".default = true;
    tempfile."${deps.native_tls."0.2.2".tempfile}".default = true;
  }) [
    (features_.lazy_static."${deps."native_tls"."0.2.2"."lazy_static"}" deps)
    (features_.libc."${deps."native_tls"."0.2.2"."libc"}" deps)
    (features_.security_framework."${deps."native_tls"."0.2.2"."security_framework"}" deps)
    (features_.security_framework_sys."${deps."native_tls"."0.2.2"."security_framework_sys"}" deps)
    (features_.tempfile."${deps."native_tls"."0.2.2"."tempfile"}" deps)
    (features_.openssl."${deps."native_tls"."0.2.2"."openssl"}" deps)
    (features_.openssl_probe."${deps."native_tls"."0.2.2"."openssl_probe"}" deps)
    (features_.openssl_sys."${deps."native_tls"."0.2.2"."openssl_sys"}" deps)
    (features_.log."${deps."native_tls"."0.2.2"."log"}" deps)
    (features_.schannel."${deps."native_tls"."0.2.2"."schannel"}" deps)
  ];


# end
# net2-0.2.33

  crates.net2."0.2.33" = deps: { features?(features_.net2."0.2.33" deps {}) }: buildRustCrate {
    crateName = "net2";
    version = "0.2.33";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1qnmajafgybj5wyxz9iffa8x5wgbwd2znfklmhqj7vl6lw1m65mq";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."net2"."0.2.33"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."net2"."0.2.33"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."net2"."0.2.33"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."net2"."0.2.33" or {});
  };
  features_.net2."0.2.33" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.net2."0.2.33".cfg_if}".default = true;
    libc."${deps.net2."0.2.33".libc}".default = true;
    net2 = fold recursiveUpdate {} [
      { "0.2.33".default = (f.net2."0.2.33".default or true); }
      { "0.2.33".duration =
        (f.net2."0.2.33".duration or false) ||
        (f.net2."0.2.33".default or false) ||
        (net2."0.2.33"."default" or false); }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.net2."0.2.33".winapi}"."handleapi" = true; }
      { "${deps.net2."0.2.33".winapi}"."winsock2" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2def" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2ipdef" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2tcpip" = true; }
      { "${deps.net2."0.2.33".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."net2"."0.2.33"."cfg_if"}" deps)
    (features_.libc."${deps."net2"."0.2.33"."libc"}" deps)
    (features_.winapi."${deps."net2"."0.2.33"."winapi"}" deps)
  ];


# end
# nix-0.12.0

  crates.nix."0.12.0" = deps: { features?(features_.nix."0.12.0" deps {}) }: buildRustCrate {
    crateName = "nix";
    version = "0.12.0";
    authors = [ "The nix-rust Project Developers" ];
    sha256 = "0vhxjiqmlgdwycyskfilnswpsfa9my1vqk3pq3mnzm31wxkl3hj2";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."nix"."0.12.0"."bitflags"}" deps)
      (crates."cfg_if"."${deps."nix"."0.12.0"."cfg_if"}" deps)
      (crates."libc"."${deps."nix"."0.12.0"."libc"}" deps)
      (crates."void"."${deps."nix"."0.12.0"."void"}" deps)
    ])
      ++ (if kernel == "dragonfly" then mapFeatures features ([
]) else [])
      ++ (if kernel == "freebsd" then mapFeatures features ([
]) else []);
  };
  features_.nix."0.12.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.nix."0.12.0".bitflags}".default = true;
    cfg_if."${deps.nix."0.12.0".cfg_if}".default = true;
    libc."${deps.nix."0.12.0".libc}".default = true;
    nix."0.12.0".default = (f.nix."0.12.0".default or true);
    void."${deps.nix."0.12.0".void}".default = true;
  }) [
    (features_.bitflags."${deps."nix"."0.12.0"."bitflags"}" deps)
    (features_.cfg_if."${deps."nix"."0.12.0"."cfg_if"}" deps)
    (features_.libc."${deps."nix"."0.12.0"."libc"}" deps)
    (features_.void."${deps."nix"."0.12.0"."void"}" deps)
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
      { "0.1.13".nodrop-union =
        (f.nodrop."0.1.13".nodrop-union or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13".std =
        (f.nodrop."0.1.13".std or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
    ];
  }) [];


# end
# nom-4.2.0

  crates.nom."4.2.0" = deps: { features?(features_.nom."4.2.0" deps {}) }: buildRustCrate {
    crateName = "nom";
    version = "4.2.0";
    authors = [ "contact@geoffroycouprie.com" ];
    sha256 = "0dzd1drcn32gjx80xnmdrn44pc220m419bd5pqxlrky6hnasd8wn";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."nom"."4.2.0"."memchr"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."nom"."4.2.0"."version_check"}" deps)
    ]);
    features = mkFeatures (features."nom"."4.2.0" or {});
  };
  features_.nom."4.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "${deps.nom."4.2.0".memchr}"."use_std" =
        (f.memchr."${deps.nom."4.2.0".memchr}"."use_std" or false) ||
        (nom."4.2.0"."std" or false) ||
        (f."nom"."4.2.0"."std" or false); }
      { "${deps.nom."4.2.0".memchr}".default = (f.memchr."${deps.nom."4.2.0".memchr}".default or false); }
    ];
    nom = fold recursiveUpdate {} [
      { "4.2.0".alloc =
        (f.nom."4.2.0".alloc or false) ||
        (f.nom."4.2.0".std or false) ||
        (nom."4.2.0"."std" or false) ||
        (f.nom."4.2.0".verbose-errors or false) ||
        (nom."4.2.0"."verbose-errors" or false); }
      { "4.2.0".default = (f.nom."4.2.0".default or true); }
      { "4.2.0".lazy_static =
        (f.nom."4.2.0".lazy_static or false) ||
        (f.nom."4.2.0".regexp_macros or false) ||
        (nom."4.2.0"."regexp_macros" or false); }
      { "4.2.0".regex =
        (f.nom."4.2.0".regex or false) ||
        (f.nom."4.2.0".regexp or false) ||
        (nom."4.2.0"."regexp" or false); }
      { "4.2.0".regexp =
        (f.nom."4.2.0".regexp or false) ||
        (f.nom."4.2.0".regexp_macros or false) ||
        (nom."4.2.0"."regexp_macros" or false); }
      { "4.2.0".std =
        (f.nom."4.2.0".std or false) ||
        (f.nom."4.2.0".default or false) ||
        (nom."4.2.0"."default" or false); }
    ];
    version_check."${deps.nom."4.2.0".version_check}".default = true;
  }) [
    (features_.memchr."${deps."nom"."4.2.0"."memchr"}" deps)
    (features_.version_check."${deps."nom"."4.2.0"."version_check"}" deps)
  ];


# end
# num-0.2.0

  crates.num."0.2.0" = deps: { features?(features_.num."0.2.0" deps {}) }: buildRustCrate {
    crateName = "num";
    version = "0.2.0";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0kkql31mc46lghl2qyirk5vl6l0ij24cb5q9d23zm7bkfm05rmzx";
    dependencies = mapFeatures features ([
      (crates."num_complex"."${deps."num"."0.2.0"."num_complex"}" deps)
      (crates."num_integer"."${deps."num"."0.2.0"."num_integer"}" deps)
      (crates."num_iter"."${deps."num"."0.2.0"."num_iter"}" deps)
      (crates."num_rational"."${deps."num"."0.2.0"."num_rational"}" deps)
      (crates."num_traits"."${deps."num"."0.2.0"."num_traits"}" deps)
    ]
      ++ (if features.num."0.2.0".num-bigint or false then [ (crates.num_bigint."${deps."num"."0.2.0".num_bigint}" deps) ] else []));
    features = mkFeatures (features."num"."0.2.0" or {});
  };
  features_.num."0.2.0" = deps: f: updateFeatures f (rec {
    num = fold recursiveUpdate {} [
      { "0.2.0".default = (f.num."0.2.0".default or true); }
      { "0.2.0".std =
        (f.num."0.2.0".std or false) ||
        (f.num."0.2.0".default or false) ||
        (num."0.2.0"."default" or false); }
    ];
    num_bigint = fold recursiveUpdate {} [
      { "${deps.num."0.2.0".num_bigint}"."i128" =
        (f.num_bigint."${deps.num."0.2.0".num_bigint}"."i128" or false) ||
        (num."0.2.0"."i128" or false) ||
        (f."num"."0.2.0"."i128" or false); }
      { "${deps.num."0.2.0".num_bigint}"."rand" =
        (f.num_bigint."${deps.num."0.2.0".num_bigint}"."rand" or false) ||
        (num."0.2.0"."rand" or false) ||
        (f."num"."0.2.0"."rand" or false); }
      { "${deps.num."0.2.0".num_bigint}"."serde" =
        (f.num_bigint."${deps.num."0.2.0".num_bigint}"."serde" or false) ||
        (num."0.2.0"."serde" or false) ||
        (f."num"."0.2.0"."serde" or false); }
      { "${deps.num."0.2.0".num_bigint}"."std" =
        (f.num_bigint."${deps.num."0.2.0".num_bigint}"."std" or false) ||
        (num."0.2.0"."std" or false) ||
        (f."num"."0.2.0"."std" or false); }
      { "${deps.num."0.2.0".num_bigint}".default = (f.num_bigint."${deps.num."0.2.0".num_bigint}".default or false); }
    ];
    num_complex = fold recursiveUpdate {} [
      { "${deps.num."0.2.0".num_complex}"."i128" =
        (f.num_complex."${deps.num."0.2.0".num_complex}"."i128" or false) ||
        (num."0.2.0"."i128" or false) ||
        (f."num"."0.2.0"."i128" or false); }
      { "${deps.num."0.2.0".num_complex}"."rand" =
        (f.num_complex."${deps.num."0.2.0".num_complex}"."rand" or false) ||
        (num."0.2.0"."rand" or false) ||
        (f."num"."0.2.0"."rand" or false); }
      { "${deps.num."0.2.0".num_complex}"."serde" =
        (f.num_complex."${deps.num."0.2.0".num_complex}"."serde" or false) ||
        (num."0.2.0"."serde" or false) ||
        (f."num"."0.2.0"."serde" or false); }
      { "${deps.num."0.2.0".num_complex}"."std" =
        (f.num_complex."${deps.num."0.2.0".num_complex}"."std" or false) ||
        (num."0.2.0"."std" or false) ||
        (f."num"."0.2.0"."std" or false); }
      { "${deps.num."0.2.0".num_complex}".default = (f.num_complex."${deps.num."0.2.0".num_complex}".default or false); }
    ];
    num_integer = fold recursiveUpdate {} [
      { "${deps.num."0.2.0".num_integer}"."i128" =
        (f.num_integer."${deps.num."0.2.0".num_integer}"."i128" or false) ||
        (num."0.2.0"."i128" or false) ||
        (f."num"."0.2.0"."i128" or false); }
      { "${deps.num."0.2.0".num_integer}"."std" =
        (f.num_integer."${deps.num."0.2.0".num_integer}"."std" or false) ||
        (num."0.2.0"."std" or false) ||
        (f."num"."0.2.0"."std" or false); }
      { "${deps.num."0.2.0".num_integer}".default = (f.num_integer."${deps.num."0.2.0".num_integer}".default or false); }
    ];
    num_iter = fold recursiveUpdate {} [
      { "${deps.num."0.2.0".num_iter}"."i128" =
        (f.num_iter."${deps.num."0.2.0".num_iter}"."i128" or false) ||
        (num."0.2.0"."i128" or false) ||
        (f."num"."0.2.0"."i128" or false); }
      { "${deps.num."0.2.0".num_iter}"."std" =
        (f.num_iter."${deps.num."0.2.0".num_iter}"."std" or false) ||
        (num."0.2.0"."std" or false) ||
        (f."num"."0.2.0"."std" or false); }
      { "${deps.num."0.2.0".num_iter}".default = (f.num_iter."${deps.num."0.2.0".num_iter}".default or false); }
    ];
    num_rational = fold recursiveUpdate {} [
      { "${deps.num."0.2.0".num_rational}"."i128" =
        (f.num_rational."${deps.num."0.2.0".num_rational}"."i128" or false) ||
        (num."0.2.0"."i128" or false) ||
        (f."num"."0.2.0"."i128" or false); }
      { "${deps.num."0.2.0".num_rational}"."serde" =
        (f.num_rational."${deps.num."0.2.0".num_rational}"."serde" or false) ||
        (num."0.2.0"."serde" or false) ||
        (f."num"."0.2.0"."serde" or false); }
      { "${deps.num."0.2.0".num_rational}"."std" =
        (f.num_rational."${deps.num."0.2.0".num_rational}"."std" or false) ||
        (num."0.2.0"."std" or false) ||
        (f."num"."0.2.0"."std" or false); }
      { "${deps.num."0.2.0".num_rational}".default = (f.num_rational."${deps.num."0.2.0".num_rational}".default or false); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num."0.2.0".num_traits}"."i128" =
        (f.num_traits."${deps.num."0.2.0".num_traits}"."i128" or false) ||
        (num."0.2.0"."i128" or false) ||
        (f."num"."0.2.0"."i128" or false); }
      { "${deps.num."0.2.0".num_traits}"."std" =
        (f.num_traits."${deps.num."0.2.0".num_traits}"."std" or false) ||
        (num."0.2.0"."std" or false) ||
        (f."num"."0.2.0"."std" or false); }
      { "${deps.num."0.2.0".num_traits}".default = (f.num_traits."${deps.num."0.2.0".num_traits}".default or false); }
    ];
  }) [
    (features_.num_bigint."${deps."num"."0.2.0"."num_bigint"}" deps)
    (features_.num_complex."${deps."num"."0.2.0"."num_complex"}" deps)
    (features_.num_integer."${deps."num"."0.2.0"."num_integer"}" deps)
    (features_.num_iter."${deps."num"."0.2.0"."num_iter"}" deps)
    (features_.num_rational."${deps."num"."0.2.0"."num_rational"}" deps)
    (features_.num_traits."${deps."num"."0.2.0"."num_traits"}" deps)
  ];


# end
# num-bigint-0.2.2

  crates.num_bigint."0.2.2" = deps: { features?(features_.num_bigint."0.2.2" deps {}) }: buildRustCrate {
    crateName = "num-bigint";
    version = "0.2.2";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0alza0afrwvhiilqvjazkxv94sir14jqfi50cpv40rgjl1rk7xf6";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_integer"."${deps."num_bigint"."0.2.2"."num_integer"}" deps)
      (crates."num_traits"."${deps."num_bigint"."0.2.2"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."num_bigint"."0.2.2" or {});
  };
  features_.num_bigint."0.2.2" = deps: f: updateFeatures f (rec {
    num_bigint = fold recursiveUpdate {} [
      { "0.2.2".default = (f.num_bigint."0.2.2".default or true); }
      { "0.2.2".std =
        (f.num_bigint."0.2.2".std or false) ||
        (f.num_bigint."0.2.2".default or false) ||
        (num_bigint."0.2.2"."default" or false); }
    ];
    num_integer = fold recursiveUpdate {} [
      { "${deps.num_bigint."0.2.2".num_integer}"."i128" =
        (f.num_integer."${deps.num_bigint."0.2.2".num_integer}"."i128" or false) ||
        (num_bigint."0.2.2"."i128" or false) ||
        (f."num_bigint"."0.2.2"."i128" or false); }
      { "${deps.num_bigint."0.2.2".num_integer}"."std" =
        (f.num_integer."${deps.num_bigint."0.2.2".num_integer}"."std" or false) ||
        (num_bigint."0.2.2"."std" or false) ||
        (f."num_bigint"."0.2.2"."std" or false); }
      { "${deps.num_bigint."0.2.2".num_integer}".default = (f.num_integer."${deps.num_bigint."0.2.2".num_integer}".default or false); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_bigint."0.2.2".num_traits}"."i128" =
        (f.num_traits."${deps.num_bigint."0.2.2".num_traits}"."i128" or false) ||
        (num_bigint."0.2.2"."i128" or false) ||
        (f."num_bigint"."0.2.2"."i128" or false); }
      { "${deps.num_bigint."0.2.2".num_traits}"."std" =
        (f.num_traits."${deps.num_bigint."0.2.2".num_traits}"."std" or false) ||
        (num_bigint."0.2.2"."std" or false) ||
        (f."num_bigint"."0.2.2"."std" or false); }
      { "${deps.num_bigint."0.2.2".num_traits}".default = (f.num_traits."${deps.num_bigint."0.2.2".num_traits}".default or false); }
    ];
  }) [
    (features_.num_integer."${deps."num_bigint"."0.2.2"."num_integer"}" deps)
    (features_.num_traits."${deps."num_bigint"."0.2.2"."num_traits"}" deps)
  ];


# end
# num-complex-0.2.1

  crates.num_complex."0.2.1" = deps: { features?(features_.num_complex."0.2.1" deps {}) }: buildRustCrate {
    crateName = "num-complex";
    version = "0.2.1";
    authors = [ "The Rust Project Developers" ];
    sha256 = "12lpp62ahc80p33cpw2771l8bwl0q13rl5vq0jzkqib1l5z8q80z";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_complex"."0.2.1"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."num_complex"."0.2.1" or {});
  };
  features_.num_complex."0.2.1" = deps: f: updateFeatures f (rec {
    num_complex = fold recursiveUpdate {} [
      { "0.2.1".default = (f.num_complex."0.2.1".default or true); }
      { "0.2.1".std =
        (f.num_complex."0.2.1".std or false) ||
        (f.num_complex."0.2.1".default or false) ||
        (num_complex."0.2.1"."default" or false); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_complex."0.2.1".num_traits}"."i128" =
        (f.num_traits."${deps.num_complex."0.2.1".num_traits}"."i128" or false) ||
        (num_complex."0.2.1"."i128" or false) ||
        (f."num_complex"."0.2.1"."i128" or false); }
      { "${deps.num_complex."0.2.1".num_traits}"."std" =
        (f.num_traits."${deps.num_complex."0.2.1".num_traits}"."std" or false) ||
        (num_complex."0.2.1"."std" or false) ||
        (f."num_complex"."0.2.1"."std" or false); }
      { "${deps.num_complex."0.2.1".num_traits}".default = (f.num_traits."${deps.num_complex."0.2.1".num_traits}".default or false); }
    ];
  }) [
    (features_.num_traits."${deps."num_complex"."0.2.1"."num_traits"}" deps)
  ];


# end
# num-integer-0.1.39

  crates.num_integer."0.1.39" = deps: { features?(features_.num_integer."0.1.39" deps {}) }: buildRustCrate {
    crateName = "num-integer";
    version = "0.1.39";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1f42ls46cghs13qfzgbd7syib2zc6m7hlmv1qlar6c9mdxapvvbg";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_integer"."0.1.39"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."num_integer"."0.1.39" or {});
  };
  features_.num_integer."0.1.39" = deps: f: updateFeatures f (rec {
    num_integer = fold recursiveUpdate {} [
      { "0.1.39".default = (f.num_integer."0.1.39".default or true); }
      { "0.1.39".std =
        (f.num_integer."0.1.39".std or false) ||
        (f.num_integer."0.1.39".default or false) ||
        (num_integer."0.1.39"."default" or false); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_integer."0.1.39".num_traits}"."i128" =
        (f.num_traits."${deps.num_integer."0.1.39".num_traits}"."i128" or false) ||
        (num_integer."0.1.39"."i128" or false) ||
        (f."num_integer"."0.1.39"."i128" or false); }
      { "${deps.num_integer."0.1.39".num_traits}"."std" =
        (f.num_traits."${deps.num_integer."0.1.39".num_traits}"."std" or false) ||
        (num_integer."0.1.39"."std" or false) ||
        (f."num_integer"."0.1.39"."std" or false); }
      { "${deps.num_integer."0.1.39".num_traits}".default = (f.num_traits."${deps.num_integer."0.1.39".num_traits}".default or false); }
    ];
  }) [
    (features_.num_traits."${deps."num_integer"."0.1.39"."num_traits"}" deps)
  ];


# end
# num-iter-0.1.37

  crates.num_iter."0.1.37" = deps: { features?(features_.num_iter."0.1.37" deps {}) }: buildRustCrate {
    crateName = "num-iter";
    version = "0.1.37";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1rglyvi4yjfxfvfm2s7i60g1dkl5xmsyi77g6vy53jb11r6wl8ly";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_integer"."${deps."num_iter"."0.1.37"."num_integer"}" deps)
      (crates."num_traits"."${deps."num_iter"."0.1.37"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."num_iter"."0.1.37" or {});
  };
  features_.num_iter."0.1.37" = deps: f: updateFeatures f (rec {
    num_integer = fold recursiveUpdate {} [
      { "${deps.num_iter."0.1.37".num_integer}"."i128" =
        (f.num_integer."${deps.num_iter."0.1.37".num_integer}"."i128" or false) ||
        (num_iter."0.1.37"."i128" or false) ||
        (f."num_iter"."0.1.37"."i128" or false); }
      { "${deps.num_iter."0.1.37".num_integer}"."std" =
        (f.num_integer."${deps.num_iter."0.1.37".num_integer}"."std" or false) ||
        (num_iter."0.1.37"."std" or false) ||
        (f."num_iter"."0.1.37"."std" or false); }
      { "${deps.num_iter."0.1.37".num_integer}".default = (f.num_integer."${deps.num_iter."0.1.37".num_integer}".default or false); }
    ];
    num_iter = fold recursiveUpdate {} [
      { "0.1.37".default = (f.num_iter."0.1.37".default or true); }
      { "0.1.37".std =
        (f.num_iter."0.1.37".std or false) ||
        (f.num_iter."0.1.37".default or false) ||
        (num_iter."0.1.37"."default" or false); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_iter."0.1.37".num_traits}"."i128" =
        (f.num_traits."${deps.num_iter."0.1.37".num_traits}"."i128" or false) ||
        (num_iter."0.1.37"."i128" or false) ||
        (f."num_iter"."0.1.37"."i128" or false); }
      { "${deps.num_iter."0.1.37".num_traits}"."std" =
        (f.num_traits."${deps.num_iter."0.1.37".num_traits}"."std" or false) ||
        (num_iter."0.1.37"."std" or false) ||
        (f."num_iter"."0.1.37"."std" or false); }
      { "${deps.num_iter."0.1.37".num_traits}".default = (f.num_traits."${deps.num_iter."0.1.37".num_traits}".default or false); }
    ];
  }) [
    (features_.num_integer."${deps."num_iter"."0.1.37"."num_integer"}" deps)
    (features_.num_traits."${deps."num_iter"."0.1.37"."num_traits"}" deps)
  ];


# end
# num-rational-0.2.1

  crates.num_rational."0.2.1" = deps: { features?(features_.num_rational."0.2.1" deps {}) }: buildRustCrate {
    crateName = "num-rational";
    version = "0.2.1";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0zcldi5935qyphm1vadwn2x34h90w3rk5x631wxk6l08z1d58hbq";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_integer"."${deps."num_rational"."0.2.1"."num_integer"}" deps)
      (crates."num_traits"."${deps."num_rational"."0.2.1"."num_traits"}" deps)
    ]
      ++ (if features.num_rational."0.2.1".num-bigint or false then [ (crates.num_bigint."${deps."num_rational"."0.2.1".num_bigint}" deps) ] else []));
    features = mkFeatures (features."num_rational"."0.2.1" or {});
  };
  features_.num_rational."0.2.1" = deps: f: updateFeatures f (rec {
    num_bigint = fold recursiveUpdate {} [
      { "${deps.num_rational."0.2.1".num_bigint}"."std" =
        (f.num_bigint."${deps.num_rational."0.2.1".num_bigint}"."std" or false) ||
        (num_rational."0.2.1"."bigint-std" or false) ||
        (f."num_rational"."0.2.1"."bigint-std" or false); }
      { "${deps.num_rational."0.2.1".num_bigint}".default = (f.num_bigint."${deps.num_rational."0.2.1".num_bigint}".default or false); }
    ];
    num_integer = fold recursiveUpdate {} [
      { "${deps.num_rational."0.2.1".num_integer}"."i128" =
        (f.num_integer."${deps.num_rational."0.2.1".num_integer}"."i128" or false) ||
        (num_rational."0.2.1"."i128" or false) ||
        (f."num_rational"."0.2.1"."i128" or false); }
      { "${deps.num_rational."0.2.1".num_integer}"."std" =
        (f.num_integer."${deps.num_rational."0.2.1".num_integer}"."std" or false) ||
        (num_rational."0.2.1"."std" or false) ||
        (f."num_rational"."0.2.1"."std" or false); }
      { "${deps.num_rational."0.2.1".num_integer}".default = (f.num_integer."${deps.num_rational."0.2.1".num_integer}".default or false); }
    ];
    num_rational = fold recursiveUpdate {} [
      { "0.2.1".bigint =
        (f.num_rational."0.2.1".bigint or false) ||
        (f.num_rational."0.2.1".bigint-std or false) ||
        (num_rational."0.2.1"."bigint-std" or false); }
      { "0.2.1".bigint-std =
        (f.num_rational."0.2.1".bigint-std or false) ||
        (f.num_rational."0.2.1".default or false) ||
        (num_rational."0.2.1"."default" or false); }
      { "0.2.1".default = (f.num_rational."0.2.1".default or true); }
      { "0.2.1".num-bigint =
        (f.num_rational."0.2.1".num-bigint or false) ||
        (f.num_rational."0.2.1".bigint or false) ||
        (num_rational."0.2.1"."bigint" or false); }
      { "0.2.1".std =
        (f.num_rational."0.2.1".std or false) ||
        (f.num_rational."0.2.1".default or false) ||
        (num_rational."0.2.1"."default" or false); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_rational."0.2.1".num_traits}"."i128" =
        (f.num_traits."${deps.num_rational."0.2.1".num_traits}"."i128" or false) ||
        (num_rational."0.2.1"."i128" or false) ||
        (f."num_rational"."0.2.1"."i128" or false); }
      { "${deps.num_rational."0.2.1".num_traits}"."std" =
        (f.num_traits."${deps.num_rational."0.2.1".num_traits}"."std" or false) ||
        (num_rational."0.2.1"."std" or false) ||
        (f."num_rational"."0.2.1"."std" or false); }
      { "${deps.num_rational."0.2.1".num_traits}".default = (f.num_traits."${deps.num_rational."0.2.1".num_traits}".default or false); }
    ];
  }) [
    (features_.num_bigint."${deps."num_rational"."0.2.1"."num_bigint"}" deps)
    (features_.num_integer."${deps."num_rational"."0.2.1"."num_integer"}" deps)
    (features_.num_traits."${deps."num_rational"."0.2.1"."num_traits"}" deps)
  ];


# end
# num-traits-0.1.43

  crates.num_traits."0.1.43" = deps: { features?(features_.num_traits."0.1.43" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.1.43";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1zdzx78vrcg3f39w94pqjs1mwxl1phyv7843hwgwkzggwcxhhf6s";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_traits"."0.1.43"."num_traits"}" deps)
    ]);
  };
  features_.num_traits."0.1.43" = deps: f: updateFeatures f (rec {
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_traits."0.1.43".num_traits}".default = true; }
      { "0.1.43".default = (f.num_traits."0.1.43".default or true); }
    ];
  }) [
    (features_.num_traits."${deps."num_traits"."0.1.43"."num_traits"}" deps)
  ];


# end
# num-traits-0.2.6

  crates.num_traits."0.2.6" = deps: { features?(features_.num_traits."0.2.6" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.2.6";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1d20sil9n0wgznd1nycm3yjfj1mzyl41ambb7by1apxlyiil1azk";
    build = "build.rs";
    features = mkFeatures (features."num_traits"."0.2.6" or {});
  };
  features_.num_traits."0.2.6" = deps: f: updateFeatures f (rec {
    num_traits = fold recursiveUpdate {} [
      { "0.2.6".default = (f.num_traits."0.2.6".default or true); }
      { "0.2.6".std =
        (f.num_traits."0.2.6".std or false) ||
        (f.num_traits."0.2.6".default or false) ||
        (num_traits."0.2.6"."default" or false); }
    ];
  }) [];


# end
# num_cpus-1.9.0

  crates.num_cpus."1.9.0" = deps: { features?(features_.num_cpus."1.9.0" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.9.0";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0lv81a9sapkprfsi03rag1mygm9qxhdw2qscdvvx2yb62pc54pvi";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.9.0"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.9.0" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.9.0".libc}".default = true;
    num_cpus."1.9.0".default = (f.num_cpus."1.9.0".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.9.0"."libc"}" deps)
  ];


# end
# objc-0.2.5

  crates.objc."0.2.5" = deps: { features?(features_.objc."0.2.5" deps {}) }: buildRustCrate {
    crateName = "objc";
    version = "0.2.5";
    authors = [ "Steven Sheldon" ];
    sha256 = "0jy5nmqs0n9529ji302vr0wk8q6bnq204y7y3rijz3rh94dwylma";
    dependencies = mapFeatures features ([
      (crates."malloc_buf"."${deps."objc"."0.2.5"."malloc_buf"}" deps)
    ]);
    features = mkFeatures (features."objc"."0.2.5" or {});
  };
  features_.objc."0.2.5" = deps: f: updateFeatures f (rec {
    malloc_buf."${deps.objc."0.2.5".malloc_buf}".default = true;
    objc = fold recursiveUpdate {} [
      { "0.2.5".default = (f.objc."0.2.5".default or true); }
      { "0.2.5".objc_exception =
        (f.objc."0.2.5".objc_exception or false) ||
        (f.objc."0.2.5".exception or false) ||
        (objc."0.2.5"."exception" or false); }
    ];
  }) [
    (features_.malloc_buf."${deps."objc"."0.2.5"."malloc_buf"}" deps)
  ];


# end
# opaque-debug-0.2.2

  crates.opaque_debug."0.2.2" = deps: { features?(features_.opaque_debug."0.2.2" deps {}) }: buildRustCrate {
    crateName = "opaque-debug";
    version = "0.2.2";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0dkzsnxpg50gz3gjcdzc4j6g4s0jphllg6q7jqmsy9nd9glidy74";
  };
  features_.opaque_debug."0.2.2" = deps: f: updateFeatures f (rec {
    opaque_debug."0.2.2".default = (f.opaque_debug."0.2.2".default or true);
  }) [];


# end
# openssl-0.10.16

  crates.openssl."0.10.16" = deps: { features?(features_.openssl."0.10.16" deps {}) }: buildRustCrate {
    crateName = "openssl";
    version = "0.10.16";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "17mi6p323rqkydfwykiba3b1a24j7jv7bmr7j5wai4c32i2khqsm";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."openssl"."0.10.16"."bitflags"}" deps)
      (crates."cfg_if"."${deps."openssl"."0.10.16"."cfg_if"}" deps)
      (crates."foreign_types"."${deps."openssl"."0.10.16"."foreign_types"}" deps)
      (crates."lazy_static"."${deps."openssl"."0.10.16"."lazy_static"}" deps)
      (crates."libc"."${deps."openssl"."0.10.16"."libc"}" deps)
      (crates."openssl_sys"."${deps."openssl"."0.10.16"."openssl_sys"}" deps)
    ]);
    features = mkFeatures (features."openssl"."0.10.16" or {});
  };
  features_.openssl."0.10.16" = deps: f: updateFeatures f (rec {
    bitflags."${deps.openssl."0.10.16".bitflags}".default = true;
    cfg_if."${deps.openssl."0.10.16".cfg_if}".default = true;
    foreign_types."${deps.openssl."0.10.16".foreign_types}".default = true;
    lazy_static."${deps.openssl."0.10.16".lazy_static}".default = true;
    libc."${deps.openssl."0.10.16".libc}".default = true;
    openssl."0.10.16".default = (f.openssl."0.10.16".default or true);
    openssl_sys = fold recursiveUpdate {} [
      { "${deps.openssl."0.10.16".openssl_sys}"."vendored" =
        (f.openssl_sys."${deps.openssl."0.10.16".openssl_sys}"."vendored" or false) ||
        (openssl."0.10.16"."vendored" or false) ||
        (f."openssl"."0.10.16"."vendored" or false); }
      { "${deps.openssl."0.10.16".openssl_sys}".default = true; }
    ];
  }) [
    (features_.bitflags."${deps."openssl"."0.10.16"."bitflags"}" deps)
    (features_.cfg_if."${deps."openssl"."0.10.16"."cfg_if"}" deps)
    (features_.foreign_types."${deps."openssl"."0.10.16"."foreign_types"}" deps)
    (features_.lazy_static."${deps."openssl"."0.10.16"."lazy_static"}" deps)
    (features_.libc."${deps."openssl"."0.10.16"."libc"}" deps)
    (features_.openssl_sys."${deps."openssl"."0.10.16"."openssl_sys"}" deps)
  ];


# end
# openssl-probe-0.1.2

  crates.openssl_probe."0.1.2" = deps: { features?(features_.openssl_probe."0.1.2" deps {}) }: buildRustCrate {
    crateName = "openssl-probe";
    version = "0.1.2";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a89fznx26vvaxyrxdvgf6iwai5xvs6xjvpjin68fgvrslv6n15a";
  };
  features_.openssl_probe."0.1.2" = deps: f: updateFeatures f (rec {
    openssl_probe."0.1.2".default = (f.openssl_probe."0.1.2".default or true);
  }) [];


# end
# openssl-sys-0.9.40

  crates.openssl_sys."0.9.40" = deps: { features?(features_.openssl_sys."0.9.40" deps {}) }: buildRustCrate {
    crateName = "openssl-sys";
    version = "0.9.40";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "11dqyk9g2wdwwj21zma71w5hd5d4sw3hm4pnpk8jjh0wjpkgjdvq";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."openssl_sys"."0.9.40"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."openssl_sys"."0.9.40"."cc"}" deps)
      (crates."pkg_config"."${deps."openssl_sys"."0.9.40"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."openssl_sys"."0.9.40" or {});
  };
  features_.openssl_sys."0.9.40" = deps: f: updateFeatures f (rec {
    cc."${deps.openssl_sys."0.9.40".cc}".default = true;
    libc."${deps.openssl_sys."0.9.40".libc}".default = true;
    openssl_sys = fold recursiveUpdate {} [
      { "0.9.40".default = (f.openssl_sys."0.9.40".default or true); }
      { "0.9.40".openssl-src =
        (f.openssl_sys."0.9.40".openssl-src or false) ||
        (f.openssl_sys."0.9.40".vendored or false) ||
        (openssl_sys."0.9.40"."vendored" or false); }
    ];
    pkg_config."${deps.openssl_sys."0.9.40".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."openssl_sys"."0.9.40"."libc"}" deps)
    (features_.cc."${deps."openssl_sys"."0.9.40"."cc"}" deps)
    (features_.pkg_config."${deps."openssl_sys"."0.9.40"."pkg_config"}" deps)
  ];


# end
# ordered-float-1.0.1

  crates.ordered_float."1.0.1" = deps: { features?(features_.ordered_float."1.0.1" deps {}) }: buildRustCrate {
    crateName = "ordered-float";
    version = "1.0.1";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" "Matt Brubeck <mbrubeck@limpet.net>" ];
    sha256 = "0d9f325kfdpfpk78vw26zx1z6yz7v9dd2i4d4nzn1j15lm0xxw8h";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."ordered_float"."1.0.1"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."ordered_float"."1.0.1" or {});
  };
  features_.ordered_float."1.0.1" = deps: f: updateFeatures f (rec {
    num_traits."${deps.ordered_float."1.0.1".num_traits}".default = true;
    ordered_float = fold recursiveUpdate {} [
      { "1.0.1".default = (f.ordered_float."1.0.1".default or true); }
      { "1.0.1".std =
        (f.ordered_float."1.0.1".std or false) ||
        (f.ordered_float."1.0.1".default or false) ||
        (ordered_float."1.0.1"."default" or false); }
    ];
  }) [
    (features_.num_traits."${deps."ordered_float"."1.0.1"."num_traits"}" deps)
  ];


# end
# ordermap-0.3.5

  crates.ordermap."0.3.5" = deps: { features?(features_.ordermap."0.3.5" deps {}) }: buildRustCrate {
    crateName = "ordermap";
    version = "0.3.5";
    authors = [ "bluss" ];
    sha256 = "0b6vxfyh627yqm6war3392g1hhi4dbn49ibx2qv6mv490jdhv7d3";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ordermap"."0.3.5" or {});
  };
  features_.ordermap."0.3.5" = deps: f: updateFeatures f (rec {
    ordermap = fold recursiveUpdate {} [
      { "0.3.5".default = (f.ordermap."0.3.5".default or true); }
      { "0.3.5".serde =
        (f.ordermap."0.3.5".serde or false) ||
        (f.ordermap."0.3.5".serde-1 or false) ||
        (ordermap."0.3.5"."serde-1" or false); }
    ];
  }) [];


# end
# osmesa-sys-0.1.2

  crates.osmesa_sys."0.1.2" = deps: { features?(features_.osmesa_sys."0.1.2" deps {}) }: buildRustCrate {
    crateName = "osmesa-sys";
    version = "0.1.2";
    authors = [ "Daggerbot <daggerbot@gmail.com>" ];
    sha256 = "1ik8v603ahvw6xz9ldy72acqmpg95x0myqicc3460gw5bi3fqnc6";
    libPath = "lib.rs";
    libName = "osmesa_sys";
    dependencies = mapFeatures features ([
      (crates."shared_library"."${deps."osmesa_sys"."0.1.2"."shared_library"}" deps)
    ]);
  };
  features_.osmesa_sys."0.1.2" = deps: f: updateFeatures f (rec {
    osmesa_sys."0.1.2".default = (f.osmesa_sys."0.1.2".default or true);
    shared_library."${deps.osmesa_sys."0.1.2".shared_library}".default = true;
  }) [
    (features_.shared_library."${deps."osmesa_sys"."0.1.2"."shared_library"}" deps)
  ];


# end
# owning_ref-0.4.0

  crates.owning_ref."0.4.0" = deps: { features?(features_.owning_ref."0.4.0" deps {}) }: buildRustCrate {
    crateName = "owning_ref";
    version = "0.4.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1m95qpc3hamkw9wlbfzqkzk7h6skyj40zr6sa3ps151slcfnnchm";
    dependencies = mapFeatures features ([
      (crates."stable_deref_trait"."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
    ]);
  };
  features_.owning_ref."0.4.0" = deps: f: updateFeatures f (rec {
    owning_ref."0.4.0".default = (f.owning_ref."0.4.0".default or true);
    stable_deref_trait."${deps.owning_ref."0.4.0".stable_deref_trait}".default = true;
  }) [
    (features_.stable_deref_trait."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
  ];


# end
# parking_lot-0.7.1

  crates.parking_lot."0.7.1" = deps: { features?(features_.parking_lot."0.7.1" deps {}) }: buildRustCrate {
    crateName = "parking_lot";
    version = "0.7.1";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1qpb49xd176hqqabxdb48f1hvylfbf68rpz8yfrhw0x68ys0lkq1";
    dependencies = mapFeatures features ([
      (crates."lock_api"."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
      (crates."parking_lot_core"."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
    ]);
    features = mkFeatures (features."parking_lot"."0.7.1" or {});
  };
  features_.parking_lot."0.7.1" = deps: f: updateFeatures f (rec {
    lock_api = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".lock_api}"."nightly" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}"."owning_ref" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."owning_ref" or false) ||
        (parking_lot."0.7.1"."owning_ref" or false) ||
        (f."parking_lot"."0.7.1"."owning_ref" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}".default = true; }
    ];
    parking_lot = fold recursiveUpdate {} [
      { "0.7.1".default = (f.parking_lot."0.7.1".default or true); }
      { "0.7.1".owning_ref =
        (f.parking_lot."0.7.1".owning_ref or false) ||
        (f.parking_lot."0.7.1".default or false) ||
        (parking_lot."0.7.1"."default" or false); }
    ];
    parking_lot_core = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" or false) ||
        (parking_lot."0.7.1"."deadlock_detection" or false) ||
        (f."parking_lot"."0.7.1"."deadlock_detection" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}".default = true; }
    ];
  }) [
    (features_.lock_api."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
    (features_.parking_lot_core."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
  ];


# end
# parking_lot_core-0.4.0

  crates.parking_lot_core."0.4.0" = deps: { features?(features_.parking_lot_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "parking_lot_core";
    version = "0.4.0";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1mzk5i240ddvhwnz65hhjk4cq61z235g1n8bd7al4mg6vx437c16";
    dependencies = mapFeatures features ([
      (crates."rand"."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
      (crates."smallvec"."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot_core"."0.4.0" or {});
  };
  features_.parking_lot_core."0.4.0" = deps: f: updateFeatures f (rec {
    libc."${deps.parking_lot_core."0.4.0".libc}".default = true;
    parking_lot_core = fold recursiveUpdate {} [
      { "0.4.0".backtrace =
        (f.parking_lot_core."0.4.0".backtrace or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0".default = (f.parking_lot_core."0.4.0".default or true); }
      { "0.4.0".petgraph =
        (f.parking_lot_core."0.4.0".petgraph or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0".thread-id =
        (f.parking_lot_core."0.4.0".thread-id or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
    ];
    rand."${deps.parking_lot_core."0.4.0".rand}".default = true;
    rustc_version."${deps.parking_lot_core."0.4.0".rustc_version}".default = true;
    smallvec."${deps.parking_lot_core."0.4.0".smallvec}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.parking_lot_core."0.4.0".winapi}"."errhandlingapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."handleapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."minwindef" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."ntstatus" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winbase" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winerror" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winnt" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}".default = true; }
    ];
  }) [
    (features_.rand."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
    (features_.smallvec."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    (features_.rustc_version."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    (features_.libc."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    (features_.winapi."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
  ];


# end
# percent-encoding-1.0.1

  crates.percent_encoding."1.0.1" = deps: { features?(features_.percent_encoding."1.0.1" deps {}) }: buildRustCrate {
    crateName = "percent-encoding";
    version = "1.0.1";
    authors = [ "The rust-url developers" ];
    sha256 = "04ahrp7aw4ip7fmadb0bknybmkfav0kk0gw4ps3ydq5w6hr0ib5i";
    libPath = "lib.rs";
  };
  features_.percent_encoding."1.0.1" = deps: f: updateFeatures f (rec {
    percent_encoding."1.0.1".default = (f.percent_encoding."1.0.1".default or true);
  }) [];


# end
# petgraph-0.4.13

  crates.petgraph."0.4.13" = deps: { features?(features_.petgraph."0.4.13" deps {}) }: buildRustCrate {
    crateName = "petgraph";
    version = "0.4.13";
    authors = [ "bluss" "mitchmindtree" ];
    sha256 = "0a8k12b9vd0bndwqhafa853w186axdw05bv4kqjimyaz67428g1i";
    dependencies = mapFeatures features ([
      (crates."fixedbitset"."${deps."petgraph"."0.4.13"."fixedbitset"}" deps)
    ]
      ++ (if features.petgraph."0.4.13".ordermap or false then [ (crates.ordermap."${deps."petgraph"."0.4.13".ordermap}" deps) ] else []));
    features = mkFeatures (features."petgraph"."0.4.13" or {});
  };
  features_.petgraph."0.4.13" = deps: f: updateFeatures f (rec {
    fixedbitset."${deps.petgraph."0.4.13".fixedbitset}".default = true;
    ordermap."${deps.petgraph."0.4.13".ordermap}".default = true;
    petgraph = fold recursiveUpdate {} [
      { "0.4.13".default = (f.petgraph."0.4.13".default or true); }
      { "0.4.13".generate =
        (f.petgraph."0.4.13".generate or false) ||
        (f.petgraph."0.4.13".unstable or false) ||
        (petgraph."0.4.13"."unstable" or false); }
      { "0.4.13".graphmap =
        (f.petgraph."0.4.13".graphmap or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false) ||
        (f.petgraph."0.4.13".default or false) ||
        (petgraph."0.4.13"."default" or false); }
      { "0.4.13".ordermap =
        (f.petgraph."0.4.13".ordermap or false) ||
        (f.petgraph."0.4.13".graphmap or false) ||
        (petgraph."0.4.13"."graphmap" or false); }
      { "0.4.13".quickcheck =
        (f.petgraph."0.4.13".quickcheck or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false); }
      { "0.4.13".serde =
        (f.petgraph."0.4.13".serde or false) ||
        (f.petgraph."0.4.13".serde-1 or false) ||
        (petgraph."0.4.13"."serde-1" or false); }
      { "0.4.13".serde_derive =
        (f.petgraph."0.4.13".serde_derive or false) ||
        (f.petgraph."0.4.13".serde-1 or false) ||
        (petgraph."0.4.13"."serde-1" or false); }
      { "0.4.13".stable_graph =
        (f.petgraph."0.4.13".stable_graph or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false) ||
        (f.petgraph."0.4.13".default or false) ||
        (petgraph."0.4.13"."default" or false); }
      { "0.4.13".unstable =
        (f.petgraph."0.4.13".unstable or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false); }
    ];
  }) [
    (features_.fixedbitset."${deps."petgraph"."0.4.13"."fixedbitset"}" deps)
    (features_.ordermap."${deps."petgraph"."0.4.13"."ordermap"}" deps)
  ];


# end
# phf-0.7.24

  crates.phf."0.7.24" = deps: { features?(features_.phf."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "19mmhmafd1dhywc7pzkmd1nq0kjfvg57viny20jqa91hhprf2dv5";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."phf_shared"."${deps."phf"."0.7.24"."phf_shared"}" deps)
    ]);
    features = mkFeatures (features."phf"."0.7.24" or {});
  };
  features_.phf."0.7.24" = deps: f: updateFeatures f (rec {
    phf = fold recursiveUpdate {} [
      { "0.7.24".default = (f.phf."0.7.24".default or true); }
      { "0.7.24".phf_macros =
        (f.phf."0.7.24".phf_macros or false) ||
        (f.phf."0.7.24".macros or false) ||
        (phf."0.7.24"."macros" or false); }
    ];
    phf_shared = fold recursiveUpdate {} [
      { "${deps.phf."0.7.24".phf_shared}"."core" =
        (f.phf_shared."${deps.phf."0.7.24".phf_shared}"."core" or false) ||
        (phf."0.7.24"."core" or false) ||
        (f."phf"."0.7.24"."core" or false); }
      { "${deps.phf."0.7.24".phf_shared}"."unicase" =
        (f.phf_shared."${deps.phf."0.7.24".phf_shared}"."unicase" or false) ||
        (phf."0.7.24"."unicase" or false) ||
        (f."phf"."0.7.24"."unicase" or false); }
      { "${deps.phf."0.7.24".phf_shared}".default = true; }
    ];
  }) [
    (features_.phf_shared."${deps."phf"."0.7.24"."phf_shared"}" deps)
  ];


# end
# phf_codegen-0.7.24

  crates.phf_codegen."0.7.24" = deps: { features?(features_.phf_codegen."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_codegen";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0avkx97r4ph8rv70wwgniarlcfiq27yd74gmnxfdv3rx840cyf8g";
    dependencies = mapFeatures features ([
      (crates."phf_generator"."${deps."phf_codegen"."0.7.24"."phf_generator"}" deps)
      (crates."phf_shared"."${deps."phf_codegen"."0.7.24"."phf_shared"}" deps)
    ]);
  };
  features_.phf_codegen."0.7.24" = deps: f: updateFeatures f (rec {
    phf_codegen."0.7.24".default = (f.phf_codegen."0.7.24".default or true);
    phf_generator."${deps.phf_codegen."0.7.24".phf_generator}".default = true;
    phf_shared."${deps.phf_codegen."0.7.24".phf_shared}".default = true;
  }) [
    (features_.phf_generator."${deps."phf_codegen"."0.7.24"."phf_generator"}" deps)
    (features_.phf_shared."${deps."phf_codegen"."0.7.24"."phf_shared"}" deps)
  ];


# end
# phf_generator-0.7.24

  crates.phf_generator."0.7.24" = deps: { features?(features_.phf_generator."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_generator";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1frn2jfydinifxb1fki0xnnsxf0f1ciaa79jz415r5qhw1ash72j";
    dependencies = mapFeatures features ([
      (crates."phf_shared"."${deps."phf_generator"."0.7.24"."phf_shared"}" deps)
      (crates."rand"."${deps."phf_generator"."0.7.24"."rand"}" deps)
    ]);
  };
  features_.phf_generator."0.7.24" = deps: f: updateFeatures f (rec {
    phf_generator."0.7.24".default = (f.phf_generator."0.7.24".default or true);
    phf_shared."${deps.phf_generator."0.7.24".phf_shared}".default = true;
    rand."${deps.phf_generator."0.7.24".rand}".default = true;
  }) [
    (features_.phf_shared."${deps."phf_generator"."0.7.24"."phf_shared"}" deps)
    (features_.rand."${deps."phf_generator"."0.7.24"."rand"}" deps)
  ];


# end
# phf_shared-0.7.24

  crates.phf_shared."0.7.24" = deps: { features?(features_.phf_shared."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_shared";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1hndqn461jvm2r269ym4qh7fnjc6n8yy53avc2pb43p70vxhm9rl";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."siphasher"."${deps."phf_shared"."0.7.24"."siphasher"}" deps)
    ]
      ++ (if features.phf_shared."0.7.24".unicase or false then [ (crates.unicase."${deps."phf_shared"."0.7.24".unicase}" deps) ] else []));
    features = mkFeatures (features."phf_shared"."0.7.24" or {});
  };
  features_.phf_shared."0.7.24" = deps: f: updateFeatures f (rec {
    phf_shared."0.7.24".default = (f.phf_shared."0.7.24".default or true);
    siphasher."${deps.phf_shared."0.7.24".siphasher}".default = true;
    unicase."${deps.phf_shared."0.7.24".unicase}".default = true;
  }) [
    (features_.siphasher."${deps."phf_shared"."0.7.24"."siphasher"}" deps)
    (features_.unicase."${deps."phf_shared"."0.7.24"."unicase"}" deps)
  ];


# end
# piston-float-0.3.0

  crates.piston_float."0.3.0" = deps: { features?(features_.piston_float."0.3.0" deps {}) }: buildRustCrate {
    crateName = "piston-float";
    version = "0.3.0";
    authors = [ "bvssvni <bvssvni@gmail.com>" ];
    sha256 = "1svyx8dgr0q7zfhnk0gpmgpgm9j79q1p3d5wv9ya1bj124pksznv";
    libName = "float";
  };
  features_.piston_float."0.3.0" = deps: f: updateFeatures f (rec {
    piston_float."0.3.0".default = (f.piston_float."0.3.0".default or true);
  }) [];


# end
# piston-viewport-0.5.0

  crates.piston_viewport."0.5.0" = deps: { features?(features_.piston_viewport."0.5.0" deps {}) }: buildRustCrate {
    crateName = "piston-viewport";
    version = "0.5.0";
    authors = [ "bvssvni <bvssvni@gmail.com>" ];
    sha256 = "1zvyck1sn8k2mhw627c61kvpnccj8w9grwvjhfn0b7khnx109b5m";
    libPath = "src/lib.rs";
    libName = "viewport";
    dependencies = mapFeatures features ([
      (crates."piston_float"."${deps."piston_viewport"."0.5.0"."piston_float"}" deps)
    ]);
  };
  features_.piston_viewport."0.5.0" = deps: f: updateFeatures f (rec {
    piston_float."${deps.piston_viewport."0.5.0".piston_float}".default = true;
    piston_viewport."0.5.0".default = (f.piston_viewport."0.5.0".default or true);
  }) [
    (features_.piston_float."${deps."piston_viewport"."0.5.0"."piston_float"}" deps)
  ];


# end
# pistoncore-input-0.24.0

  crates.pistoncore_input."0.24.0" = deps: { features?(features_.pistoncore_input."0.24.0" deps {}) }: buildRustCrate {
    crateName = "pistoncore-input";
    version = "0.24.0";
    authors = [ "bvssvni <bvssvni@gmail.com>" ];
    sha256 = "12rl4swq3ajmbn6wckpcrmbgd095a79lkbja3bg2mgydglcizjf6";
    libPath = "src/lib.rs";
    libName = "input";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."pistoncore_input"."0.24.0"."bitflags"}" deps)
      (crates."piston_viewport"."${deps."pistoncore_input"."0.24.0"."piston_viewport"}" deps)
      (crates."serde"."${deps."pistoncore_input"."0.24.0"."serde"}" deps)
      (crates."serde_derive"."${deps."pistoncore_input"."0.24.0"."serde_derive"}" deps)
    ]);
  };
  features_.pistoncore_input."0.24.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.pistoncore_input."0.24.0".bitflags}".default = true;
    piston_viewport."${deps.pistoncore_input."0.24.0".piston_viewport}".default = true;
    pistoncore_input."0.24.0".default = (f.pistoncore_input."0.24.0".default or true);
    serde."${deps.pistoncore_input."0.24.0".serde}".default = true;
    serde_derive."${deps.pistoncore_input."0.24.0".serde_derive}".default = true;
  }) [
    (features_.bitflags."${deps."pistoncore_input"."0.24.0"."bitflags"}" deps)
    (features_.piston_viewport."${deps."pistoncore_input"."0.24.0"."piston_viewport"}" deps)
    (features_.serde."${deps."pistoncore_input"."0.24.0"."serde"}" deps)
    (features_.serde_derive."${deps."pistoncore_input"."0.24.0"."serde_derive"}" deps)
  ];


# end
# pkg-config-0.3.14

  crates.pkg_config."0.3.14" = deps: { features?(features_.pkg_config."0.3.14" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.14";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0207fsarrm412j0dh87lfcas72n8mxar7q3mgflsbsrqnb140sv6";
  };
  features_.pkg_config."0.3.14" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.14".default = (f.pkg_config."0.3.14".default or true);
  }) [];


# end
# proc-macro2-0.4.26

  crates.proc_macro2."0.4.26" = deps: { features?(features_.proc_macro2."0.4.26" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.26";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1icgd4s198yxs0wlrir5w3nqdjjiqg2x5k0961cl0j874q3gcm10";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.26"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.26" or {});
  };
  features_.proc_macro2."0.4.26" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.26".default = (f.proc_macro2."0.4.26".default or true); }
      { "0.4.26".proc-macro =
        (f.proc_macro2."0.4.26".proc-macro or false) ||
        (f.proc_macro2."0.4.26".default or false) ||
        (proc_macro2."0.4.26"."default" or false); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.26".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.26"."unicode_xid"}" deps)
  ];


# end
# quote-0.6.11

  crates.quote."0.6.11" = deps: { features?(features_.quote."0.6.11" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.11";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0agska77z58cypcq4knayzwx7r7n6m756z1cz9cp2z4sv0b846ga";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.11"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.11" or {});
  };
  features_.quote."0.6.11" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.11".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.11".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.11"."proc-macro" or false) ||
        (f."quote"."0.6.11"."proc-macro" or false); }
      { "${deps.quote."0.6.11".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.11".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.11".default = (f.quote."0.6.11".default or true); }
      { "0.6.11".proc-macro =
        (f.quote."0.6.11".proc-macro or false) ||
        (f.quote."0.6.11".default or false) ||
        (quote."0.6.11"."default" or false); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.11"."proc_macro2"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5".alloc =
        (f.rand."0.6.5".alloc or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
      { "0.6.5".packed_simd =
        (f.rand."0.6.5".packed_simd or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5".rand_os =
        (f.rand."0.6.5".rand_os or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".simd_support =
        (f.rand."0.6.5".simd_support or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5".std =
        (f.rand."0.6.5".std or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
      { "0.3.1".std =
        (f.rand_core."0.3.1".std or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0".alloc =
        (f.rand_core."0.4.0".alloc or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
      { "0.4.0".serde =
        (f.rand_core."0.4.0".serde or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".serde_derive =
        (f.rand_core."0.4.0".serde_derive or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_isaac."0.1.1".serde or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_isaac."0.1.1".serde_derive or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.2

  crates.rand_jitter."0.1.2" = deps: { features?(features_.rand_jitter."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.2";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0jrjl1fjag8d27lg8r9nrzkhzqji2idzn6901a0wb70ghc48w1d8";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.2"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.2"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.2" or {});
  };
  features_.rand_jitter."0.1.2" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.2".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.2".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.2".rand_core}"."std" or false) ||
        (rand_jitter."0.1.2"."std" or false) ||
        (f."rand_jitter"."0.1.2"."std" or false); }
      { "${deps.rand_jitter."0.1.2".rand_core}".default = true; }
    ];
    rand_jitter."0.1.2".default = (f.rand_jitter."0.1.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.2".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.2".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.2"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.2"."winapi"}" deps)
  ];


# end
# rand_os-0.1.2

  crates.rand_os."0.1.2" = deps: { features?(features_.rand_os."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.2";
    authors = [ "The Rand Project Developers" ];
    sha256 = "07wzs8zn24gc6kg7sv75dszxswm6kd47zd4c1fg9h1d7bkwd4337";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.2"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.2"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.2"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.2"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.2"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.2" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.2".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.2".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.2".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.2".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.2".rand_core}".default = true; }
    ];
    rand_os."0.1.2".default = (f.rand_os."0.1.2".default or true);
    rdrand."${deps.rand_os."0.1.2".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.2".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.2".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.2".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.2"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.2"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.2"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.2"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.2"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.1

  crates.rand_pcg."0.1.1" = deps: { features?(features_.rand_pcg."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0x6pzldj0c8c7gmr67ni5i7w2f7n7idvs3ckx0fc3wkhwl7wrbza";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."rand_pcg"."0.1.1"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.1" or {});
  };
  features_.rand_pcg."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_pcg."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_pcg."0.1.1".rand_core}".default or false);
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_pcg."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_pcg."0.1.1".serde or false) ||
        (f.rand_pcg."0.1.1".serde1 or false) ||
        (rand_pcg."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_pcg."0.1.1".serde_derive or false) ||
        (f.rand_pcg."0.1.1".serde1 or false) ||
        (rand_pcg."0.1.1"."serde1" or false); }
    ];
    rustc_version."${deps.rand_pcg."0.1.1".rustc_version}".default = true;
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.1"."rand_core"}" deps)
    (features_.rustc_version."${deps."rand_pcg"."0.1.1"."rustc_version"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_xorshift."0.1.1".serde or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_xorshift."0.1.1".serde_derive or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
      { "0.4.0".std =
        (f.rdrand."0.4.0".std or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.51

  crates.redox_syscall."0.1.51" = deps: { features?(features_.redox_syscall."0.1.51" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.51";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1a61cv7yydx64vpyvzr0z0hwzdvy4gcvcnfc6k70zpkngj5sz3ip";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.51" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.51".default = (f.redox_syscall."0.1.51".default or true);
  }) [];


# end
# regex-1.1.0

  crates.regex."1.1.0" = deps: { features?(features_.regex."1.1.0" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.0";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1myzfgs1yp6vs2rxyg6arn6ab05j6c2m922w3b4iv6zix1rl7z0n";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.0"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.0"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.0"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.0"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.0"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.0" or {});
  };
  features_.regex."1.1.0" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.0".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.0".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.0".default = (f.regex."1.1.0".default or true); }
      { "1.1.0".pattern =
        (f.regex."1.1.0".pattern or false) ||
        (f.regex."1.1.0".unstable or false) ||
        (regex."1.1.0"."unstable" or false); }
      { "1.1.0".use_std =
        (f.regex."1.1.0".use_std or false) ||
        (f.regex."1.1.0".default or false) ||
        (regex."1.1.0"."default" or false); }
    ];
    regex_syntax."${deps.regex."1.1.0".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.0".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.0".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.0"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.0"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.0"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.0"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.0"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.6.5

  crates.regex_syntax."0.6.5" = deps: { features?(features_.regex_syntax."0.6.5" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.5";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0aaaba1fan2qfyc31wzdmgmbmyirc27zgcbz41ba5wm1lb2d8kli";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.5"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.5" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.5".default = (f.regex_syntax."0.6.5".default or true);
    ucd_util."${deps.regex_syntax."0.6.5".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.5"."ucd_util"}" deps)
  ];


# end
# remove_dir_all-0.5.1

  crates.remove_dir_all."0.5.1" = deps: { features?(features_.remove_dir_all."0.5.1" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.1";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "1chx3yvfbj46xjz4bzsvps208l46hfbcy0sm98gpiya454n4rrl7";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.1"."winapi"}" deps)
    ]) else []);
  };
  features_.remove_dir_all."0.5.1" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.1".default = (f.remove_dir_all."0.5.1".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.1".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."remove_dir_all"."0.5.1"."winapi"}" deps)
  ];


# end
# rent_to_own-0.1.0

  crates.rent_to_own."0.1.0" = deps: { features?(features_.rent_to_own."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rent_to_own";
    version = "0.1.0";
    authors = [ "Nick Fitzgerald <fitzgen@gmail.com>" ];
    sha256 = "17x7d17zdyrjq3310avmakxvj1nx66wzz6dvkd9slx03ms0r50av";
  };
  features_.rent_to_own."0.1.0" = deps: f: updateFeatures f (rec {
    rent_to_own."0.1.0".default = (f.rent_to_own."0.1.0".default or true);
  }) [];


# end
# reqwest-0.9.9

  crates.reqwest."0.9.9" = deps: { features?(features_.reqwest."0.9.9" deps {}) }: buildRustCrate {
    crateName = "reqwest";
    version = "0.9.9";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "04zz110wnx9pavfghwxdcysdd5mg3bg1rbsg6gin80rld6yvl99i";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."reqwest"."0.9.9"."base64"}" deps)
      (crates."bytes"."${deps."reqwest"."0.9.9"."bytes"}" deps)
      (crates."encoding_rs"."${deps."reqwest"."0.9.9"."encoding_rs"}" deps)
      (crates."futures"."${deps."reqwest"."0.9.9"."futures"}" deps)
      (crates."http"."${deps."reqwest"."0.9.9"."http"}" deps)
      (crates."hyper"."${deps."reqwest"."0.9.9"."hyper"}" deps)
      (crates."libflate"."${deps."reqwest"."0.9.9"."libflate"}" deps)
      (crates."log"."${deps."reqwest"."0.9.9"."log"}" deps)
      (crates."mime"."${deps."reqwest"."0.9.9"."mime"}" deps)
      (crates."mime_guess"."${deps."reqwest"."0.9.9"."mime_guess"}" deps)
      (crates."serde"."${deps."reqwest"."0.9.9"."serde"}" deps)
      (crates."serde_json"."${deps."reqwest"."0.9.9"."serde_json"}" deps)
      (crates."serde_urlencoded"."${deps."reqwest"."0.9.9"."serde_urlencoded"}" deps)
      (crates."tokio"."${deps."reqwest"."0.9.9"."tokio"}" deps)
      (crates."tokio_executor"."${deps."reqwest"."0.9.9"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."reqwest"."0.9.9"."tokio_io"}" deps)
      (crates."tokio_threadpool"."${deps."reqwest"."0.9.9"."tokio_threadpool"}" deps)
      (crates."tokio_timer"."${deps."reqwest"."0.9.9"."tokio_timer"}" deps)
      (crates."url"."${deps."reqwest"."0.9.9"."url"}" deps)
      (crates."uuid"."${deps."reqwest"."0.9.9"."uuid"}" deps)
    ]
      ++ (if features.reqwest."0.9.9".hyper-tls or false then [ (crates.hyper_tls."${deps."reqwest"."0.9.9".hyper_tls}" deps) ] else [])
      ++ (if features.reqwest."0.9.9".native-tls or false then [ (crates.native_tls."${deps."reqwest"."0.9.9".native_tls}" deps) ] else []));
    features = mkFeatures (features."reqwest"."0.9.9" or {});
  };
  features_.reqwest."0.9.9" = deps: f: updateFeatures f (rec {
    base64."${deps.reqwest."0.9.9".base64}".default = true;
    bytes."${deps.reqwest."0.9.9".bytes}".default = true;
    encoding_rs."${deps.reqwest."0.9.9".encoding_rs}".default = true;
    futures."${deps.reqwest."0.9.9".futures}".default = true;
    http."${deps.reqwest."0.9.9".http}".default = true;
    hyper."${deps.reqwest."0.9.9".hyper}".default = true;
    hyper_tls."${deps.reqwest."0.9.9".hyper_tls}".default = true;
    libflate."${deps.reqwest."0.9.9".libflate}".default = true;
    log."${deps.reqwest."0.9.9".log}".default = true;
    mime."${deps.reqwest."0.9.9".mime}".default = true;
    mime_guess."${deps.reqwest."0.9.9".mime_guess}".default = true;
    native_tls = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.9".native_tls}"."vendored" =
        (f.native_tls."${deps.reqwest."0.9.9".native_tls}"."vendored" or false) ||
        (reqwest."0.9.9"."default-tls-vendored" or false) ||
        (f."reqwest"."0.9.9"."default-tls-vendored" or false); }
      { "${deps.reqwest."0.9.9".native_tls}".default = true; }
    ];
    reqwest = fold recursiveUpdate {} [
      { "0.9.9".default = (f.reqwest."0.9.9".default or true); }
      { "0.9.9".default-tls =
        (f.reqwest."0.9.9".default-tls or false) ||
        (f.reqwest."0.9.9".default or false) ||
        (reqwest."0.9.9"."default" or false) ||
        (f.reqwest."0.9.9".default-tls-vendored or false) ||
        (reqwest."0.9.9"."default-tls-vendored" or false); }
      { "0.9.9".hyper-old-types =
        (f.reqwest."0.9.9".hyper-old-types or false) ||
        (f.reqwest."0.9.9".hyper-011 or false) ||
        (reqwest."0.9.9"."hyper-011" or false); }
      { "0.9.9".hyper-rustls =
        (f.reqwest."0.9.9".hyper-rustls or false) ||
        (f.reqwest."0.9.9".rustls-tls or false) ||
        (reqwest."0.9.9"."rustls-tls" or false); }
      { "0.9.9".hyper-tls =
        (f.reqwest."0.9.9".hyper-tls or false) ||
        (f.reqwest."0.9.9".default-tls or false) ||
        (reqwest."0.9.9"."default-tls" or false); }
      { "0.9.9".native-tls =
        (f.reqwest."0.9.9".native-tls or false) ||
        (f.reqwest."0.9.9".default-tls or false) ||
        (reqwest."0.9.9"."default-tls" or false); }
      { "0.9.9".rustls =
        (f.reqwest."0.9.9".rustls or false) ||
        (f.reqwest."0.9.9".rustls-tls or false) ||
        (reqwest."0.9.9"."rustls-tls" or false); }
      { "0.9.9".tls =
        (f.reqwest."0.9.9".tls or false) ||
        (f.reqwest."0.9.9".default-tls or false) ||
        (reqwest."0.9.9"."default-tls" or false) ||
        (f.reqwest."0.9.9".rustls-tls or false) ||
        (reqwest."0.9.9"."rustls-tls" or false); }
      { "0.9.9".tokio-rustls =
        (f.reqwest."0.9.9".tokio-rustls or false) ||
        (f.reqwest."0.9.9".rustls-tls or false) ||
        (reqwest."0.9.9"."rustls-tls" or false); }
      { "0.9.9".trust-dns-resolver =
        (f.reqwest."0.9.9".trust-dns-resolver or false) ||
        (f.reqwest."0.9.9".trust-dns or false) ||
        (reqwest."0.9.9"."trust-dns" or false); }
      { "0.9.9".webpki-roots =
        (f.reqwest."0.9.9".webpki-roots or false) ||
        (f.reqwest."0.9.9".rustls-tls or false) ||
        (reqwest."0.9.9"."rustls-tls" or false); }
    ];
    serde."${deps.reqwest."0.9.9".serde}".default = true;
    serde_json."${deps.reqwest."0.9.9".serde_json}".default = true;
    serde_urlencoded."${deps.reqwest."0.9.9".serde_urlencoded}".default = true;
    tokio = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.9".tokio}"."rt-full" = true; }
      { "${deps.reqwest."0.9.9".tokio}".default = (f.tokio."${deps.reqwest."0.9.9".tokio}".default or false); }
    ];
    tokio_executor."${deps.reqwest."0.9.9".tokio_executor}".default = true;
    tokio_io."${deps.reqwest."0.9.9".tokio_io}".default = true;
    tokio_threadpool."${deps.reqwest."0.9.9".tokio_threadpool}".default = true;
    tokio_timer."${deps.reqwest."0.9.9".tokio_timer}".default = true;
    url."${deps.reqwest."0.9.9".url}".default = true;
    uuid = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.9".uuid}"."v4" = true; }
      { "${deps.reqwest."0.9.9".uuid}".default = true; }
    ];
  }) [
    (features_.base64."${deps."reqwest"."0.9.9"."base64"}" deps)
    (features_.bytes."${deps."reqwest"."0.9.9"."bytes"}" deps)
    (features_.encoding_rs."${deps."reqwest"."0.9.9"."encoding_rs"}" deps)
    (features_.futures."${deps."reqwest"."0.9.9"."futures"}" deps)
    (features_.http."${deps."reqwest"."0.9.9"."http"}" deps)
    (features_.hyper."${deps."reqwest"."0.9.9"."hyper"}" deps)
    (features_.hyper_tls."${deps."reqwest"."0.9.9"."hyper_tls"}" deps)
    (features_.libflate."${deps."reqwest"."0.9.9"."libflate"}" deps)
    (features_.log."${deps."reqwest"."0.9.9"."log"}" deps)
    (features_.mime."${deps."reqwest"."0.9.9"."mime"}" deps)
    (features_.mime_guess."${deps."reqwest"."0.9.9"."mime_guess"}" deps)
    (features_.native_tls."${deps."reqwest"."0.9.9"."native_tls"}" deps)
    (features_.serde."${deps."reqwest"."0.9.9"."serde"}" deps)
    (features_.serde_json."${deps."reqwest"."0.9.9"."serde_json"}" deps)
    (features_.serde_urlencoded."${deps."reqwest"."0.9.9"."serde_urlencoded"}" deps)
    (features_.tokio."${deps."reqwest"."0.9.9"."tokio"}" deps)
    (features_.tokio_executor."${deps."reqwest"."0.9.9"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."reqwest"."0.9.9"."tokio_io"}" deps)
    (features_.tokio_threadpool."${deps."reqwest"."0.9.9"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."reqwest"."0.9.9"."tokio_timer"}" deps)
    (features_.url."${deps."reqwest"."0.9.9"."url"}" deps)
    (features_.uuid."${deps."reqwest"."0.9.9"."uuid"}" deps)
  ];


# end
# rust-ini-0.13.0

  crates.rust_ini."0.13.0" = deps: { features?(features_.rust_ini."0.13.0" deps {}) }: buildRustCrate {
    crateName = "rust-ini";
    version = "0.13.0";
    authors = [ "Y. T. Chung <zonyitoo@gmail.com>" ];
    sha256 = "1maf8gny1q4ib3x4kz17d9y0c1080xqj2s4y3ib2pdzd4hhpzzs9";
    libName = "ini";
  };
  features_.rust_ini."0.13.0" = deps: f: updateFeatures f (rec {
    rust_ini."0.13.0".default = (f.rust_ini."0.13.0".default or true);
  }) [];


# end
# rustc-demangle-0.1.13

  crates.rustc_demangle."0.1.13" = deps: { features?(features_.rustc_demangle."0.1.13" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.13";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0sr6cr02araqnlqwc5ghvnafjmkw11vzjswqaz757lvyrcl8xcy6";
  };
  features_.rustc_demangle."0.1.13" = deps: f: updateFeatures f (rec {
    rustc_demangle."0.1.13".default = (f.rustc_demangle."0.1.13".default or true);
  }) [];


# end
# rustc-hash-1.0.1

  crates.rustc_hash."1.0.1" = deps: { features?(features_.rustc_hash."1.0.1" deps {}) }: buildRustCrate {
    crateName = "rustc-hash";
    version = "1.0.1";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0y3d4hni6c4fi97gzqaxj6vr0fngrm3807hm5dqn5r8kcp5jgxk6";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."rustc_hash"."1.0.1"."byteorder"}" deps)
    ]);
  };
  features_.rustc_hash."1.0.1" = deps: f: updateFeatures f (rec {
    byteorder."${deps.rustc_hash."1.0.1".byteorder}".default = true;
    rustc_hash."1.0.1".default = (f.rustc_hash."1.0.1".default or true);
  }) [
    (features_.byteorder."${deps."rustc_hash"."1.0.1"."byteorder"}" deps)
  ];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# rusttype-0.7.5

  crates.rusttype."0.7.5" = deps: { features?(features_.rusttype."0.7.5" deps {}) }: buildRustCrate {
    crateName = "rusttype";
    version = "0.7.5";
    authors = [ "Dylan Ede <dylanede@googlemail.com>" "Jeremy Soller <jackpot51@gmail.com>" "Alex Butler <alexheretic@gmail.com>" ];
    edition = "2018";
    sha256 = "1qk95syx0v8xqwvnsk22nk9hrrn6pgyr97vnssgzjip7am59vwk5";
    dependencies = mapFeatures features ([
      (crates."approx"."${deps."rusttype"."0.7.5"."approx"}" deps)
      (crates."arrayvec"."${deps."rusttype"."0.7.5"."arrayvec"}" deps)
      (crates."ordered_float"."${deps."rusttype"."0.7.5"."ordered_float"}" deps)
      (crates."stb_truetype"."${deps."rusttype"."0.7.5"."stb_truetype"}" deps)
    ]
      ++ (if features.rusttype."0.7.5".crossbeam-deque or false then [ (crates.crossbeam_deque."${deps."rusttype"."0.7.5".crossbeam_deque}" deps) ] else [])
      ++ (if features.rusttype."0.7.5".crossbeam-utils or false then [ (crates.crossbeam_utils."${deps."rusttype"."0.7.5".crossbeam_utils}" deps) ] else [])
      ++ (if features.rusttype."0.7.5".linked-hash-map or false then [ (crates.linked_hash_map."${deps."rusttype"."0.7.5".linked_hash_map}" deps) ] else [])
      ++ (if features.rusttype."0.7.5".num_cpus or false then [ (crates.num_cpus."${deps."rusttype"."0.7.5".num_cpus}" deps) ] else [])
      ++ (if features.rusttype."0.7.5".rustc-hash or false then [ (crates.rustc_hash."${deps."rusttype"."0.7.5".rustc_hash}" deps) ] else []));
    features = mkFeatures (features."rusttype"."0.7.5" or {});
  };
  features_.rusttype."0.7.5" = deps: f: updateFeatures f (rec {
    approx."${deps.rusttype."0.7.5".approx}".default = (f.approx."${deps.rusttype."0.7.5".approx}".default or false);
    arrayvec."${deps.rusttype."0.7.5".arrayvec}".default = (f.arrayvec."${deps.rusttype."0.7.5".arrayvec}".default or false);
    crossbeam_deque."${deps.rusttype."0.7.5".crossbeam_deque}".default = true;
    crossbeam_utils."${deps.rusttype."0.7.5".crossbeam_utils}".default = true;
    linked_hash_map."${deps.rusttype."0.7.5".linked_hash_map}".default = true;
    num_cpus."${deps.rusttype."0.7.5".num_cpus}".default = true;
    ordered_float."${deps.rusttype."0.7.5".ordered_float}".default = true;
    rustc_hash."${deps.rusttype."0.7.5".rustc_hash}".default = true;
    rusttype = fold recursiveUpdate {} [
      { "0.7.5".crossbeam-deque =
        (f.rusttype."0.7.5".crossbeam-deque or false) ||
        (f.rusttype."0.7.5".gpu_cache or false) ||
        (rusttype."0.7.5"."gpu_cache" or false); }
      { "0.7.5".crossbeam-utils =
        (f.rusttype."0.7.5".crossbeam-utils or false) ||
        (f.rusttype."0.7.5".gpu_cache or false) ||
        (rusttype."0.7.5"."gpu_cache" or false); }
      { "0.7.5".default = (f.rusttype."0.7.5".default or true); }
      { "0.7.5".gpu_cache =
        (f.rusttype."0.7.5".gpu_cache or false) ||
        (f.rusttype."0.7.5".bench or false) ||
        (rusttype."0.7.5"."bench" or false); }
      { "0.7.5".linked-hash-map =
        (f.rusttype."0.7.5".linked-hash-map or false) ||
        (f.rusttype."0.7.5".gpu_cache or false) ||
        (rusttype."0.7.5"."gpu_cache" or false); }
      { "0.7.5".num_cpus =
        (f.rusttype."0.7.5".num_cpus or false) ||
        (f.rusttype."0.7.5".gpu_cache or false) ||
        (rusttype."0.7.5"."gpu_cache" or false); }
      { "0.7.5".rustc-hash =
        (f.rusttype."0.7.5".rustc-hash or false) ||
        (f.rusttype."0.7.5".gpu_cache or false) ||
        (rusttype."0.7.5"."gpu_cache" or false); }
    ];
    stb_truetype."${deps.rusttype."0.7.5".stb_truetype}".default = true;
  }) [
    (features_.approx."${deps."rusttype"."0.7.5"."approx"}" deps)
    (features_.arrayvec."${deps."rusttype"."0.7.5"."arrayvec"}" deps)
    (features_.crossbeam_deque."${deps."rusttype"."0.7.5"."crossbeam_deque"}" deps)
    (features_.crossbeam_utils."${deps."rusttype"."0.7.5"."crossbeam_utils"}" deps)
    (features_.linked_hash_map."${deps."rusttype"."0.7.5"."linked_hash_map"}" deps)
    (features_.num_cpus."${deps."rusttype"."0.7.5"."num_cpus"}" deps)
    (features_.ordered_float."${deps."rusttype"."0.7.5"."ordered_float"}" deps)
    (features_.rustc_hash."${deps."rusttype"."0.7.5"."rustc_hash"}" deps)
    (features_.stb_truetype."${deps."rusttype"."0.7.5"."stb_truetype"}" deps)
  ];


# end
# ryu-0.2.7

  crates.ryu."0.2.7" = deps: { features?(features_.ryu."0.2.7" deps {}) }: buildRustCrate {
    crateName = "ryu";
    version = "0.2.7";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0m8szf1m87wfqkwh1f9zp9bn2mb0m9nav028xxnd0hlig90b44bd";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ryu"."0.2.7" or {});
  };
  features_.ryu."0.2.7" = deps: f: updateFeatures f (rec {
    ryu."0.2.7".default = (f.ryu."0.2.7".default or true);
  }) [];


# end
# same-file-1.0.4

  crates.same_file."1.0.4" = deps: { features?(features_.same_file."1.0.4" deps {}) }: buildRustCrate {
    crateName = "same-file";
    version = "1.0.4";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1zs244ssl381cqlnh2g42g3i60qip4z72i26z44d6kas3y3gy77q";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi_util"."${deps."same_file"."1.0.4"."winapi_util"}" deps)
    ]) else []);
  };
  features_.same_file."1.0.4" = deps: f: updateFeatures f (rec {
    same_file."1.0.4".default = (f.same_file."1.0.4".default or true);
    winapi_util."${deps.same_file."1.0.4".winapi_util}".default = true;
  }) [
    (features_.winapi_util."${deps."same_file"."1.0.4"."winapi_util"}" deps)
  ];


# end
# schannel-0.1.14

  crates.schannel."0.1.14" = deps: { features?(features_.schannel."0.1.14" deps {}) }: buildRustCrate {
    crateName = "schannel";
    version = "0.1.14";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Steffen Butzer <steffen.butzer@outlook.com>" ];
    sha256 = "1g0a88jknns1kwn3x1k3ci5y5zvg58pwdg1xrxkrw3cwd2hynm9k";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."schannel"."0.1.14"."lazy_static"}" deps)
      (crates."winapi"."${deps."schannel"."0.1.14"."winapi"}" deps)
    ]);
  };
  features_.schannel."0.1.14" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.schannel."0.1.14".lazy_static}".default = true;
    schannel."0.1.14".default = (f.schannel."0.1.14".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.schannel."0.1.14".winapi}"."lmcons" = true; }
      { "${deps.schannel."0.1.14".winapi}"."minschannel" = true; }
      { "${deps.schannel."0.1.14".winapi}"."schannel" = true; }
      { "${deps.schannel."0.1.14".winapi}"."securitybaseapi" = true; }
      { "${deps.schannel."0.1.14".winapi}"."sspi" = true; }
      { "${deps.schannel."0.1.14".winapi}"."sysinfoapi" = true; }
      { "${deps.schannel."0.1.14".winapi}"."timezoneapi" = true; }
      { "${deps.schannel."0.1.14".winapi}"."winbase" = true; }
      { "${deps.schannel."0.1.14".winapi}"."wincrypt" = true; }
      { "${deps.schannel."0.1.14".winapi}"."winerror" = true; }
      { "${deps.schannel."0.1.14".winapi}".default = true; }
    ];
  }) [
    (features_.lazy_static."${deps."schannel"."0.1.14"."lazy_static"}" deps)
    (features_.winapi."${deps."schannel"."0.1.14"."winapi"}" deps)
  ];


# end
# scopeguard-0.3.3

  crates.scopeguard."0.3.3" = deps: { features?(features_.scopeguard."0.3.3" deps {}) }: buildRustCrate {
    crateName = "scopeguard";
    version = "0.3.3";
    authors = [ "bluss" ];
    sha256 = "0i1l013csrqzfz6c68pr5pi01hg5v5yahq8fsdmaxy6p8ygsjf3r";
    features = mkFeatures (features."scopeguard"."0.3.3" or {});
  };
  features_.scopeguard."0.3.3" = deps: f: updateFeatures f (rec {
    scopeguard = fold recursiveUpdate {} [
      { "0.3.3".default = (f.scopeguard."0.3.3".default or true); }
      { "0.3.3".use_std =
        (f.scopeguard."0.3.3".use_std or false) ||
        (f.scopeguard."0.3.3".default or false) ||
        (scopeguard."0.3.3"."default" or false); }
    ];
  }) [];


# end
# security-framework-0.2.2

  crates.security_framework."0.2.2" = deps: { features?(features_.security_framework."0.2.2" deps {}) }: buildRustCrate {
    crateName = "security-framework";
    version = "0.2.2";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Kornel <kornel@geekhood.net>" ];
    sha256 = "1hs3xk4fq3641nrzfgm5m9hbwg1k5bxnhhj6s8yh1xnhlkrlndf0";
    dependencies = mapFeatures features ([
      (crates."core_foundation"."${deps."security_framework"."0.2.2"."core_foundation"}" deps)
      (crates."core_foundation_sys"."${deps."security_framework"."0.2.2"."core_foundation_sys"}" deps)
      (crates."libc"."${deps."security_framework"."0.2.2"."libc"}" deps)
      (crates."security_framework_sys"."${deps."security_framework"."0.2.2"."security_framework_sys"}" deps)
    ]);
    features = mkFeatures (features."security_framework"."0.2.2" or {});
  };
  features_.security_framework."0.2.2" = deps: f: updateFeatures f (rec {
    core_foundation."${deps.security_framework."0.2.2".core_foundation}".default = true;
    core_foundation_sys."${deps.security_framework."0.2.2".core_foundation_sys}".default = true;
    libc."${deps.security_framework."0.2.2".libc}".default = true;
    security_framework = fold recursiveUpdate {} [
      { "0.2.2".OSX_10_10 =
        (f.security_framework."0.2.2".OSX_10_10 or false) ||
        (f.security_framework."0.2.2".OSX_10_11 or false) ||
        (security_framework."0.2.2"."OSX_10_11" or false); }
      { "0.2.2".OSX_10_11 =
        (f.security_framework."0.2.2".OSX_10_11 or false) ||
        (f.security_framework."0.2.2".OSX_10_12 or false) ||
        (security_framework."0.2.2"."OSX_10_12" or false); }
      { "0.2.2".OSX_10_12 =
        (f.security_framework."0.2.2".OSX_10_12 or false) ||
        (f.security_framework."0.2.2".OSX_10_13 or false) ||
        (security_framework."0.2.2"."OSX_10_13" or false); }
      { "0.2.2".OSX_10_9 =
        (f.security_framework."0.2.2".OSX_10_9 or false) ||
        (f.security_framework."0.2.2".OSX_10_10 or false) ||
        (security_framework."0.2.2"."OSX_10_10" or false); }
      { "0.2.2".alpn =
        (f.security_framework."0.2.2".alpn or false) ||
        (f.security_framework."0.2.2".OSX_10_13 or false) ||
        (security_framework."0.2.2"."OSX_10_13" or false); }
      { "0.2.2".default = (f.security_framework."0.2.2".default or true); }
    ];
    security_framework_sys = fold recursiveUpdate {} [
      { "${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_10" =
        (f.security_framework_sys."${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_10" or false) ||
        (security_framework."0.2.2"."OSX_10_10" or false) ||
        (f."security_framework"."0.2.2"."OSX_10_10" or false); }
      { "${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_11" =
        (f.security_framework_sys."${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_11" or false) ||
        (security_framework."0.2.2"."OSX_10_11" or false) ||
        (f."security_framework"."0.2.2"."OSX_10_11" or false); }
      { "${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_12" =
        (f.security_framework_sys."${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_12" or false) ||
        (security_framework."0.2.2"."OSX_10_12" or false) ||
        (f."security_framework"."0.2.2"."OSX_10_12" or false); }
      { "${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_13" =
        (f.security_framework_sys."${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_13" or false) ||
        (security_framework."0.2.2"."OSX_10_13" or false) ||
        (f."security_framework"."0.2.2"."OSX_10_13" or false); }
      { "${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_9" =
        (f.security_framework_sys."${deps.security_framework."0.2.2".security_framework_sys}"."OSX_10_9" or false) ||
        (security_framework."0.2.2"."OSX_10_9" or false) ||
        (f."security_framework"."0.2.2"."OSX_10_9" or false); }
      { "${deps.security_framework."0.2.2".security_framework_sys}".default = true; }
    ];
  }) [
    (features_.core_foundation."${deps."security_framework"."0.2.2"."core_foundation"}" deps)
    (features_.core_foundation_sys."${deps."security_framework"."0.2.2"."core_foundation_sys"}" deps)
    (features_.libc."${deps."security_framework"."0.2.2"."libc"}" deps)
    (features_.security_framework_sys."${deps."security_framework"."0.2.2"."security_framework_sys"}" deps)
  ];


# end
# security-framework-sys-0.2.3

  crates.security_framework_sys."0.2.3" = deps: { features?(features_.security_framework_sys."0.2.3" deps {}) }: buildRustCrate {
    crateName = "security-framework-sys";
    version = "0.2.3";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Kornel <kornel@geekhood.net>" ];
    sha256 = "0j9v5gxn25fk24d1mcwdwgwm5b4ll0z4a33gkq4ajqdc97jazmr1";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."MacTypes_sys"."${deps."security_framework_sys"."0.2.3"."MacTypes_sys"}" deps)
      (crates."core_foundation_sys"."${deps."security_framework_sys"."0.2.3"."core_foundation_sys"}" deps)
      (crates."libc"."${deps."security_framework_sys"."0.2.3"."libc"}" deps)
    ]);
    features = mkFeatures (features."security_framework_sys"."0.2.3" or {});
  };
  features_.security_framework_sys."0.2.3" = deps: f: updateFeatures f (rec {
    MacTypes_sys."${deps.security_framework_sys."0.2.3".MacTypes_sys}".default = true;
    core_foundation_sys."${deps.security_framework_sys."0.2.3".core_foundation_sys}".default = true;
    libc."${deps.security_framework_sys."0.2.3".libc}".default = true;
    security_framework_sys = fold recursiveUpdate {} [
      { "0.2.3".OSX_10_10 =
        (f.security_framework_sys."0.2.3".OSX_10_10 or false) ||
        (f.security_framework_sys."0.2.3".OSX_10_11 or false) ||
        (security_framework_sys."0.2.3"."OSX_10_11" or false); }
      { "0.2.3".OSX_10_11 =
        (f.security_framework_sys."0.2.3".OSX_10_11 or false) ||
        (f.security_framework_sys."0.2.3".OSX_10_12 or false) ||
        (security_framework_sys."0.2.3"."OSX_10_12" or false); }
      { "0.2.3".OSX_10_12 =
        (f.security_framework_sys."0.2.3".OSX_10_12 or false) ||
        (f.security_framework_sys."0.2.3".OSX_10_13 or false) ||
        (security_framework_sys."0.2.3"."OSX_10_13" or false); }
      { "0.2.3".OSX_10_9 =
        (f.security_framework_sys."0.2.3".OSX_10_9 or false) ||
        (f.security_framework_sys."0.2.3".OSX_10_10 or false) ||
        (security_framework_sys."0.2.3"."OSX_10_10" or false); }
      { "0.2.3".default = (f.security_framework_sys."0.2.3".default or true); }
    ];
  }) [
    (features_.MacTypes_sys."${deps."security_framework_sys"."0.2.3"."MacTypes_sys"}" deps)
    (features_.core_foundation_sys."${deps."security_framework_sys"."0.2.3"."core_foundation_sys"}" deps)
    (features_.libc."${deps."security_framework_sys"."0.2.3"."libc"}" deps)
  ];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
      { "0.9.0".serde =
        (f.semver."0.9.0".serde or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-0.8.23

  crates.serde."0.8.23" = deps: { features?(features_.serde."0.8.23" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "0.8.23";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" ];
    sha256 = "1pnkxndnb4fg41lmacp260yjxwfcywpvhbxybdysh3byjh1fjqms";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."0.8.23" or {});
  };
  features_.serde."0.8.23" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "0.8.23".alloc =
        (f.serde."0.8.23".alloc or false) ||
        (f.serde."0.8.23".collections or false) ||
        (serde."0.8.23"."collections" or false); }
      { "0.8.23".clippy =
        (f.serde."0.8.23".clippy or false) ||
        (f.serde."0.8.23".unstable-testing or false) ||
        (serde."0.8.23"."unstable-testing" or false); }
      { "0.8.23".default = (f.serde."0.8.23".default or true); }
      { "0.8.23".std =
        (f.serde."0.8.23".std or false) ||
        (f.serde."0.8.23".default or false) ||
        (serde."0.8.23"."default" or false) ||
        (f.serde."0.8.23".unstable-testing or false) ||
        (serde."0.8.23"."unstable-testing" or false); }
      { "0.8.23".unstable =
        (f.serde."0.8.23".unstable or false) ||
        (f.serde."0.8.23".alloc or false) ||
        (serde."0.8.23"."alloc" or false) ||
        (f.serde."0.8.23".unstable-testing or false) ||
        (serde."0.8.23"."unstable-testing" or false); }
    ];
  }) [];


# end
# serde-1.0.87

  crates.serde."1.0.87" = deps: { features?(features_.serde."1.0.87" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.87";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0zd9262nskpqxwd9dzp740zv0fr7c7dvagmj6l40ay99kg7z4rwg";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."1.0.87" or {});
  };
  features_.serde."1.0.87" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.87".default = (f.serde."1.0.87".default or true); }
      { "1.0.87".serde_derive =
        (f.serde."1.0.87".serde_derive or false) ||
        (f.serde."1.0.87".derive or false) ||
        (serde."1.0.87"."derive" or false); }
      { "1.0.87".std =
        (f.serde."1.0.87".std or false) ||
        (f.serde."1.0.87".default or false) ||
        (serde."1.0.87"."default" or false); }
      { "1.0.87".unstable =
        (f.serde."1.0.87".unstable or false) ||
        (f.serde."1.0.87".alloc or false) ||
        (serde."1.0.87"."alloc" or false); }
    ];
  }) [];


# end
# serde-hjson-0.8.2

  crates.serde_hjson."0.8.2" = deps: { features?(features_.serde_hjson."0.8.2" deps {}) }: buildRustCrate {
    crateName = "serde-hjson";
    version = "0.8.2";
    authors = [ "Christian Zangl <laktak@cdak.net>" ];
    sha256 = "1059hh4dwrfxkabbn97gdrf3dkipg1z4i7n0kv20nzjxidvyk3v3";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."serde_hjson"."0.8.2"."lazy_static"}" deps)
      (crates."num_traits"."${deps."serde_hjson"."0.8.2"."num_traits"}" deps)
      (crates."regex"."${deps."serde_hjson"."0.8.2"."regex"}" deps)
      (crates."serde"."${deps."serde_hjson"."0.8.2"."serde"}" deps)
    ]
      ++ (if features.serde_hjson."0.8.2".linked-hash-map or false then [ (crates.linked_hash_map."${deps."serde_hjson"."0.8.2".linked_hash_map}" deps) ] else []));
    features = mkFeatures (features."serde_hjson"."0.8.2" or {});
  };
  features_.serde_hjson."0.8.2" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.serde_hjson."0.8.2".lazy_static}".default = true;
    linked_hash_map = fold recursiveUpdate {} [
      { "${deps.serde_hjson."0.8.2".linked_hash_map}"."serde_impl" =
        (f.linked_hash_map."${deps.serde_hjson."0.8.2".linked_hash_map}"."serde_impl" or false) ||
        (serde_hjson."0.8.2"."preserve_order" or false) ||
        (f."serde_hjson"."0.8.2"."preserve_order" or false); }
      { "${deps.serde_hjson."0.8.2".linked_hash_map}".default = true; }
    ];
    num_traits."${deps.serde_hjson."0.8.2".num_traits}".default = true;
    regex."${deps.serde_hjson."0.8.2".regex}".default = true;
    serde."${deps.serde_hjson."0.8.2".serde}".default = true;
    serde_hjson = fold recursiveUpdate {} [
      { "0.8.2".clippy =
        (f.serde_hjson."0.8.2".clippy or false) ||
        (f.serde_hjson."0.8.2".unstable-testing or false) ||
        (serde_hjson."0.8.2"."unstable-testing" or false); }
      { "0.8.2".default = (f.serde_hjson."0.8.2".default or true); }
      { "0.8.2".linked-hash-map =
        (f.serde_hjson."0.8.2".linked-hash-map or false) ||
        (f.serde_hjson."0.8.2".preserve_order or false) ||
        (serde_hjson."0.8.2"."preserve_order" or false); }
      { "0.8.2".preserve_order =
        (f.serde_hjson."0.8.2".preserve_order or false) ||
        (f.serde_hjson."0.8.2".default or false) ||
        (serde_hjson."0.8.2"."default" or false); }
    ];
  }) [
    (features_.lazy_static."${deps."serde_hjson"."0.8.2"."lazy_static"}" deps)
    (features_.linked_hash_map."${deps."serde_hjson"."0.8.2"."linked_hash_map"}" deps)
    (features_.num_traits."${deps."serde_hjson"."0.8.2"."num_traits"}" deps)
    (features_.regex."${deps."serde_hjson"."0.8.2"."regex"}" deps)
    (features_.serde."${deps."serde_hjson"."0.8.2"."serde"}" deps)
  ];


# end
# serde_derive-1.0.87

  crates.serde_derive."1.0.87" = deps: { features?(features_.serde_derive."1.0.87" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.87";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0fqis7230158fkvdcvjg5vvv0rp2cvs5m84fyhczk5qdsb0k2b3s";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.87"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.87"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.87"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.87" or {});
  };
  features_.serde_derive."1.0.87" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.87".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.87".quote}".default = true;
    serde_derive."1.0.87".default = (f.serde_derive."1.0.87".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.87".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.87".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.87"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.87"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.87"."syn"}" deps)
  ];


# end
# serde_json-1.0.38

  crates.serde_json."1.0.38" = deps: { features?(features_.serde_json."1.0.38" deps {}) }: buildRustCrate {
    crateName = "serde_json";
    version = "1.0.38";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "10zhcsk1qh92320fjmgrdd23jf99rr504gp3d5nv9fddy5viq6a1";
    dependencies = mapFeatures features ([
      (crates."itoa"."${deps."serde_json"."1.0.38"."itoa"}" deps)
      (crates."ryu"."${deps."serde_json"."1.0.38"."ryu"}" deps)
      (crates."serde"."${deps."serde_json"."1.0.38"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_json"."1.0.38" or {});
  };
  features_.serde_json."1.0.38" = deps: f: updateFeatures f (rec {
    itoa."${deps.serde_json."1.0.38".itoa}".default = true;
    ryu."${deps.serde_json."1.0.38".ryu}".default = true;
    serde."${deps.serde_json."1.0.38".serde}".default = true;
    serde_json = fold recursiveUpdate {} [
      { "1.0.38".default = (f.serde_json."1.0.38".default or true); }
      { "1.0.38".indexmap =
        (f.serde_json."1.0.38".indexmap or false) ||
        (f.serde_json."1.0.38".preserve_order or false) ||
        (serde_json."1.0.38"."preserve_order" or false); }
    ];
  }) [
    (features_.itoa."${deps."serde_json"."1.0.38"."itoa"}" deps)
    (features_.ryu."${deps."serde_json"."1.0.38"."ryu"}" deps)
    (features_.serde."${deps."serde_json"."1.0.38"."serde"}" deps)
  ];


# end
# serde_test-0.8.23

  crates.serde_test."0.8.23" = deps: { features?(features_.serde_test."0.8.23" deps {}) }: buildRustCrate {
    crateName = "serde_test";
    version = "0.8.23";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" ];
    sha256 = "1snfbfw6jf9d5aw7q8gs4bi72qcqd6q9iwr8h9flfj4dhyz0vn04";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."serde_test"."0.8.23"."serde"}" deps)
    ]);
  };
  features_.serde_test."0.8.23" = deps: f: updateFeatures f (rec {
    serde."${deps.serde_test."0.8.23".serde}".default = true;
    serde_test."0.8.23".default = (f.serde_test."0.8.23".default or true);
  }) [
    (features_.serde."${deps."serde_test"."0.8.23"."serde"}" deps)
  ];


# end
# serde_urlencoded-0.5.4

  crates.serde_urlencoded."0.5.4" = deps: { features?(features_.serde_urlencoded."0.5.4" deps {}) }: buildRustCrate {
    crateName = "serde_urlencoded";
    version = "0.5.4";
    authors = [ "Anthony Ramine <n.oxyde@gmail.com>" ];
    sha256 = "01dbyyr73ilyz3yqfmalhxs9zpsqvfvzj977199lh5v9j7dwh6cc";
    dependencies = mapFeatures features ([
      (crates."dtoa"."${deps."serde_urlencoded"."0.5.4"."dtoa"}" deps)
      (crates."itoa"."${deps."serde_urlencoded"."0.5.4"."itoa"}" deps)
      (crates."serde"."${deps."serde_urlencoded"."0.5.4"."serde"}" deps)
      (crates."url"."${deps."serde_urlencoded"."0.5.4"."url"}" deps)
    ]);
  };
  features_.serde_urlencoded."0.5.4" = deps: f: updateFeatures f (rec {
    dtoa."${deps.serde_urlencoded."0.5.4".dtoa}".default = true;
    itoa."${deps.serde_urlencoded."0.5.4".itoa}".default = true;
    serde."${deps.serde_urlencoded."0.5.4".serde}".default = true;
    serde_urlencoded."0.5.4".default = (f.serde_urlencoded."0.5.4".default or true);
    url."${deps.serde_urlencoded."0.5.4".url}".default = true;
  }) [
    (features_.dtoa."${deps."serde_urlencoded"."0.5.4"."dtoa"}" deps)
    (features_.itoa."${deps."serde_urlencoded"."0.5.4"."itoa"}" deps)
    (features_.serde."${deps."serde_urlencoded"."0.5.4"."serde"}" deps)
    (features_.url."${deps."serde_urlencoded"."0.5.4"."url"}" deps)
  ];


# end
# sha2-0.8.0

  crates.sha2."0.8.0" = deps: { features?(features_.sha2."0.8.0" deps {}) }: buildRustCrate {
    crateName = "sha2";
    version = "0.8.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0jhg56v7m6mj3jb857np4qvr72146garnabcgdk368fm0csfs1sq";
    dependencies = mapFeatures features ([
      (crates."block_buffer"."${deps."sha2"."0.8.0"."block_buffer"}" deps)
      (crates."digest"."${deps."sha2"."0.8.0"."digest"}" deps)
      (crates."fake_simd"."${deps."sha2"."0.8.0"."fake_simd"}" deps)
      (crates."opaque_debug"."${deps."sha2"."0.8.0"."opaque_debug"}" deps)
    ]);
    features = mkFeatures (features."sha2"."0.8.0" or {});
  };
  features_.sha2."0.8.0" = deps: f: updateFeatures f (rec {
    block_buffer."${deps.sha2."0.8.0".block_buffer}".default = true;
    digest = fold recursiveUpdate {} [
      { "${deps.sha2."0.8.0".digest}"."std" =
        (f.digest."${deps.sha2."0.8.0".digest}"."std" or false) ||
        (sha2."0.8.0"."std" or false) ||
        (f."sha2"."0.8.0"."std" or false); }
      { "${deps.sha2."0.8.0".digest}".default = true; }
    ];
    fake_simd."${deps.sha2."0.8.0".fake_simd}".default = true;
    opaque_debug."${deps.sha2."0.8.0".opaque_debug}".default = true;
    sha2 = fold recursiveUpdate {} [
      { "0.8.0".default = (f.sha2."0.8.0".default or true); }
      { "0.8.0".sha2-asm =
        (f.sha2."0.8.0".sha2-asm or false) ||
        (f.sha2."0.8.0".asm or false) ||
        (sha2."0.8.0"."asm" or false); }
      { "0.8.0".std =
        (f.sha2."0.8.0".std or false) ||
        (f.sha2."0.8.0".default or false) ||
        (sha2."0.8.0"."default" or false); }
    ];
  }) [
    (features_.block_buffer."${deps."sha2"."0.8.0"."block_buffer"}" deps)
    (features_.digest."${deps."sha2"."0.8.0"."digest"}" deps)
    (features_.fake_simd."${deps."sha2"."0.8.0"."fake_simd"}" deps)
    (features_.opaque_debug."${deps."sha2"."0.8.0"."opaque_debug"}" deps)
  ];


# end
# shared_library-0.1.9

  crates.shared_library."0.1.9" = deps: { features?(features_.shared_library."0.1.9" deps {}) }: buildRustCrate {
    crateName = "shared_library";
    version = "0.1.9";
    authors = [ "Pierre Krieger <pierre.krieger1708@gmail.com>" ];
    sha256 = "1qigg15p9hjv2aiqq7251zqy4gpjdkpyzsvnfggclb6rgb0cf2sn";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."shared_library"."0.1.9"."lazy_static"}" deps)
      (crates."libc"."${deps."shared_library"."0.1.9"."libc"}" deps)
    ]);
  };
  features_.shared_library."0.1.9" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.shared_library."0.1.9".lazy_static}".default = true;
    libc."${deps.shared_library."0.1.9".libc}".default = true;
    shared_library."0.1.9".default = (f.shared_library."0.1.9".default or true);
  }) [
    (features_.lazy_static."${deps."shared_library"."0.1.9"."lazy_static"}" deps)
    (features_.libc."${deps."shared_library"."0.1.9"."libc"}" deps)
  ];


# end
# siphasher-0.2.3

  crates.siphasher."0.2.3" = deps: { features?(features_.siphasher."0.2.3" deps {}) }: buildRustCrate {
    crateName = "siphasher";
    version = "0.2.3";
    authors = [ "Frank Denis <github@pureftpd.org>" ];
    sha256 = "1ganj1grxqnkvv4ds3vby039bm999jrr58nfq2x3kjhzkw2bnqkw";
  };
  features_.siphasher."0.2.3" = deps: f: updateFeatures f (rec {
    siphasher."0.2.3".default = (f.siphasher."0.2.3".default or true);
  }) [];


# end
# slab-0.4.2

  crates.slab."0.4.2" = deps: { features?(features_.slab."0.4.2" deps {}) }: buildRustCrate {
    crateName = "slab";
    version = "0.4.2";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0h1l2z7qy6207kv0v3iigdf2xfk9yrhbwj1svlxk6wxjmdxvgdl7";
  };
  features_.slab."0.4.2" = deps: f: updateFeatures f (rec {
    slab."0.4.2".default = (f.slab."0.4.2".default or true);
  }) [];


# end
# smallvec-0.6.8

  crates.smallvec."0.6.8" = deps: { features?(features_.smallvec."0.6.8" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.8";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "1rqy0k6ilv8yqf9aasrhc7n3gx1m2rpfqfbqzk5wdjmgi4y63m1a";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
      (crates."unreachable"."${deps."smallvec"."0.6.8"."unreachable"}" deps)
    ]);
    features = mkFeatures (features."smallvec"."0.6.8" or {});
  };
  features_.smallvec."0.6.8" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.8".default = (f.smallvec."0.6.8".default or true); }
      { "0.6.8".std =
        (f.smallvec."0.6.8".std or false) ||
        (f.smallvec."0.6.8".default or false) ||
        (smallvec."0.6.8"."default" or false); }
    ];
    unreachable."${deps.smallvec."0.6.8".unreachable}".default = true;
  }) [
    (features_.unreachable."${deps."smallvec"."0.6.8"."unreachable"}" deps)
  ];


# end
# smithay-client-toolkit-0.4.4

  crates.smithay_client_toolkit."0.4.4" = deps: { features?(features_.smithay_client_toolkit."0.4.4" deps {}) }: buildRustCrate {
    crateName = "smithay-client-toolkit";
    version = "0.4.4";
    authors = [ "Victor Berger <victor.berger@m4x.org>" ];
    sha256 = "1cwjmghhgmbyfwb9yag50d28f1q9nywhj859lbpj3lhzhqz5ds69";
    dependencies = mapFeatures features ([
      (crates."andrew"."${deps."smithay_client_toolkit"."0.4.4"."andrew"}" deps)
      (crates."bitflags"."${deps."smithay_client_toolkit"."0.4.4"."bitflags"}" deps)
      (crates."dlib"."${deps."smithay_client_toolkit"."0.4.4"."dlib"}" deps)
      (crates."lazy_static"."${deps."smithay_client_toolkit"."0.4.4"."lazy_static"}" deps)
      (crates."memmap"."${deps."smithay_client_toolkit"."0.4.4"."memmap"}" deps)
      (crates."nix"."${deps."smithay_client_toolkit"."0.4.4"."nix"}" deps)
      (crates."rand"."${deps."smithay_client_toolkit"."0.4.4"."rand"}" deps)
      (crates."wayland_client"."${deps."smithay_client_toolkit"."0.4.4"."wayland_client"}" deps)
      (crates."wayland_commons"."${deps."smithay_client_toolkit"."0.4.4"."wayland_commons"}" deps)
      (crates."wayland_protocols"."${deps."smithay_client_toolkit"."0.4.4"."wayland_protocols"}" deps)
    ]);
  };
  features_.smithay_client_toolkit."0.4.4" = deps: f: updateFeatures f (rec {
    andrew."${deps.smithay_client_toolkit."0.4.4".andrew}".default = true;
    bitflags."${deps.smithay_client_toolkit."0.4.4".bitflags}".default = true;
    dlib."${deps.smithay_client_toolkit."0.4.4".dlib}".default = true;
    lazy_static."${deps.smithay_client_toolkit."0.4.4".lazy_static}".default = true;
    memmap."${deps.smithay_client_toolkit."0.4.4".memmap}".default = true;
    nix."${deps.smithay_client_toolkit."0.4.4".nix}".default = true;
    rand."${deps.smithay_client_toolkit."0.4.4".rand}".default = true;
    smithay_client_toolkit."0.4.4".default = (f.smithay_client_toolkit."0.4.4".default or true);
    wayland_client = fold recursiveUpdate {} [
      { "${deps.smithay_client_toolkit."0.4.4".wayland_client}"."cursor" = true; }
      { "${deps.smithay_client_toolkit."0.4.4".wayland_client}".default = true; }
    ];
    wayland_commons."${deps.smithay_client_toolkit."0.4.4".wayland_commons}".default = true;
    wayland_protocols = fold recursiveUpdate {} [
      { "${deps.smithay_client_toolkit."0.4.4".wayland_protocols}"."native_client" = true; }
      { "${deps.smithay_client_toolkit."0.4.4".wayland_protocols}"."unstable_protocols" = true; }
      { "${deps.smithay_client_toolkit."0.4.4".wayland_protocols}".default = true; }
    ];
  }) [
    (features_.andrew."${deps."smithay_client_toolkit"."0.4.4"."andrew"}" deps)
    (features_.bitflags."${deps."smithay_client_toolkit"."0.4.4"."bitflags"}" deps)
    (features_.dlib."${deps."smithay_client_toolkit"."0.4.4"."dlib"}" deps)
    (features_.lazy_static."${deps."smithay_client_toolkit"."0.4.4"."lazy_static"}" deps)
    (features_.memmap."${deps."smithay_client_toolkit"."0.4.4"."memmap"}" deps)
    (features_.nix."${deps."smithay_client_toolkit"."0.4.4"."nix"}" deps)
    (features_.rand."${deps."smithay_client_toolkit"."0.4.4"."rand"}" deps)
    (features_.wayland_client."${deps."smithay_client_toolkit"."0.4.4"."wayland_client"}" deps)
    (features_.wayland_commons."${deps."smithay_client_toolkit"."0.4.4"."wayland_commons"}" deps)
    (features_.wayland_protocols."${deps."smithay_client_toolkit"."0.4.4"."wayland_protocols"}" deps)
  ];


# end
# stable_deref_trait-1.1.1

  crates.stable_deref_trait."1.1.1" = deps: { features?(features_.stable_deref_trait."1.1.1" deps {}) }: buildRustCrate {
    crateName = "stable_deref_trait";
    version = "1.1.1";
    authors = [ "Robert Grosse <n210241048576@gmail.com>" ];
    sha256 = "1xy9slzslrzr31nlnw52sl1d820b09y61b7f13lqgsn8n7y0l4g8";
    features = mkFeatures (features."stable_deref_trait"."1.1.1" or {});
  };
  features_.stable_deref_trait."1.1.1" = deps: f: updateFeatures f (rec {
    stable_deref_trait = fold recursiveUpdate {} [
      { "1.1.1".default = (f.stable_deref_trait."1.1.1".default or true); }
      { "1.1.1".std =
        (f.stable_deref_trait."1.1.1".std or false) ||
        (f.stable_deref_trait."1.1.1".default or false) ||
        (stable_deref_trait."1.1.1"."default" or false); }
    ];
  }) [];


# end
# stb_truetype-0.2.6

  crates.stb_truetype."0.2.6" = deps: { features?(features_.stb_truetype."0.2.6" deps {}) }: buildRustCrate {
    crateName = "stb_truetype";
    version = "0.2.6";
    authors = [ "Dylan Ede <dylanede@googlemail.com>" "Alex Butler <alexheretic@gmail.com>" ];
    edition = "2018";
    sha256 = "0y6c54nm7i8lrybl364lzk6xdh970a1d1cl5v1iczwdz134bi4r4";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."stb_truetype"."0.2.6"."byteorder"}" deps)
    ]);
  };
  features_.stb_truetype."0.2.6" = deps: f: updateFeatures f (rec {
    byteorder."${deps.stb_truetype."0.2.6".byteorder}".default = true;
    stb_truetype."0.2.6".default = (f.stb_truetype."0.2.6".default or true);
  }) [
    (features_.byteorder."${deps."stb_truetype"."0.2.6"."byteorder"}" deps)
  ];


# end
# string-0.1.3

  crates.string."0.1.3" = deps: { features?(features_.string."0.1.3" deps {}) }: buildRustCrate {
    crateName = "string";
    version = "0.1.3";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "03hr559lsxf13i1p5r2zd7m3ppqlbhqajbx80adi3cpp2rwnsvfw";
  };
  features_.string."0.1.3" = deps: f: updateFeatures f (rec {
    string."0.1.3".default = (f.string."0.1.3".default or true);
  }) [];


# end
# stringprep-0.1.2

  crates.stringprep."0.1.2" = deps: { features?(features_.stringprep."0.1.2" deps {}) }: buildRustCrate {
    crateName = "stringprep";
    version = "0.1.2";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "19spyjb44j3iv3x3a22cf70w1m847six5d9gkfaxmjbxcv3ynn8j";
    dependencies = mapFeatures features ([
      (crates."unicode_bidi"."${deps."stringprep"."0.1.2"."unicode_bidi"}" deps)
      (crates."unicode_normalization"."${deps."stringprep"."0.1.2"."unicode_normalization"}" deps)
    ]);
  };
  features_.stringprep."0.1.2" = deps: f: updateFeatures f (rec {
    stringprep."0.1.2".default = (f.stringprep."0.1.2".default or true);
    unicode_bidi."${deps.stringprep."0.1.2".unicode_bidi}".default = true;
    unicode_normalization."${deps.stringprep."0.1.2".unicode_normalization}".default = true;
  }) [
    (features_.unicode_bidi."${deps."stringprep"."0.1.2"."unicode_bidi"}" deps)
    (features_.unicode_normalization."${deps."stringprep"."0.1.2"."unicode_normalization"}" deps)
  ];


# end
# subtle-1.0.0

  crates.subtle."1.0.0" = deps: { features?(features_.subtle."1.0.0" deps {}) }: buildRustCrate {
    crateName = "subtle";
    version = "1.0.0";
    authors = [ "Isis Lovecruft <isis@patternsinthevoid.net>" "Henry de Valence <hdevalence@hdevalence.ca>" ];
    sha256 = "0602qq101arxz39lgbc5fxbr01zffrvd9p5wgmsh36c5675kz8h1";
    features = mkFeatures (features."subtle"."1.0.0" or {});
  };
  features_.subtle."1.0.0" = deps: f: updateFeatures f (rec {
    subtle = fold recursiveUpdate {} [
      { "1.0.0".default = (f.subtle."1.0.0".default or true); }
      { "1.0.0".i128 =
        (f.subtle."1.0.0".i128 or false) ||
        (f.subtle."1.0.0".default or false) ||
        (subtle."1.0.0"."default" or false); }
      { "1.0.0".std =
        (f.subtle."1.0.0".std or false) ||
        (f.subtle."1.0.0".default or false) ||
        (subtle."1.0.0"."default" or false); }
    ];
  }) [];


# end
# syn-0.15.26

  crates.syn."0.15.26" = deps: { features?(features_.syn."0.15.26" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.26";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "12kf63vxbiirycv10zzxw3g8a3cxblmpi6kx4xxz4csd15wapxid";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.26"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.26"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.26".quote or false then [ (crates.quote."${deps."syn"."0.15.26".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.26" or {});
  };
  features_.syn."0.15.26" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.26".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.26".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.26"."proc-macro" or false) ||
        (f."syn"."0.15.26"."proc-macro" or false); }
      { "${deps.syn."0.15.26".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.26".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.26".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.26".quote}"."proc-macro" or false) ||
        (syn."0.15.26"."proc-macro" or false) ||
        (f."syn"."0.15.26"."proc-macro" or false); }
      { "${deps.syn."0.15.26".quote}".default = (f.quote."${deps.syn."0.15.26".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.26".clone-impls =
        (f.syn."0.15.26".clone-impls or false) ||
        (f.syn."0.15.26".default or false) ||
        (syn."0.15.26"."default" or false); }
      { "0.15.26".default = (f.syn."0.15.26".default or true); }
      { "0.15.26".derive =
        (f.syn."0.15.26".derive or false) ||
        (f.syn."0.15.26".default or false) ||
        (syn."0.15.26"."default" or false); }
      { "0.15.26".parsing =
        (f.syn."0.15.26".parsing or false) ||
        (f.syn."0.15.26".default or false) ||
        (syn."0.15.26"."default" or false); }
      { "0.15.26".printing =
        (f.syn."0.15.26".printing or false) ||
        (f.syn."0.15.26".default or false) ||
        (syn."0.15.26"."default" or false); }
      { "0.15.26".proc-macro =
        (f.syn."0.15.26".proc-macro or false) ||
        (f.syn."0.15.26".default or false) ||
        (syn."0.15.26"."default" or false); }
      { "0.15.26".quote =
        (f.syn."0.15.26".quote or false) ||
        (f.syn."0.15.26".printing or false) ||
        (syn."0.15.26"."printing" or false); }
    ];
    unicode_xid."${deps.syn."0.15.26".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.26"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.26"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.26"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.1

  crates.synstructure."0.10.1" = deps: { features?(features_.synstructure."0.10.1" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.1";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0mx2vwd0d0f7hanz15nkp0ikkfjsx9rfkph7pynxyfbj45ank4g3";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.1"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.1"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.1"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.1"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.1" or {});
  };
  features_.synstructure."0.10.1" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.1".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.1".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.1".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.1".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.1".syn}".default = true; }
    ];
    synstructure."0.10.1".default = (f.synstructure."0.10.1".default or true);
    unicode_xid."${deps.synstructure."0.10.1".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.1"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.1"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.1"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.1"."unicode_xid"}" deps)
  ];


# end
# tempfile-3.0.5

  crates.tempfile."3.0.5" = deps: { features?(features_.tempfile."3.0.5" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.0.5";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    sha256 = "11xc89br78ypk4g27v51lm2baz57gp6v555i3sxhrj9qlas2iqfl";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.0.5"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.0.5"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.0.5"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.0.5"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.0.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.0.5"."winapi"}" deps)
    ]) else []);
  };
  features_.tempfile."3.0.5" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.0.5".cfg_if}".default = true;
    libc."${deps.tempfile."3.0.5".libc}".default = true;
    rand."${deps.tempfile."3.0.5".rand}".default = true;
    redox_syscall."${deps.tempfile."3.0.5".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.0.5".remove_dir_all}".default = true;
    tempfile."3.0.5".default = (f.tempfile."3.0.5".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.0.5".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.0.5".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.0.5".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.0.5".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."tempfile"."3.0.5"."cfg_if"}" deps)
    (features_.rand."${deps."tempfile"."3.0.5"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempfile"."3.0.5"."remove_dir_all"}" deps)
    (features_.redox_syscall."${deps."tempfile"."3.0.5"."redox_syscall"}" deps)
    (features_.libc."${deps."tempfile"."3.0.5"."libc"}" deps)
    (features_.winapi."${deps."tempfile"."3.0.5"."winapi"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# tokio-0.1.15

  crates.tokio."0.1.15" = deps: { features?(features_.tokio."0.1.15" deps {}) }: buildRustCrate {
    crateName = "tokio";
    version = "0.1.15";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1lv4apsvqpmkz45rhjhby54m1mmyh9kaw2xxc4masx9vdg2nrgxr";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio"."0.1.15"."futures"}" deps)
    ]
      ++ (if features.tokio."0.1.15".bytes or false then [ (crates.bytes."${deps."tokio"."0.1.15".bytes}" deps) ] else [])
      ++ (if features.tokio."0.1.15".mio or false then [ (crates.mio."${deps."tokio"."0.1.15".mio}" deps) ] else [])
      ++ (if features.tokio."0.1.15".num_cpus or false then [ (crates.num_cpus."${deps."tokio"."0.1.15".num_cpus}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-codec or false then [ (crates.tokio_codec."${deps."tokio"."0.1.15".tokio_codec}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-current-thread or false then [ (crates.tokio_current_thread."${deps."tokio"."0.1.15".tokio_current_thread}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-executor or false then [ (crates.tokio_executor."${deps."tokio"."0.1.15".tokio_executor}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-fs or false then [ (crates.tokio_fs."${deps."tokio"."0.1.15".tokio_fs}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-io or false then [ (crates.tokio_io."${deps."tokio"."0.1.15".tokio_io}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-reactor or false then [ (crates.tokio_reactor."${deps."tokio"."0.1.15".tokio_reactor}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-sync or false then [ (crates.tokio_sync."${deps."tokio"."0.1.15".tokio_sync}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-tcp or false then [ (crates.tokio_tcp."${deps."tokio"."0.1.15".tokio_tcp}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-threadpool or false then [ (crates.tokio_threadpool."${deps."tokio"."0.1.15".tokio_threadpool}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-timer or false then [ (crates.tokio_timer."${deps."tokio"."0.1.15".tokio_timer}" deps) ] else [])
      ++ (if features.tokio."0.1.15".tokio-udp or false then [ (crates.tokio_udp."${deps."tokio"."0.1.15".tokio_udp}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.tokio."0.1.15".tokio-uds or false then [ (crates.tokio_uds."${deps."tokio"."0.1.15".tokio_uds}" deps) ] else [])) else []);
    features = mkFeatures (features."tokio"."0.1.15" or {});
  };
  features_.tokio."0.1.15" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio."0.1.15".bytes}".default = true;
    futures."${deps.tokio."0.1.15".futures}".default = true;
    mio."${deps.tokio."0.1.15".mio}".default = true;
    num_cpus."${deps.tokio."0.1.15".num_cpus}".default = true;
    tokio = fold recursiveUpdate {} [
      { "0.1.15".bytes =
        (f.tokio."0.1.15".bytes or false) ||
        (f.tokio."0.1.15".io or false) ||
        (tokio."0.1.15"."io" or false); }
      { "0.1.15".codec =
        (f.tokio."0.1.15".codec or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false); }
      { "0.1.15".default = (f.tokio."0.1.15".default or true); }
      { "0.1.15".fs =
        (f.tokio."0.1.15".fs or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false); }
      { "0.1.15".io =
        (f.tokio."0.1.15".io or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false) ||
        (f.tokio."0.1.15".reactor or false) ||
        (tokio."0.1.15"."reactor" or false); }
      { "0.1.15".mio =
        (f.tokio."0.1.15".mio or false) ||
        (f.tokio."0.1.15".reactor or false) ||
        (tokio."0.1.15"."reactor" or false); }
      { "0.1.15".num_cpus =
        (f.tokio."0.1.15".num_cpus or false) ||
        (f.tokio."0.1.15".rt-full or false) ||
        (tokio."0.1.15"."rt-full" or false); }
      { "0.1.15".reactor =
        (f.tokio."0.1.15".reactor or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false) ||
        (f.tokio."0.1.15".rt-full or false) ||
        (tokio."0.1.15"."rt-full" or false); }
      { "0.1.15".rt-full =
        (f.tokio."0.1.15".rt-full or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false); }
      { "0.1.15".sync =
        (f.tokio."0.1.15".sync or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false); }
      { "0.1.15".tcp =
        (f.tokio."0.1.15".tcp or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false); }
      { "0.1.15".timer =
        (f.tokio."0.1.15".timer or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false) ||
        (f.tokio."0.1.15".rt-full or false) ||
        (tokio."0.1.15"."rt-full" or false); }
      { "0.1.15".tokio-codec =
        (f.tokio."0.1.15".tokio-codec or false) ||
        (f.tokio."0.1.15".codec or false) ||
        (tokio."0.1.15"."codec" or false); }
      { "0.1.15".tokio-current-thread =
        (f.tokio."0.1.15".tokio-current-thread or false) ||
        (f.tokio."0.1.15".rt-full or false) ||
        (tokio."0.1.15"."rt-full" or false); }
      { "0.1.15".tokio-executor =
        (f.tokio."0.1.15".tokio-executor or false) ||
        (f.tokio."0.1.15".rt-full or false) ||
        (tokio."0.1.15"."rt-full" or false); }
      { "0.1.15".tokio-fs =
        (f.tokio."0.1.15".tokio-fs or false) ||
        (f.tokio."0.1.15".fs or false) ||
        (tokio."0.1.15"."fs" or false); }
      { "0.1.15".tokio-io =
        (f.tokio."0.1.15".tokio-io or false) ||
        (f.tokio."0.1.15".io or false) ||
        (tokio."0.1.15"."io" or false); }
      { "0.1.15".tokio-reactor =
        (f.tokio."0.1.15".tokio-reactor or false) ||
        (f.tokio."0.1.15".reactor or false) ||
        (tokio."0.1.15"."reactor" or false); }
      { "0.1.15".tokio-sync =
        (f.tokio."0.1.15".tokio-sync or false) ||
        (f.tokio."0.1.15".sync or false) ||
        (tokio."0.1.15"."sync" or false); }
      { "0.1.15".tokio-tcp =
        (f.tokio."0.1.15".tokio-tcp or false) ||
        (f.tokio."0.1.15".tcp or false) ||
        (tokio."0.1.15"."tcp" or false); }
      { "0.1.15".tokio-threadpool =
        (f.tokio."0.1.15".tokio-threadpool or false) ||
        (f.tokio."0.1.15".rt-full or false) ||
        (tokio."0.1.15"."rt-full" or false); }
      { "0.1.15".tokio-timer =
        (f.tokio."0.1.15".tokio-timer or false) ||
        (f.tokio."0.1.15".timer or false) ||
        (tokio."0.1.15"."timer" or false); }
      { "0.1.15".tokio-udp =
        (f.tokio."0.1.15".tokio-udp or false) ||
        (f.tokio."0.1.15".udp or false) ||
        (tokio."0.1.15"."udp" or false); }
      { "0.1.15".tokio-uds =
        (f.tokio."0.1.15".tokio-uds or false) ||
        (f.tokio."0.1.15".uds or false) ||
        (tokio."0.1.15"."uds" or false); }
      { "0.1.15".udp =
        (f.tokio."0.1.15".udp or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false); }
      { "0.1.15".uds =
        (f.tokio."0.1.15".uds or false) ||
        (f.tokio."0.1.15".default or false) ||
        (tokio."0.1.15"."default" or false); }
    ];
    tokio_codec."${deps.tokio."0.1.15".tokio_codec}".default = true;
    tokio_current_thread."${deps.tokio."0.1.15".tokio_current_thread}".default = true;
    tokio_executor."${deps.tokio."0.1.15".tokio_executor}".default = true;
    tokio_fs."${deps.tokio."0.1.15".tokio_fs}".default = true;
    tokio_io."${deps.tokio."0.1.15".tokio_io}".default = true;
    tokio_reactor."${deps.tokio."0.1.15".tokio_reactor}".default = true;
    tokio_sync."${deps.tokio."0.1.15".tokio_sync}".default = true;
    tokio_tcp."${deps.tokio."0.1.15".tokio_tcp}".default = true;
    tokio_threadpool."${deps.tokio."0.1.15".tokio_threadpool}".default = true;
    tokio_timer."${deps.tokio."0.1.15".tokio_timer}".default = true;
    tokio_udp."${deps.tokio."0.1.15".tokio_udp}".default = true;
    tokio_uds."${deps.tokio."0.1.15".tokio_uds}".default = true;
  }) [
    (features_.bytes."${deps."tokio"."0.1.15"."bytes"}" deps)
    (features_.futures."${deps."tokio"."0.1.15"."futures"}" deps)
    (features_.mio."${deps."tokio"."0.1.15"."mio"}" deps)
    (features_.num_cpus."${deps."tokio"."0.1.15"."num_cpus"}" deps)
    (features_.tokio_codec."${deps."tokio"."0.1.15"."tokio_codec"}" deps)
    (features_.tokio_current_thread."${deps."tokio"."0.1.15"."tokio_current_thread"}" deps)
    (features_.tokio_executor."${deps."tokio"."0.1.15"."tokio_executor"}" deps)
    (features_.tokio_fs."${deps."tokio"."0.1.15"."tokio_fs"}" deps)
    (features_.tokio_io."${deps."tokio"."0.1.15"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio"."0.1.15"."tokio_reactor"}" deps)
    (features_.tokio_sync."${deps."tokio"."0.1.15"."tokio_sync"}" deps)
    (features_.tokio_tcp."${deps."tokio"."0.1.15"."tokio_tcp"}" deps)
    (features_.tokio_threadpool."${deps."tokio"."0.1.15"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."tokio"."0.1.15"."tokio_timer"}" deps)
    (features_.tokio_udp."${deps."tokio"."0.1.15"."tokio_udp"}" deps)
    (features_.tokio_uds."${deps."tokio"."0.1.15"."tokio_uds"}" deps)
  ];


# end
# tokio-codec-0.1.1

  crates.tokio_codec."0.1.1" = deps: { features?(features_.tokio_codec."0.1.1" deps {}) }: buildRustCrate {
    crateName = "tokio-codec";
    version = "0.1.1";
    authors = [ "Carl Lerche <me@carllerche.com>" "Bryan Burgers <bryan@burgers.io>" ];
    sha256 = "0jc9lik540zyj4chbygg1rjh37m3zax8pd4bwcrwjmi1v56qwi4h";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_codec"."0.1.1"."bytes"}" deps)
      (crates."futures"."${deps."tokio_codec"."0.1.1"."futures"}" deps)
      (crates."tokio_io"."${deps."tokio_codec"."0.1.1"."tokio_io"}" deps)
    ]);
  };
  features_.tokio_codec."0.1.1" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_codec."0.1.1".bytes}".default = true;
    futures."${deps.tokio_codec."0.1.1".futures}".default = true;
    tokio_codec."0.1.1".default = (f.tokio_codec."0.1.1".default or true);
    tokio_io."${deps.tokio_codec."0.1.1".tokio_io}".default = true;
  }) [
    (features_.bytes."${deps."tokio_codec"."0.1.1"."bytes"}" deps)
    (features_.futures."${deps."tokio_codec"."0.1.1"."futures"}" deps)
    (features_.tokio_io."${deps."tokio_codec"."0.1.1"."tokio_io"}" deps)
  ];


# end
# tokio-current-thread-0.1.4

  crates.tokio_current_thread."0.1.4" = deps: { features?(features_.tokio_current_thread."0.1.4" deps {}) }: buildRustCrate {
    crateName = "tokio-current-thread";
    version = "0.1.4";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1c92j6pwb7xq4pl9wg2xh4ngms0n59mf575h4x6mlp1jlj3sn2vb";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio_current_thread"."0.1.4"."futures"}" deps)
      (crates."tokio_executor"."${deps."tokio_current_thread"."0.1.4"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_current_thread."0.1.4" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_current_thread."0.1.4".futures}".default = true;
    tokio_current_thread."0.1.4".default = (f.tokio_current_thread."0.1.4".default or true);
    tokio_executor."${deps.tokio_current_thread."0.1.4".tokio_executor}".default = true;
  }) [
    (features_.futures."${deps."tokio_current_thread"."0.1.4"."futures"}" deps)
    (features_.tokio_executor."${deps."tokio_current_thread"."0.1.4"."tokio_executor"}" deps)
  ];


# end
# tokio-executor-0.1.6

  crates.tokio_executor."0.1.6" = deps: { features?(features_.tokio_executor."0.1.6" deps {}) }: buildRustCrate {
    crateName = "tokio-executor";
    version = "0.1.6";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0dwbzdq97fija2scd8lkxa7lfahj056ii7fpwn7bwrc38sqyd8ld";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_executor"."0.1.6"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_executor"."0.1.6"."futures"}" deps)
    ]);
  };
  features_.tokio_executor."0.1.6" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_executor."0.1.6".crossbeam_utils}".default = true;
    futures."${deps.tokio_executor."0.1.6".futures}".default = true;
    tokio_executor."0.1.6".default = (f.tokio_executor."0.1.6".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_executor"."0.1.6"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_executor"."0.1.6"."futures"}" deps)
  ];


# end
# tokio-fs-0.1.5

  crates.tokio_fs."0.1.5" = deps: { features?(features_.tokio_fs."0.1.5" deps {}) }: buildRustCrate {
    crateName = "tokio-fs";
    version = "0.1.5";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0m4b9xmv04dlfm4515mdqjmid4sbyb2n2knyflmcbva8l554inm8";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio_fs"."0.1.5"."futures"}" deps)
      (crates."tokio_io"."${deps."tokio_fs"."0.1.5"."tokio_io"}" deps)
      (crates."tokio_threadpool"."${deps."tokio_fs"."0.1.5"."tokio_threadpool"}" deps)
    ]);
  };
  features_.tokio_fs."0.1.5" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_fs."0.1.5".futures}".default = true;
    tokio_fs."0.1.5".default = (f.tokio_fs."0.1.5".default or true);
    tokio_io."${deps.tokio_fs."0.1.5".tokio_io}".default = true;
    tokio_threadpool."${deps.tokio_fs."0.1.5".tokio_threadpool}".default = true;
  }) [
    (features_.futures."${deps."tokio_fs"."0.1.5"."futures"}" deps)
    (features_.tokio_io."${deps."tokio_fs"."0.1.5"."tokio_io"}" deps)
    (features_.tokio_threadpool."${deps."tokio_fs"."0.1.5"."tokio_threadpool"}" deps)
  ];


# end
# tokio-io-0.1.11

  crates.tokio_io."0.1.11" = deps: { features?(features_.tokio_io."0.1.11" deps {}) }: buildRustCrate {
    crateName = "tokio-io";
    version = "0.1.11";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1qkhscqqjqqvccm7j239xgx4hw8wwwypiraim4w3w8pi7w2pwxiq";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_io"."0.1.11"."bytes"}" deps)
      (crates."futures"."${deps."tokio_io"."0.1.11"."futures"}" deps)
      (crates."log"."${deps."tokio_io"."0.1.11"."log"}" deps)
    ]);
  };
  features_.tokio_io."0.1.11" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_io."0.1.11".bytes}".default = true;
    futures."${deps.tokio_io."0.1.11".futures}".default = true;
    log."${deps.tokio_io."0.1.11".log}".default = true;
    tokio_io."0.1.11".default = (f.tokio_io."0.1.11".default or true);
  }) [
    (features_.bytes."${deps."tokio_io"."0.1.11"."bytes"}" deps)
    (features_.futures."${deps."tokio_io"."0.1.11"."futures"}" deps)
    (features_.log."${deps."tokio_io"."0.1.11"."log"}" deps)
  ];


# end
# tokio-reactor-0.1.8

  crates.tokio_reactor."0.1.8" = deps: { features?(features_.tokio_reactor."0.1.8" deps {}) }: buildRustCrate {
    crateName = "tokio-reactor";
    version = "0.1.8";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1v31i5kqcrk95wshzhqp6p5xcd0dmsc6sb5ydchi9y69vg2s7wfd";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_reactor"."0.1.8"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_reactor"."0.1.8"."futures"}" deps)
      (crates."lazy_static"."${deps."tokio_reactor"."0.1.8"."lazy_static"}" deps)
      (crates."log"."${deps."tokio_reactor"."0.1.8"."log"}" deps)
      (crates."mio"."${deps."tokio_reactor"."0.1.8"."mio"}" deps)
      (crates."num_cpus"."${deps."tokio_reactor"."0.1.8"."num_cpus"}" deps)
      (crates."parking_lot"."${deps."tokio_reactor"."0.1.8"."parking_lot"}" deps)
      (crates."slab"."${deps."tokio_reactor"."0.1.8"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_reactor"."0.1.8"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."tokio_reactor"."0.1.8"."tokio_io"}" deps)
    ]);
  };
  features_.tokio_reactor."0.1.8" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_reactor."0.1.8".crossbeam_utils}".default = true;
    futures."${deps.tokio_reactor."0.1.8".futures}".default = true;
    lazy_static."${deps.tokio_reactor."0.1.8".lazy_static}".default = true;
    log."${deps.tokio_reactor."0.1.8".log}".default = true;
    mio."${deps.tokio_reactor."0.1.8".mio}".default = true;
    num_cpus."${deps.tokio_reactor."0.1.8".num_cpus}".default = true;
    parking_lot."${deps.tokio_reactor."0.1.8".parking_lot}".default = true;
    slab."${deps.tokio_reactor."0.1.8".slab}".default = true;
    tokio_executor."${deps.tokio_reactor."0.1.8".tokio_executor}".default = true;
    tokio_io."${deps.tokio_reactor."0.1.8".tokio_io}".default = true;
    tokio_reactor."0.1.8".default = (f.tokio_reactor."0.1.8".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_reactor"."0.1.8"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_reactor"."0.1.8"."futures"}" deps)
    (features_.lazy_static."${deps."tokio_reactor"."0.1.8"."lazy_static"}" deps)
    (features_.log."${deps."tokio_reactor"."0.1.8"."log"}" deps)
    (features_.mio."${deps."tokio_reactor"."0.1.8"."mio"}" deps)
    (features_.num_cpus."${deps."tokio_reactor"."0.1.8"."num_cpus"}" deps)
    (features_.parking_lot."${deps."tokio_reactor"."0.1.8"."parking_lot"}" deps)
    (features_.slab."${deps."tokio_reactor"."0.1.8"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_reactor"."0.1.8"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."tokio_reactor"."0.1.8"."tokio_io"}" deps)
  ];


# end
# tokio-sync-0.1.1

  crates.tokio_sync."0.1.1" = deps: { features?(features_.tokio_sync."0.1.1" deps {}) }: buildRustCrate {
    crateName = "tokio-sync";
    version = "0.1.1";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0kpiy0q1hfqdxlak62vv0rwcqgj65k72m2f7lh8mgafkng8ms2c1";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio_sync"."0.1.1"."futures"}" deps)
    ]);
  };
  features_.tokio_sync."0.1.1" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_sync."0.1.1".futures}".default = true;
    tokio_sync."0.1.1".default = (f.tokio_sync."0.1.1".default or true);
  }) [
    (features_.futures."${deps."tokio_sync"."0.1.1"."futures"}" deps)
  ];


# end
# tokio-tcp-0.1.3

  crates.tokio_tcp."0.1.3" = deps: { features?(features_.tokio_tcp."0.1.3" deps {}) }: buildRustCrate {
    crateName = "tokio-tcp";
    version = "0.1.3";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "07v5p339660zjy1w73wddagj3n5wa4v7v5gj7hnvw95ka407zvcz";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_tcp"."0.1.3"."bytes"}" deps)
      (crates."futures"."${deps."tokio_tcp"."0.1.3"."futures"}" deps)
      (crates."iovec"."${deps."tokio_tcp"."0.1.3"."iovec"}" deps)
      (crates."mio"."${deps."tokio_tcp"."0.1.3"."mio"}" deps)
      (crates."tokio_io"."${deps."tokio_tcp"."0.1.3"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_tcp"."0.1.3"."tokio_reactor"}" deps)
    ]);
  };
  features_.tokio_tcp."0.1.3" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_tcp."0.1.3".bytes}".default = true;
    futures."${deps.tokio_tcp."0.1.3".futures}".default = true;
    iovec."${deps.tokio_tcp."0.1.3".iovec}".default = true;
    mio."${deps.tokio_tcp."0.1.3".mio}".default = true;
    tokio_io."${deps.tokio_tcp."0.1.3".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_tcp."0.1.3".tokio_reactor}".default = true;
    tokio_tcp."0.1.3".default = (f.tokio_tcp."0.1.3".default or true);
  }) [
    (features_.bytes."${deps."tokio_tcp"."0.1.3"."bytes"}" deps)
    (features_.futures."${deps."tokio_tcp"."0.1.3"."futures"}" deps)
    (features_.iovec."${deps."tokio_tcp"."0.1.3"."iovec"}" deps)
    (features_.mio."${deps."tokio_tcp"."0.1.3"."mio"}" deps)
    (features_.tokio_io."${deps."tokio_tcp"."0.1.3"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_tcp"."0.1.3"."tokio_reactor"}" deps)
  ];


# end
# tokio-threadpool-0.1.11

  crates.tokio_threadpool."0.1.11" = deps: { features?(features_.tokio_threadpool."0.1.11" deps {}) }: buildRustCrate {
    crateName = "tokio-threadpool";
    version = "0.1.11";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0l9bf06j5fiwnsy5fh6v3d00fcc6wlkgbjlpyd594bagpnhgwcpn";
    dependencies = mapFeatures features ([
      (crates."crossbeam"."${deps."tokio_threadpool"."0.1.11"."crossbeam"}" deps)
      (crates."crossbeam_channel"."${deps."tokio_threadpool"."0.1.11"."crossbeam_channel"}" deps)
      (crates."crossbeam_deque"."${deps."tokio_threadpool"."0.1.11"."crossbeam_deque"}" deps)
      (crates."crossbeam_utils"."${deps."tokio_threadpool"."0.1.11"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_threadpool"."0.1.11"."futures"}" deps)
      (crates."log"."${deps."tokio_threadpool"."0.1.11"."log"}" deps)
      (crates."num_cpus"."${deps."tokio_threadpool"."0.1.11"."num_cpus"}" deps)
      (crates."rand"."${deps."tokio_threadpool"."0.1.11"."rand"}" deps)
      (crates."slab"."${deps."tokio_threadpool"."0.1.11"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_threadpool"."0.1.11"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_threadpool."0.1.11" = deps: f: updateFeatures f (rec {
    crossbeam."${deps.tokio_threadpool."0.1.11".crossbeam}".default = true;
    crossbeam_channel."${deps.tokio_threadpool."0.1.11".crossbeam_channel}".default = true;
    crossbeam_deque."${deps.tokio_threadpool."0.1.11".crossbeam_deque}".default = true;
    crossbeam_utils."${deps.tokio_threadpool."0.1.11".crossbeam_utils}".default = true;
    futures."${deps.tokio_threadpool."0.1.11".futures}".default = true;
    log."${deps.tokio_threadpool."0.1.11".log}".default = true;
    num_cpus."${deps.tokio_threadpool."0.1.11".num_cpus}".default = true;
    rand."${deps.tokio_threadpool."0.1.11".rand}".default = true;
    slab."${deps.tokio_threadpool."0.1.11".slab}".default = true;
    tokio_executor."${deps.tokio_threadpool."0.1.11".tokio_executor}".default = true;
    tokio_threadpool."0.1.11".default = (f.tokio_threadpool."0.1.11".default or true);
  }) [
    (features_.crossbeam."${deps."tokio_threadpool"."0.1.11"."crossbeam"}" deps)
    (features_.crossbeam_channel."${deps."tokio_threadpool"."0.1.11"."crossbeam_channel"}" deps)
    (features_.crossbeam_deque."${deps."tokio_threadpool"."0.1.11"."crossbeam_deque"}" deps)
    (features_.crossbeam_utils."${deps."tokio_threadpool"."0.1.11"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_threadpool"."0.1.11"."futures"}" deps)
    (features_.log."${deps."tokio_threadpool"."0.1.11"."log"}" deps)
    (features_.num_cpus."${deps."tokio_threadpool"."0.1.11"."num_cpus"}" deps)
    (features_.rand."${deps."tokio_threadpool"."0.1.11"."rand"}" deps)
    (features_.slab."${deps."tokio_threadpool"."0.1.11"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_threadpool"."0.1.11"."tokio_executor"}" deps)
  ];


# end
# tokio-timer-0.2.10

  crates.tokio_timer."0.2.10" = deps: { features?(features_.tokio_timer."0.2.10" deps {}) }: buildRustCrate {
    crateName = "tokio-timer";
    version = "0.2.10";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "17a5irj7ph95l30845vg6hy3igc0k04bhxnqs2qww4v8ix30vbkz";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_timer"."0.2.10"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_timer"."0.2.10"."futures"}" deps)
      (crates."slab"."${deps."tokio_timer"."0.2.10"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_timer"."0.2.10"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_timer."0.2.10" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_timer."0.2.10".crossbeam_utils}".default = true;
    futures."${deps.tokio_timer."0.2.10".futures}".default = true;
    slab."${deps.tokio_timer."0.2.10".slab}".default = true;
    tokio_executor."${deps.tokio_timer."0.2.10".tokio_executor}".default = true;
    tokio_timer."0.2.10".default = (f.tokio_timer."0.2.10".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_timer"."0.2.10"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_timer"."0.2.10"."futures"}" deps)
    (features_.slab."${deps."tokio_timer"."0.2.10"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_timer"."0.2.10"."tokio_executor"}" deps)
  ];


# end
# tokio-udp-0.1.3

  crates.tokio_udp."0.1.3" = deps: { features?(features_.tokio_udp."0.1.3" deps {}) }: buildRustCrate {
    crateName = "tokio-udp";
    version = "0.1.3";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1g1x499vqvzwy7xfccr32vwymlx25zpmkx8ppqgifzqwrjnncajf";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_udp"."0.1.3"."bytes"}" deps)
      (crates."futures"."${deps."tokio_udp"."0.1.3"."futures"}" deps)
      (crates."log"."${deps."tokio_udp"."0.1.3"."log"}" deps)
      (crates."mio"."${deps."tokio_udp"."0.1.3"."mio"}" deps)
      (crates."tokio_codec"."${deps."tokio_udp"."0.1.3"."tokio_codec"}" deps)
      (crates."tokio_io"."${deps."tokio_udp"."0.1.3"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_udp"."0.1.3"."tokio_reactor"}" deps)
    ]);
  };
  features_.tokio_udp."0.1.3" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_udp."0.1.3".bytes}".default = true;
    futures."${deps.tokio_udp."0.1.3".futures}".default = true;
    log."${deps.tokio_udp."0.1.3".log}".default = true;
    mio."${deps.tokio_udp."0.1.3".mio}".default = true;
    tokio_codec."${deps.tokio_udp."0.1.3".tokio_codec}".default = true;
    tokio_io."${deps.tokio_udp."0.1.3".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_udp."0.1.3".tokio_reactor}".default = true;
    tokio_udp."0.1.3".default = (f.tokio_udp."0.1.3".default or true);
  }) [
    (features_.bytes."${deps."tokio_udp"."0.1.3"."bytes"}" deps)
    (features_.futures."${deps."tokio_udp"."0.1.3"."futures"}" deps)
    (features_.log."${deps."tokio_udp"."0.1.3"."log"}" deps)
    (features_.mio."${deps."tokio_udp"."0.1.3"."mio"}" deps)
    (features_.tokio_codec."${deps."tokio_udp"."0.1.3"."tokio_codec"}" deps)
    (features_.tokio_io."${deps."tokio_udp"."0.1.3"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_udp"."0.1.3"."tokio_reactor"}" deps)
  ];


# end
# tokio-uds-0.2.5

  crates.tokio_uds."0.2.5" = deps: { features?(features_.tokio_uds."0.2.5" deps {}) }: buildRustCrate {
    crateName = "tokio-uds";
    version = "0.2.5";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1i4d9b4v9a3rza8bi1j2701w6xjvxxdpdaaw2za4h1x9qriq4rv9";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_uds"."0.2.5"."bytes"}" deps)
      (crates."futures"."${deps."tokio_uds"."0.2.5"."futures"}" deps)
      (crates."iovec"."${deps."tokio_uds"."0.2.5"."iovec"}" deps)
      (crates."libc"."${deps."tokio_uds"."0.2.5"."libc"}" deps)
      (crates."log"."${deps."tokio_uds"."0.2.5"."log"}" deps)
      (crates."mio"."${deps."tokio_uds"."0.2.5"."mio"}" deps)
      (crates."mio_uds"."${deps."tokio_uds"."0.2.5"."mio_uds"}" deps)
      (crates."tokio_codec"."${deps."tokio_uds"."0.2.5"."tokio_codec"}" deps)
      (crates."tokio_io"."${deps."tokio_uds"."0.2.5"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_uds"."0.2.5"."tokio_reactor"}" deps)
    ]);
  };
  features_.tokio_uds."0.2.5" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_uds."0.2.5".bytes}".default = true;
    futures."${deps.tokio_uds."0.2.5".futures}".default = true;
    iovec."${deps.tokio_uds."0.2.5".iovec}".default = true;
    libc."${deps.tokio_uds."0.2.5".libc}".default = true;
    log."${deps.tokio_uds."0.2.5".log}".default = true;
    mio."${deps.tokio_uds."0.2.5".mio}".default = true;
    mio_uds."${deps.tokio_uds."0.2.5".mio_uds}".default = true;
    tokio_codec."${deps.tokio_uds."0.2.5".tokio_codec}".default = true;
    tokio_io."${deps.tokio_uds."0.2.5".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_uds."0.2.5".tokio_reactor}".default = true;
    tokio_uds."0.2.5".default = (f.tokio_uds."0.2.5".default or true);
  }) [
    (features_.bytes."${deps."tokio_uds"."0.2.5"."bytes"}" deps)
    (features_.futures."${deps."tokio_uds"."0.2.5"."futures"}" deps)
    (features_.iovec."${deps."tokio_uds"."0.2.5"."iovec"}" deps)
    (features_.libc."${deps."tokio_uds"."0.2.5"."libc"}" deps)
    (features_.log."${deps."tokio_uds"."0.2.5"."log"}" deps)
    (features_.mio."${deps."tokio_uds"."0.2.5"."mio"}" deps)
    (features_.mio_uds."${deps."tokio_uds"."0.2.5"."mio_uds"}" deps)
    (features_.tokio_codec."${deps."tokio_uds"."0.2.5"."tokio_codec"}" deps)
    (features_.tokio_io."${deps."tokio_uds"."0.2.5"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_uds"."0.2.5"."tokio_reactor"}" deps)
  ];


# end
# toml-0.4.10

  crates.toml."0.4.10" = deps: { features?(features_.toml."0.4.10" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.4.10";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0fs4kxl86w3kmgwcgcv23nk79zagayz1spg281r83w0ywf88d6f1";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.4.10"."serde"}" deps)
    ]);
  };
  features_.toml."0.4.10" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.4.10".serde}".default = true;
    toml."0.4.10".default = (f.toml."0.4.10".default or true);
  }) [
    (features_.serde."${deps."toml"."0.4.10"."serde"}" deps)
  ];


# end
# try-lock-0.2.2

  crates.try_lock."0.2.2" = deps: { features?(features_.try_lock."0.2.2" deps {}) }: buildRustCrate {
    crateName = "try-lock";
    version = "0.2.2";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1k8xc0jpbrmzp0fwghdh6pwzjb9xx2p8yy0xxnnb8065smc5fsrv";
  };
  features_.try_lock."0.2.2" = deps: f: updateFeatures f (rec {
    try_lock."0.2.2".default = (f.try_lock."0.2.2".default or true);
  }) [];


# end
# typenum-1.10.0

  crates.typenum."1.10.0" = deps: { features?(features_.typenum."1.10.0" deps {}) }: buildRustCrate {
    crateName = "typenum";
    version = "1.10.0";
    authors = [ "Paho Lurie-Gregg <paho@paholg.com>" "Andre Bogus <bogusandre@gmail.com>" ];
    sha256 = "1v2cgg0mlzkg5prs7swysckgk2ay6bpda8m83c2sn3z77dcsx3bc";
    build = "build/main.rs";
    features = mkFeatures (features."typenum"."1.10.0" or {});
  };
  features_.typenum."1.10.0" = deps: f: updateFeatures f (rec {
    typenum."1.10.0".default = (f.typenum."1.10.0".default or true);
  }) [];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicase-1.4.2

  crates.unicase."1.4.2" = deps: { features?(features_.unicase."1.4.2" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "1.4.2";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" ];
    sha256 = "0rbnhw2mnhcwrij3vczp0sl8zdfmvf2dlh8hly81kj7132kfj0mf";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."1.4.2"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."1.4.2" or {});
  };
  features_.unicase."1.4.2" = deps: f: updateFeatures f (rec {
    unicase = fold recursiveUpdate {} [
      { "1.4.2".default = (f.unicase."1.4.2".default or true); }
      { "1.4.2".heapsize =
        (f.unicase."1.4.2".heapsize or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2".heapsize_plugin =
        (f.unicase."1.4.2".heapsize_plugin or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
    ];
    version_check."${deps.unicase."1.4.2".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."1.4.2"."version_check"}" deps)
  ];


# end
# unicase-2.2.0

  crates.unicase."2.2.0" = deps: { features?(features_.unicase."2.2.0" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "2.2.0";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0p8fj4rdjk9k15s552bl6vpidjcf4jzddzkz6vgagb2i84xlvfxc";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."2.2.0"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."2.2.0" or {});
  };
  features_.unicase."2.2.0" = deps: f: updateFeatures f (rec {
    unicase."2.2.0".default = (f.unicase."2.2.0".default or true);
    version_check."${deps.unicase."2.2.0".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."2.2.0"."version_check"}" deps)
  ];


# end
# unicode-bidi-0.3.4

  crates.unicode_bidi."0.3.4" = deps: { features?(features_.unicode_bidi."0.3.4" deps {}) }: buildRustCrate {
    crateName = "unicode-bidi";
    version = "0.3.4";
    authors = [ "The Servo Project Developers" ];
    sha256 = "0lcd6jasrf8p9p0q20qyf10c6xhvw40m2c4rr105hbk6zy26nj1q";
    libName = "unicode_bidi";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
    ]);
    features = mkFeatures (features."unicode_bidi"."0.3.4" or {});
  };
  features_.unicode_bidi."0.3.4" = deps: f: updateFeatures f (rec {
    matches."${deps.unicode_bidi."0.3.4".matches}".default = true;
    unicode_bidi = fold recursiveUpdate {} [
      { "0.3.4".default = (f.unicode_bidi."0.3.4".default or true); }
      { "0.3.4".flame =
        (f.unicode_bidi."0.3.4".flame or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".flamer =
        (f.unicode_bidi."0.3.4".flamer or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".serde =
        (f.unicode_bidi."0.3.4".serde or false) ||
        (f.unicode_bidi."0.3.4".with_serde or false) ||
        (unicode_bidi."0.3.4"."with_serde" or false); }
    ];
  }) [
    (features_.matches."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
  ];


# end
# unicode-normalization-0.1.8

  crates.unicode_normalization."0.1.8" = deps: { features?(features_.unicode_normalization."0.1.8" deps {}) }: buildRustCrate {
    crateName = "unicode-normalization";
    version = "0.1.8";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "1pb26i2xd5zz0icabyqahikpca0iwj2jd4145pczc4bb7p641dsz";
    dependencies = mapFeatures features ([
      (crates."smallvec"."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
    ]);
  };
  features_.unicode_normalization."0.1.8" = deps: f: updateFeatures f (rec {
    smallvec."${deps.unicode_normalization."0.1.8".smallvec}".default = true;
    unicode_normalization."0.1.8".default = (f.unicode_normalization."0.1.8".default or true);
  }) [
    (features_.smallvec."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
  ];


# end
# unicode-segmentation-1.2.1

  crates.unicode_segmentation."1.2.1" = deps: { features?(features_.unicode_segmentation."1.2.1" deps {}) }: buildRustCrate {
    crateName = "unicode-segmentation";
    version = "1.2.1";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0pzydlrq019cdiqbbfq205cskxcspwi97zfdi02rma21br1kc59m";
    features = mkFeatures (features."unicode_segmentation"."1.2.1" or {});
  };
  features_.unicode_segmentation."1.2.1" = deps: f: updateFeatures f (rec {
    unicode_segmentation."1.2.1".default = (f.unicode_segmentation."1.2.1".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# unreachable-1.0.0

  crates.unreachable."1.0.0" = deps: { features?(features_.unreachable."1.0.0" deps {}) }: buildRustCrate {
    crateName = "unreachable";
    version = "1.0.0";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "1am8czbk5wwr25gbp2zr007744fxjshhdqjz9liz7wl4pnv3whcf";
    dependencies = mapFeatures features ([
      (crates."void"."${deps."unreachable"."1.0.0"."void"}" deps)
    ]);
  };
  features_.unreachable."1.0.0" = deps: f: updateFeatures f (rec {
    unreachable."1.0.0".default = (f.unreachable."1.0.0".default or true);
    void."${deps.unreachable."1.0.0".void}".default = (f.void."${deps.unreachable."1.0.0".void}".default or false);
  }) [
    (features_.void."${deps."unreachable"."1.0.0"."void"}" deps)
  ];


# end
# url-1.7.2

  crates.url."1.7.2" = deps: { features?(features_.url."1.7.2" deps {}) }: buildRustCrate {
    crateName = "url";
    version = "1.7.2";
    authors = [ "The rust-url developers" ];
    sha256 = "0qzrjzd9r1niv7037x4cgnv98fs1vj0k18lpxx890ipc47x5gc09";
    dependencies = mapFeatures features ([
      (crates."idna"."${deps."url"."1.7.2"."idna"}" deps)
      (crates."matches"."${deps."url"."1.7.2"."matches"}" deps)
      (crates."percent_encoding"."${deps."url"."1.7.2"."percent_encoding"}" deps)
    ]);
    features = mkFeatures (features."url"."1.7.2" or {});
  };
  features_.url."1.7.2" = deps: f: updateFeatures f (rec {
    idna."${deps.url."1.7.2".idna}".default = true;
    matches."${deps.url."1.7.2".matches}".default = true;
    percent_encoding."${deps.url."1.7.2".percent_encoding}".default = true;
    url = fold recursiveUpdate {} [
      { "1.7.2".default = (f.url."1.7.2".default or true); }
      { "1.7.2".encoding =
        (f.url."1.7.2".encoding or false) ||
        (f.url."1.7.2".query_encoding or false) ||
        (url."1.7.2"."query_encoding" or false); }
      { "1.7.2".heapsize =
        (f.url."1.7.2".heapsize or false) ||
        (f.url."1.7.2".heap_size or false) ||
        (url."1.7.2"."heap_size" or false); }
    ];
  }) [
    (features_.idna."${deps."url"."1.7.2"."idna"}" deps)
    (features_.matches."${deps."url"."1.7.2"."matches"}" deps)
    (features_.percent_encoding."${deps."url"."1.7.2"."percent_encoding"}" deps)
  ];


# end
# utf8-ranges-1.0.2

  crates.utf8_ranges."1.0.2" = deps: { features?(features_.utf8_ranges."1.0.2" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1my02laqsgnd8ib4dvjgd4rilprqjad6pb9jj9vi67csi5qs2281";
  };
  features_.utf8_ranges."1.0.2" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.2".default = (f.utf8_ranges."1.0.2".default or true);
  }) [];


# end
# uuid-0.7.2

  crates.uuid."0.7.2" = deps: { features?(features_.uuid."0.7.2" deps {}) }: buildRustCrate {
    crateName = "uuid";
    version = "0.7.2";
    authors = [ "Ashley Mannix<ashleymannix@live.com.au>" "Christopher Armstrong" "Dylan DPC<dylan.dpc@gmail.com>" "Hunar Roop Kahlon<hunar.roop@gmail.com>" ];
    sha256 = "0jz5awsbncf2z6gx55h9y4y5x1ziyjgag8x6flzl5fqrw5fwfdym";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.uuid."0.7.2".rand or false then [ (crates.rand."${deps."uuid"."0.7.2".rand}" deps) ] else []));
    features = mkFeatures (features."uuid"."0.7.2" or {});
  };
  features_.uuid."0.7.2" = deps: f: updateFeatures f (rec {
    rand = fold recursiveUpdate {} [
      { "${deps.uuid."0.7.2".rand}"."stdweb" =
        (f.rand."${deps.uuid."0.7.2".rand}"."stdweb" or false) ||
        (uuid."0.7.2"."stdweb" or false) ||
        (f."uuid"."0.7.2"."stdweb" or false); }
      { "${deps.uuid."0.7.2".rand}"."wasm-bindgen" =
        (f.rand."${deps.uuid."0.7.2".rand}"."wasm-bindgen" or false) ||
        (uuid."0.7.2"."wasm-bindgen" or false) ||
        (f."uuid"."0.7.2"."wasm-bindgen" or false); }
      { "${deps.uuid."0.7.2".rand}".default = true; }
    ];
    uuid = fold recursiveUpdate {} [
      { "0.7.2".byteorder =
        (f.uuid."0.7.2".byteorder or false) ||
        (f.uuid."0.7.2".u128 or false) ||
        (uuid."0.7.2"."u128" or false); }
      { "0.7.2".default = (f.uuid."0.7.2".default or true); }
      { "0.7.2".md5 =
        (f.uuid."0.7.2".md5 or false) ||
        (f.uuid."0.7.2".v3 or false) ||
        (uuid."0.7.2"."v3" or false); }
      { "0.7.2".nightly =
        (f.uuid."0.7.2".nightly or false) ||
        (f.uuid."0.7.2".const_fn or false) ||
        (uuid."0.7.2"."const_fn" or false); }
      { "0.7.2".rand =
        (f.uuid."0.7.2".rand or false) ||
        (f.uuid."0.7.2".v3 or false) ||
        (uuid."0.7.2"."v3" or false) ||
        (f.uuid."0.7.2".v4 or false) ||
        (uuid."0.7.2"."v4" or false) ||
        (f.uuid."0.7.2".v5 or false) ||
        (uuid."0.7.2"."v5" or false); }
      { "0.7.2".sha1 =
        (f.uuid."0.7.2".sha1 or false) ||
        (f.uuid."0.7.2".v5 or false) ||
        (uuid."0.7.2"."v5" or false); }
      { "0.7.2".std =
        (f.uuid."0.7.2".std or false) ||
        (f.uuid."0.7.2".default or false) ||
        (uuid."0.7.2"."default" or false); }
      { "0.7.2".winapi =
        (f.uuid."0.7.2".winapi or false) ||
        (f.uuid."0.7.2".guid or false) ||
        (uuid."0.7.2"."guid" or false); }
    ];
  }) [
    (features_.rand."${deps."uuid"."0.7.2"."rand"}" deps)
  ];


# end
# vcpkg-0.2.6

  crates.vcpkg."0.2.6" = deps: { features?(features_.vcpkg."0.2.6" deps {}) }: buildRustCrate {
    crateName = "vcpkg";
    version = "0.2.6";
    authors = [ "Jim McGrath <jimmc2@gmail.com>" ];
    sha256 = "1ig6jqpzzl1z9vk4qywgpfr4hfbd8ny8frqsgm3r449wkc4n1i5x";
  };
  features_.vcpkg."0.2.6" = deps: f: updateFeatures f (rec {
    vcpkg."0.2.6".default = (f.vcpkg."0.2.6".default or true);
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# void-1.0.2

  crates.void."1.0.2" = deps: { features?(features_.void."1.0.2" deps {}) }: buildRustCrate {
    crateName = "void";
    version = "1.0.2";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "0h1dm0dx8dhf56a83k68mijyxigqhizpskwxfdrs1drwv2cdclv3";
    features = mkFeatures (features."void"."1.0.2" or {});
  };
  features_.void."1.0.2" = deps: f: updateFeatures f (rec {
    void = fold recursiveUpdate {} [
      { "1.0.2".default = (f.void."1.0.2".default or true); }
      { "1.0.2".std =
        (f.void."1.0.2".std or false) ||
        (f.void."1.0.2".default or false) ||
        (void."1.0.2"."default" or false); }
    ];
  }) [];


# end
# walkdir-2.2.7

  crates.walkdir."2.2.7" = deps: { features?(features_.walkdir."2.2.7" deps {}) }: buildRustCrate {
    crateName = "walkdir";
    version = "2.2.7";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0wq3v28916kkla29yyi0g0xfc16apwx24py68049kriz3gjlig03";
    dependencies = mapFeatures features ([
      (crates."same_file"."${deps."walkdir"."2.2.7"."same_file"}" deps)
    ])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."walkdir"."2.2.7"."winapi"}" deps)
      (crates."winapi_util"."${deps."walkdir"."2.2.7"."winapi_util"}" deps)
    ]) else []);
  };
  features_.walkdir."2.2.7" = deps: f: updateFeatures f (rec {
    same_file."${deps.walkdir."2.2.7".same_file}".default = true;
    walkdir."2.2.7".default = (f.walkdir."2.2.7".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.walkdir."2.2.7".winapi}"."std" = true; }
      { "${deps.walkdir."2.2.7".winapi}"."winnt" = true; }
      { "${deps.walkdir."2.2.7".winapi}".default = true; }
    ];
    winapi_util."${deps.walkdir."2.2.7".winapi_util}".default = true;
  }) [
    (features_.same_file."${deps."walkdir"."2.2.7"."same_file"}" deps)
    (features_.winapi."${deps."walkdir"."2.2.7"."winapi"}" deps)
    (features_.winapi_util."${deps."walkdir"."2.2.7"."winapi_util"}" deps)
  ];


# end
# want-0.0.6

  crates.want."0.0.6" = deps: { features?(features_.want."0.0.6" deps {}) }: buildRustCrate {
    crateName = "want";
    version = "0.0.6";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "03cc2lndz531a4kgql1v9kppyb1yz2abcz5l52j1gg2nypmy3lh8";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."want"."0.0.6"."futures"}" deps)
      (crates."log"."${deps."want"."0.0.6"."log"}" deps)
      (crates."try_lock"."${deps."want"."0.0.6"."try_lock"}" deps)
    ]);
  };
  features_.want."0.0.6" = deps: f: updateFeatures f (rec {
    futures."${deps.want."0.0.6".futures}".default = true;
    log."${deps.want."0.0.6".log}".default = true;
    try_lock."${deps.want."0.0.6".try_lock}".default = true;
    want."0.0.6".default = (f.want."0.0.6".default or true);
  }) [
    (features_.futures."${deps."want"."0.0.6"."futures"}" deps)
    (features_.log."${deps."want"."0.0.6"."log"}" deps)
    (features_.try_lock."${deps."want"."0.0.6"."try_lock"}" deps)
  ];


# end
# wayland-client-0.21.11

  crates.wayland_client."0.21.11" = deps: { features?(features_.wayland_client."0.21.11" deps {}) }: buildRustCrate {
    crateName = "wayland-client";
    version = "0.21.11";
    authors = [ "Victor Berger <victor.berger@m4x.org>" ];
    sha256 = "05k2chgbsb833n10y4bwdpaj6w9dx7iax2qh48y7lkzmpvckri74";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."wayland_client"."0.21.11"."bitflags"}" deps)
      (crates."downcast_rs"."${deps."wayland_client"."0.21.11"."downcast_rs"}" deps)
      (crates."libc"."${deps."wayland_client"."0.21.11"."libc"}" deps)
      (crates."nix"."${deps."wayland_client"."0.21.11"."nix"}" deps)
      (crates."wayland_commons"."${deps."wayland_client"."0.21.11"."wayland_commons"}" deps)
    ]
      ++ (if features.wayland_client."0.21.11".wayland-sys or false then [ (crates.wayland_sys."${deps."wayland_client"."0.21.11".wayland_sys}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."wayland_scanner"."${deps."wayland_client"."0.21.11"."wayland_scanner"}" deps)
    ]);
    features = mkFeatures (features."wayland_client"."0.21.11" or {});
  };
  features_.wayland_client."0.21.11" = deps: f: updateFeatures f (rec {
    bitflags."${deps.wayland_client."0.21.11".bitflags}".default = true;
    downcast_rs."${deps.wayland_client."0.21.11".downcast_rs}".default = true;
    libc."${deps.wayland_client."0.21.11".libc}".default = true;
    nix."${deps.wayland_client."0.21.11".nix}".default = true;
    wayland_client = fold recursiveUpdate {} [
      { "0.21.11".calloop =
        (f.wayland_client."0.21.11".calloop or false) ||
        (f.wayland_client."0.21.11".eventloop or false) ||
        (wayland_client."0.21.11"."eventloop" or false); }
      { "0.21.11".default = (f.wayland_client."0.21.11".default or true); }
      { "0.21.11".mio =
        (f.wayland_client."0.21.11".mio or false) ||
        (f.wayland_client."0.21.11".eventloop or false) ||
        (wayland_client."0.21.11"."eventloop" or false); }
      { "0.21.11".native_lib =
        (f.wayland_client."0.21.11".native_lib or false) ||
        (f.wayland_client."0.21.11".cursor or false) ||
        (wayland_client."0.21.11"."cursor" or false) ||
        (f.wayland_client."0.21.11".dlopen or false) ||
        (wayland_client."0.21.11"."dlopen" or false) ||
        (f.wayland_client."0.21.11".egl or false) ||
        (wayland_client."0.21.11"."egl" or false); }
      { "0.21.11".wayland-sys =
        (f.wayland_client."0.21.11".wayland-sys or false) ||
        (f.wayland_client."0.21.11".native_lib or false) ||
        (wayland_client."0.21.11"."native_lib" or false); }
    ];
    wayland_commons = fold recursiveUpdate {} [
      { "${deps.wayland_client."0.21.11".wayland_commons}"."native_lib" =
        (f.wayland_commons."${deps.wayland_client."0.21.11".wayland_commons}"."native_lib" or false) ||
        (wayland_client."0.21.11"."native_lib" or false) ||
        (f."wayland_client"."0.21.11"."native_lib" or false); }
      { "${deps.wayland_client."0.21.11".wayland_commons}".default = true; }
    ];
    wayland_scanner."${deps.wayland_client."0.21.11".wayland_scanner}".default = true;
    wayland_sys = fold recursiveUpdate {} [
      { "${deps.wayland_client."0.21.11".wayland_sys}"."client" = true; }
      { "${deps.wayland_client."0.21.11".wayland_sys}"."cursor" =
        (f.wayland_sys."${deps.wayland_client."0.21.11".wayland_sys}"."cursor" or false) ||
        (wayland_client."0.21.11"."cursor" or false) ||
        (f."wayland_client"."0.21.11"."cursor" or false); }
      { "${deps.wayland_client."0.21.11".wayland_sys}"."dlopen" =
        (f.wayland_sys."${deps.wayland_client."0.21.11".wayland_sys}"."dlopen" or false) ||
        (wayland_client."0.21.11"."dlopen" or false) ||
        (f."wayland_client"."0.21.11"."dlopen" or false); }
      { "${deps.wayland_client."0.21.11".wayland_sys}"."egl" =
        (f.wayland_sys."${deps.wayland_client."0.21.11".wayland_sys}"."egl" or false) ||
        (wayland_client."0.21.11"."egl" or false) ||
        (f."wayland_client"."0.21.11"."egl" or false); }
      { "${deps.wayland_client."0.21.11".wayland_sys}".default = true; }
    ];
  }) [
    (features_.bitflags."${deps."wayland_client"."0.21.11"."bitflags"}" deps)
    (features_.downcast_rs."${deps."wayland_client"."0.21.11"."downcast_rs"}" deps)
    (features_.libc."${deps."wayland_client"."0.21.11"."libc"}" deps)
    (features_.nix."${deps."wayland_client"."0.21.11"."nix"}" deps)
    (features_.wayland_commons."${deps."wayland_client"."0.21.11"."wayland_commons"}" deps)
    (features_.wayland_sys."${deps."wayland_client"."0.21.11"."wayland_sys"}" deps)
    (features_.wayland_scanner."${deps."wayland_client"."0.21.11"."wayland_scanner"}" deps)
  ];


# end
# wayland-commons-0.21.11

  crates.wayland_commons."0.21.11" = deps: { features?(features_.wayland_commons."0.21.11" deps {}) }: buildRustCrate {
    crateName = "wayland-commons";
    version = "0.21.11";
    authors = [ "Victor Berger <victor.berger@m4x.org>" ];
    sha256 = "0dkd1cnxf65abvyc937j7wpr8kwrimap1yqqs5qid77xlkwpl8gw";
    dependencies = mapFeatures features ([
      (crates."nix"."${deps."wayland_commons"."0.21.11"."nix"}" deps)
    ]
      ++ (if features.wayland_commons."0.21.11".wayland-sys or false then [ (crates.wayland_sys."${deps."wayland_commons"."0.21.11".wayland_sys}" deps) ] else []));
    features = mkFeatures (features."wayland_commons"."0.21.11" or {});
  };
  features_.wayland_commons."0.21.11" = deps: f: updateFeatures f (rec {
    nix."${deps.wayland_commons."0.21.11".nix}".default = true;
    wayland_commons = fold recursiveUpdate {} [
      { "0.21.11".default = (f.wayland_commons."0.21.11".default or true); }
      { "0.21.11".wayland-sys =
        (f.wayland_commons."0.21.11".wayland-sys or false) ||
        (f.wayland_commons."0.21.11".native_lib or false) ||
        (wayland_commons."0.21.11"."native_lib" or false); }
    ];
    wayland_sys."${deps.wayland_commons."0.21.11".wayland_sys}".default = true;
  }) [
    (features_.nix."${deps."wayland_commons"."0.21.11"."nix"}" deps)
    (features_.wayland_sys."${deps."wayland_commons"."0.21.11"."wayland_sys"}" deps)
  ];


# end
# wayland-protocols-0.21.11

  crates.wayland_protocols."0.21.11" = deps: { features?(features_.wayland_protocols."0.21.11" deps {}) }: buildRustCrate {
    crateName = "wayland-protocols";
    version = "0.21.11";
    authors = [ "Victor Berger <victor.berger@m4x.org>" ];
    sha256 = "10qgdf5xbwzldm25yj3wg8hmrdbkb9zvp35pjnnvylpaf2d5qp5a";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."wayland_protocols"."0.21.11"."bitflags"}" deps)
      (crates."wayland_commons"."${deps."wayland_protocols"."0.21.11"."wayland_commons"}" deps)
    ]
      ++ (if features.wayland_protocols."0.21.11".wayland-client or false then [ (crates.wayland_client."${deps."wayland_protocols"."0.21.11".wayland_client}" deps) ] else [])
      ++ (if features.wayland_protocols."0.21.11".wayland-sys or false then [ (crates.wayland_sys."${deps."wayland_protocols"."0.21.11".wayland_sys}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."wayland_scanner"."${deps."wayland_protocols"."0.21.11"."wayland_scanner"}" deps)
    ]);
    features = mkFeatures (features."wayland_protocols"."0.21.11" or {});
  };
  features_.wayland_protocols."0.21.11" = deps: f: updateFeatures f (rec {
    bitflags."${deps.wayland_protocols."0.21.11".bitflags}".default = true;
    wayland_client = fold recursiveUpdate {} [
      { "${deps.wayland_protocols."0.21.11".wayland_client}"."native_lib" =
        (f.wayland_client."${deps.wayland_protocols."0.21.11".wayland_client}"."native_lib" or false) ||
        (wayland_protocols."0.21.11"."native_client" or false) ||
        (f."wayland_protocols"."0.21.11"."native_client" or false); }
      { "${deps.wayland_protocols."0.21.11".wayland_client}".default = true; }
    ];
    wayland_commons."${deps.wayland_protocols."0.21.11".wayland_commons}".default = true;
    wayland_protocols = fold recursiveUpdate {} [
      { "0.21.11".client =
        (f.wayland_protocols."0.21.11".client or false) ||
        (f.wayland_protocols."0.21.11".native_client or false) ||
        (wayland_protocols."0.21.11"."native_client" or false); }
      { "0.21.11".default = (f.wayland_protocols."0.21.11".default or true); }
      { "0.21.11".native_lib =
        (f.wayland_protocols."0.21.11".native_lib or false) ||
        (f.wayland_protocols."0.21.11".native_client or false) ||
        (wayland_protocols."0.21.11"."native_client" or false) ||
        (f.wayland_protocols."0.21.11".native_server or false) ||
        (wayland_protocols."0.21.11"."native_server" or false); }
      { "0.21.11".server =
        (f.wayland_protocols."0.21.11".server or false) ||
        (f.wayland_protocols."0.21.11".native_server or false) ||
        (wayland_protocols."0.21.11"."native_server" or false); }
      { "0.21.11".wayland-client =
        (f.wayland_protocols."0.21.11".wayland-client or false) ||
        (f.wayland_protocols."0.21.11".client or false) ||
        (wayland_protocols."0.21.11"."client" or false); }
      { "0.21.11".wayland-server =
        (f.wayland_protocols."0.21.11".wayland-server or false) ||
        (f.wayland_protocols."0.21.11".server or false) ||
        (wayland_protocols."0.21.11"."server" or false); }
      { "0.21.11".wayland-sys =
        (f.wayland_protocols."0.21.11".wayland-sys or false) ||
        (f.wayland_protocols."0.21.11".native_lib or false) ||
        (wayland_protocols."0.21.11"."native_lib" or false); }
    ];
    wayland_scanner."${deps.wayland_protocols."0.21.11".wayland_scanner}".default = true;
    wayland_sys."${deps.wayland_protocols."0.21.11".wayland_sys}".default = true;
  }) [
    (features_.bitflags."${deps."wayland_protocols"."0.21.11"."bitflags"}" deps)
    (features_.wayland_client."${deps."wayland_protocols"."0.21.11"."wayland_client"}" deps)
    (features_.wayland_commons."${deps."wayland_protocols"."0.21.11"."wayland_commons"}" deps)
    (features_.wayland_sys."${deps."wayland_protocols"."0.21.11"."wayland_sys"}" deps)
    (features_.wayland_scanner."${deps."wayland_protocols"."0.21.11"."wayland_scanner"}" deps)
  ];


# end
# wayland-scanner-0.21.11

  crates.wayland_scanner."0.21.11" = deps: { features?(features_.wayland_scanner."0.21.11" deps {}) }: buildRustCrate {
    crateName = "wayland-scanner";
    version = "0.21.11";
    authors = [ "Victor Berger <victor.berger@m4x.org>" ];
    sha256 = "19pz2vlwikixx7kjvqm1kvl91q50d7cn9bgr6damm95bjjqxfam8";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."wayland_scanner"."0.21.11"."proc_macro2"}" deps)
      (crates."quote"."${deps."wayland_scanner"."0.21.11"."quote"}" deps)
      (crates."xml_rs"."${deps."wayland_scanner"."0.21.11"."xml_rs"}" deps)
    ]);
  };
  features_.wayland_scanner."0.21.11" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.wayland_scanner."0.21.11".proc_macro2}".default = true;
    quote."${deps.wayland_scanner."0.21.11".quote}".default = true;
    wayland_scanner."0.21.11".default = (f.wayland_scanner."0.21.11".default or true);
    xml_rs."${deps.wayland_scanner."0.21.11".xml_rs}".default = true;
  }) [
    (features_.proc_macro2."${deps."wayland_scanner"."0.21.11"."proc_macro2"}" deps)
    (features_.quote."${deps."wayland_scanner"."0.21.11"."quote"}" deps)
    (features_.xml_rs."${deps."wayland_scanner"."0.21.11"."xml_rs"}" deps)
  ];


# end
# wayland-sys-0.21.11

  crates.wayland_sys."0.21.11" = deps: { features?(features_.wayland_sys."0.21.11" deps {}) }: buildRustCrate {
    crateName = "wayland-sys";
    version = "0.21.11";
    authors = [ "Victor Berger <victor.berger@m4x.org>" ];
    sha256 = "1jvf40rm3dpqbyfhxhr72v0xdmigpgz2pxq4cic68h59ynrv3ndk";
    dependencies = mapFeatures features ([
      (crates."dlib"."${deps."wayland_sys"."0.21.11"."dlib"}" deps)
    ]
      ++ (if features.wayland_sys."0.21.11".lazy_static or false then [ (crates.lazy_static."${deps."wayland_sys"."0.21.11".lazy_static}" deps) ] else []));
    features = mkFeatures (features."wayland_sys"."0.21.11" or {});
  };
  features_.wayland_sys."0.21.11" = deps: f: updateFeatures f (rec {
    dlib = fold recursiveUpdate {} [
      { "${deps.wayland_sys."0.21.11".dlib}"."dlopen" =
        (f.dlib."${deps.wayland_sys."0.21.11".dlib}"."dlopen" or false) ||
        (wayland_sys."0.21.11"."dlopen" or false) ||
        (f."wayland_sys"."0.21.11"."dlopen" or false); }
      { "${deps.wayland_sys."0.21.11".dlib}".default = true; }
    ];
    lazy_static."${deps.wayland_sys."0.21.11".lazy_static}".default = true;
    wayland_sys = fold recursiveUpdate {} [
      { "0.21.11".default = (f.wayland_sys."0.21.11".default or true); }
      { "0.21.11".lazy_static =
        (f.wayland_sys."0.21.11".lazy_static or false) ||
        (f.wayland_sys."0.21.11".dlopen or false) ||
        (wayland_sys."0.21.11"."dlopen" or false); }
      { "0.21.11".libc =
        (f.wayland_sys."0.21.11".libc or false) ||
        (f.wayland_sys."0.21.11".server or false) ||
        (wayland_sys."0.21.11"."server" or false); }
    ];
  }) [
    (features_.dlib."${deps."wayland_sys"."0.21.11"."dlib"}" deps)
    (features_.lazy_static."${deps."wayland_sys"."0.21.11"."lazy_static"}" deps)
  ];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.6

  crates.winapi."0.3.6" = deps: { features?(features_.winapi."0.3.6" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.6";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1d9jfp4cjd82sr1q4dgdlrkvm33zhhav9d7ihr0nivqbncr059m4";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.6"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.6"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.6" or {});
  };
  features_.winapi."0.3.6" = deps: f: updateFeatures f (rec {
    winapi."0.3.6".default = (f.winapi."0.3.6".default or true);
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.6".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.6".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.6"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.6"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-util-0.1.2

  crates.winapi_util."0.1.2" = deps: { features?(features_.winapi_util."0.1.2" deps {}) }: buildRustCrate {
    crateName = "winapi-util";
    version = "0.1.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "07jj7rg7nndd7bqhjin1xphbv8kb5clvhzpqpxkvm3wl84r3mj1h";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."winapi_util"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.winapi_util."0.1.2" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winapi_util."0.1.2".winapi}"."consoleapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."errhandlingapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."fileapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."processenv" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."std" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winbase" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."wincon" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winerror" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winnt" = true; }
      { "${deps.winapi_util."0.1.2".winapi}".default = true; }
    ];
    winapi_util."0.1.2".default = (f.winapi_util."0.1.2".default or true);
  }) [
    (features_.winapi."${deps."winapi_util"."0.1.2"."winapi"}" deps)
  ];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winit-0.18.1

  crates.winit."0.18.1" = deps: { features?(features_.winit."0.18.1" deps {}) }: buildRustCrate {
    crateName = "winit";
    version = "0.18.1";
    authors = [ "The winit contributors" "Pierre Krieger <pierre.krieger1708@gmail.com>" ];
    sha256 = "0mpg2z6x97jgqcfianwpriy06a4j0mbqwaimzl8w2ypqi0zkblpm";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."winit"."0.18.1"."lazy_static"}" deps)
      (crates."libc"."${deps."winit"."0.18.1"."libc"}" deps)
      (crates."log"."${deps."winit"."0.18.1"."log"}" deps)
    ])
      ++ (if kernel == "linux" || kernel == "dragonfly" || kernel == "freebsd" || kernel == "openbsd" || kernel == "netbsd" then mapFeatures features ([
      (crates."parking_lot"."${deps."winit"."0.18.1"."parking_lot"}" deps)
      (crates."percent_encoding"."${deps."winit"."0.18.1"."percent_encoding"}" deps)
      (crates."smithay_client_toolkit"."${deps."winit"."0.18.1"."smithay_client_toolkit"}" deps)
      (crates."wayland_client"."${deps."winit"."0.18.1"."wayland_client"}" deps)
      (crates."x11_dl"."${deps."winit"."0.18.1"."x11_dl"}" deps)
    ]) else [])
      ++ (if kernel == "android" then mapFeatures features ([
      (crates."android_glue"."${deps."winit"."0.18.1"."android_glue"}" deps)
    ]) else [])
      ++ (if kernel == "ios" then mapFeatures features ([
      (crates."objc"."${deps."winit"."0.18.1"."objc"}" deps)
    ]) else [])
      ++ (if kernel == "darwin" then mapFeatures features ([
      (crates."cocoa"."${deps."winit"."0.18.1"."cocoa"}" deps)
      (crates."core_foundation"."${deps."winit"."0.18.1"."core_foundation"}" deps)
      (crates."core_graphics"."${deps."winit"."0.18.1"."core_graphics"}" deps)
      (crates."objc"."${deps."winit"."0.18.1"."objc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."backtrace"."${deps."winit"."0.18.1"."backtrace"}" deps)
      (crates."winapi"."${deps."winit"."0.18.1"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."winit"."0.18.1" or {});
  };
  features_.winit."0.18.1" = deps: f: updateFeatures f (rec {
    android_glue."${deps.winit."0.18.1".android_glue}".default = true;
    backtrace."${deps.winit."0.18.1".backtrace}".default = true;
    cocoa."${deps.winit."0.18.1".cocoa}".default = true;
    core_foundation."${deps.winit."0.18.1".core_foundation}".default = true;
    core_graphics."${deps.winit."0.18.1".core_graphics}".default = true;
    lazy_static."${deps.winit."0.18.1".lazy_static}".default = true;
    libc."${deps.winit."0.18.1".libc}".default = true;
    log."${deps.winit."0.18.1".log}".default = true;
    objc."${deps.winit."0.18.1".objc}".default = true;
    parking_lot."${deps.winit."0.18.1".parking_lot}".default = true;
    percent_encoding."${deps.winit."0.18.1".percent_encoding}".default = true;
    smithay_client_toolkit."${deps.winit."0.18.1".smithay_client_toolkit}".default = true;
    wayland_client = fold recursiveUpdate {} [
      { "${deps.winit."0.18.1".wayland_client}"."cursor" = true; }
      { "${deps.winit."0.18.1".wayland_client}"."dlopen" = true; }
      { "${deps.winit."0.18.1".wayland_client}"."egl" = true; }
      { "${deps.winit."0.18.1".wayland_client}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.winit."0.18.1".winapi}"."combaseapi" = true; }
      { "${deps.winit."0.18.1".winapi}"."dwmapi" = true; }
      { "${deps.winit."0.18.1".winapi}"."errhandlingapi" = true; }
      { "${deps.winit."0.18.1".winapi}"."hidusage" = true; }
      { "${deps.winit."0.18.1".winapi}"."libloaderapi" = true; }
      { "${deps.winit."0.18.1".winapi}"."objbase" = true; }
      { "${deps.winit."0.18.1".winapi}"."ole2" = true; }
      { "${deps.winit."0.18.1".winapi}"."processthreadsapi" = true; }
      { "${deps.winit."0.18.1".winapi}"."shellapi" = true; }
      { "${deps.winit."0.18.1".winapi}"."shellscalingapi" = true; }
      { "${deps.winit."0.18.1".winapi}"."shobjidl_core" = true; }
      { "${deps.winit."0.18.1".winapi}"."unknwnbase" = true; }
      { "${deps.winit."0.18.1".winapi}"."winbase" = true; }
      { "${deps.winit."0.18.1".winapi}"."windowsx" = true; }
      { "${deps.winit."0.18.1".winapi}"."winerror" = true; }
      { "${deps.winit."0.18.1".winapi}"."wingdi" = true; }
      { "${deps.winit."0.18.1".winapi}"."winnt" = true; }
      { "${deps.winit."0.18.1".winapi}"."winuser" = true; }
      { "${deps.winit."0.18.1".winapi}".default = true; }
    ];
    winit = fold recursiveUpdate {} [
      { "0.18.1".default = (f.winit."0.18.1".default or true); }
      { "0.18.1".image =
        (f.winit."0.18.1".image or false) ||
        (f.winit."0.18.1".icon_loading or false) ||
        (winit."0.18.1"."icon_loading" or false); }
    ];
    x11_dl."${deps.winit."0.18.1".x11_dl}".default = true;
  }) [
    (features_.lazy_static."${deps."winit"."0.18.1"."lazy_static"}" deps)
    (features_.libc."${deps."winit"."0.18.1"."libc"}" deps)
    (features_.log."${deps."winit"."0.18.1"."log"}" deps)
    (features_.parking_lot."${deps."winit"."0.18.1"."parking_lot"}" deps)
    (features_.percent_encoding."${deps."winit"."0.18.1"."percent_encoding"}" deps)
    (features_.smithay_client_toolkit."${deps."winit"."0.18.1"."smithay_client_toolkit"}" deps)
    (features_.wayland_client."${deps."winit"."0.18.1"."wayland_client"}" deps)
    (features_.x11_dl."${deps."winit"."0.18.1"."x11_dl"}" deps)
    (features_.android_glue."${deps."winit"."0.18.1"."android_glue"}" deps)
    (features_.objc."${deps."winit"."0.18.1"."objc"}" deps)
    (features_.cocoa."${deps."winit"."0.18.1"."cocoa"}" deps)
    (features_.core_foundation."${deps."winit"."0.18.1"."core_foundation"}" deps)
    (features_.core_graphics."${deps."winit"."0.18.1"."core_graphics"}" deps)
    (features_.objc."${deps."winit"."0.18.1"."objc"}" deps)
    (features_.backtrace."${deps."winit"."0.18.1"."backtrace"}" deps)
    (features_.winapi."${deps."winit"."0.18.1"."winapi"}" deps)
  ];


# end
# ws2_32-sys-0.2.1

  crates.ws2_32_sys."0.2.1" = deps: { features?(features_.ws2_32_sys."0.2.1" deps {}) }: buildRustCrate {
    crateName = "ws2_32-sys";
    version = "0.2.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1zpy9d9wk11sj17fczfngcj28w4xxjs3b4n036yzpy38dxp4f7kc";
    libName = "ws2_32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
    ]);
  };
  features_.ws2_32_sys."0.2.1" = deps: f: updateFeatures f (rec {
    winapi."${deps.ws2_32_sys."0.2.1".winapi}".default = true;
    winapi_build."${deps.ws2_32_sys."0.2.1".winapi_build}".default = true;
    ws2_32_sys."0.2.1".default = (f.ws2_32_sys."0.2.1".default or true);
  }) [
    (features_.winapi."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    (features_.winapi_build."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
  ];


# end
# x11-dl-2.18.3

  crates.x11_dl."2.18.3" = deps: { features?(features_.x11_dl."2.18.3" deps {}) }: buildRustCrate {
    crateName = "x11-dl";
    version = "2.18.3";
    authors = [ "daggerbot <daggerbot@gmail.com>" "Erle Pereira <erle@erlepereira.com>" ];
    sha256 = "0r5910mzf0jxy1g14ja2c02ssx5q2z8n74fbmvyrc83b1xxn23c1";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."x11_dl"."2.18.3"."lazy_static"}" deps)
      (crates."libc"."${deps."x11_dl"."2.18.3"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."pkg_config"."${deps."x11_dl"."2.18.3"."pkg_config"}" deps)
    ]);
  };
  features_.x11_dl."2.18.3" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.x11_dl."2.18.3".lazy_static}".default = true;
    libc."${deps.x11_dl."2.18.3".libc}".default = true;
    pkg_config."${deps.x11_dl."2.18.3".pkg_config}".default = true;
    x11_dl."2.18.3".default = (f.x11_dl."2.18.3".default or true);
  }) [
    (features_.lazy_static."${deps."x11_dl"."2.18.3"."lazy_static"}" deps)
    (features_.libc."${deps."x11_dl"."2.18.3"."libc"}" deps)
    (features_.pkg_config."${deps."x11_dl"."2.18.3"."pkg_config"}" deps)
  ];


# end
# xdg-2.2.0

  crates.xdg."2.2.0" = deps: { features?(features_.xdg."2.2.0" deps {}) }: buildRustCrate {
    crateName = "xdg";
    version = "2.2.0";
    authors = [ "Ben Longbons <b.r.longbons@gmail.com>" "whitequark <whitequark@whitequark.org>" ];
    sha256 = "1dxfcsxkkmp2dn51x5jbkw0nsg8lq397dkqwqd43d3914cnxjlip";
  };
  features_.xdg."2.2.0" = deps: f: updateFeatures f (rec {
    xdg."2.2.0".default = (f.xdg."2.2.0".default or true);
  }) [];


# end
# xml-rs-0.8.0

  crates.xml_rs."0.8.0" = deps: { features?(features_.xml_rs."0.8.0" deps {}) }: buildRustCrate {
    crateName = "xml-rs";
    version = "0.8.0";
    authors = [ "Vladimir Matveev <vladimir.matweev@gmail.com>" ];
    sha256 = "1l3g4wmbz611jwx2a1ni4jyj0ffnls3s7a7rbdn6c763k85k7zs5";
    libPath = "src/lib.rs";
    libName = "xml";
    crateBin =
      [{  name = "xml-analyze";  path = "src/analyze.rs"; }];
  };
  features_.xml_rs."0.8.0" = deps: f: updateFeatures f (rec {
    xml_rs."0.8.0".default = (f.xml_rs."0.8.0".default or true);
  }) [];


# end
# yaml-rust-0.4.2

  crates.yaml_rust."0.4.2" = deps: { features?(features_.yaml_rust."0.4.2" deps {}) }: buildRustCrate {
    crateName = "yaml-rust";
    version = "0.4.2";
    authors = [ "Yuheng Chen <yuhengchen@sensetime.com>" ];
    sha256 = "1bxc5hhky8rk5r8hrv4ynppsfkivq07jbj458i3h8zkhc1ca33lk";
    dependencies = mapFeatures features ([
      (crates."linked_hash_map"."${deps."yaml_rust"."0.4.2"."linked_hash_map"}" deps)
    ]);
  };
  features_.yaml_rust."0.4.2" = deps: f: updateFeatures f (rec {
    linked_hash_map."${deps.yaml_rust."0.4.2".linked_hash_map}".default = true;
    yaml_rust."0.4.2".default = (f.yaml_rust."0.4.2".default or true);
  }) [
    (features_.linked_hash_map."${deps."yaml_rust"."0.4.2"."linked_hash_map"}" deps)
  ];


# end
}
