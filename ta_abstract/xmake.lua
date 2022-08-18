target("ta_abstract")
    set_kind("$(kind)")
    set_basename("ta_abstract")
    set_languages("c17")
    add_includedirs(".", "../ta_common", "frames")
    add_files("ta_abstract.c",
            "ta_def_ui.c",
            "ta_func_api.c",
            "ta_group_idx.c",
            "tables/*.c",
            "frames/*.c")
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
    add_deps("ta_common")