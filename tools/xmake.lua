target("gen_code")
    set_kind("binary")
    set_languages("c17")
    add_includedirs("../ta_common", "../ta_abstract","../ta_abstract/frames")
    add_files("gen_code/gen_code.c",
            "../ta_abstract/ta_abstract.c",
            "../ta_abstract/ta_def_ui.c",
            "../ta_abstract/tables/*.c"
        )
    if not is_plat("windows") then
        add_options("fpic")
    end
    if is_plat("windows") then
        add_defines("WIN32")

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
    add_deps("ta_common", "ta_abstract", "ta_func")


target("ta_regtest")
    set_kind("binary")
    set_languages("c17")
    add_includedirs("ta_regtest", "../ta_common", "../ta_func")
    add_files("ta_regtest/*.c", "ta_regtest/ta_test_func/*.c")
    if not is_plat("windows") then
        add_options("fpic")
    end
    if is_plat("windows") then
        add_ldflags("/FORCE")
        if is_mode("debug") then
            set_runtimes("MTd")
            add_ldflags("/DEFAULTLIB:libcmtd")
            add_syslinks("libcmtd")
        else
            --set_optimize("fastest")  -- faster: -O2  fastest: -Ox  none: -O0
            --add_ldflags("/SAFESEH:NO")
            set_runtimes("MT")
        end
    end
    add_deps("ta_common", "ta_abstract", "ta_func")