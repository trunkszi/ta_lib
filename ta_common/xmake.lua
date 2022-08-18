target("ta_common")
    set_kind("$(kind)")
    set_basename("ta_common")
    set_languages("c17")
    add_files("*.c")
    if not is_plat("windows") then
        add_options("fpic")
    end
    if is_plat("windows") then
        if is_mode("debug") then
            set_runtimes("MTd")
            add_ldflags("/DEFAULTLIB:libcmtd")
            add_syslinks("libcmtd")
        else
            --set_optimize("fastest")  -- faster: -O2  fastest: -Ox  none: -O0
            --add_cxflags("/EHsc")
            --add_ldflags("/SAFESEH:NO")
            set_runtimes("MT")
        end
    end
