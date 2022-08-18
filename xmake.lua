-- plat
set_config("plat", os.host())

-- project
set_project("ta_lib")

-- set xmake minimum version
set_xmakever("2.6.9")

-- set common flags
set_languages("c17")
set_warnings("all")     -- -Wall
set_symbols("debug")    -- dbg symbols

if is_plat("windows") then
    if is_arch("x86") then
        set_arch("x86")
    else
        set_arch("x64")
    end
    if is_mode("debug") then
        set_runtimes("MTd")
        add_ldflags("/DEFAULTLIB:libcmtd")
        add_syslinks("libcmtd")
    else
        add_cxflags("/EHsc")
        add_ldflags("/SAFESEH:NO")
        set_runtimes("MT")
    end
elseif is_plat("mingw") then
    add_ldflags("-static-libgcc -static-libstdc++ -Wl,-Bstatic -lstdc++ -lwinpthread -Wl,-Bdynamic", { force = true })
else
    --add_cxflags("-Wno-narrowing", "-Wno-sign-compare", "-Wno-class-memaccess", "-Wno-strict-aliasing")
    if is_plat("macosx", "iphoneos") then
        add_cxflags("-fno-pie")
    end
end

-- build with -fPIC
option("fpic")
set_default(false)
set_showmenu(true)
set_description("build with -fPIC")
add_cxflags("-fPIC")
option_end()

-- include dir
add_includedirs("include")
add_installfiles("(include/**)", { prefixdir = "" })
includes("ta_common", "ta_func", "ta_abstract", "tools")

