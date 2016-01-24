local ROOT = "./"

workspace "PremakeCopyTest"
  configurations { "Debug", "Release" }
  platforms { "x64", "x86" }
  location( ROOT .. "proj_" .. _ACTION .. "/" )

  project "Test02"
    targetname   "Test02"
    kind         "ConsoleApp"
    language     "C++"

    -- Compile Configs
    ------------------------------------------------
    flags "FatalWarnings" -- all warnings on
    filter { "action:gmake" }
      buildoptions { "-std=c++14" }
      toolset "clang"
    filter {} -- reset filter

    -- Paths
    ------------------------------------------------
    local OUTPUT = ROOT .. "bin/"
    local SOURCE = ROOT .. "src/"
    targetdir(OUTPUT)

    includedirs { SOURCE }
    files
    {
      SOURCE .. "**.cpp",
      SOURCE .. "**.txt"
    }

    -- Copying Assets
    ------------------------------------------------
    filter { "files:**.txt" }
      prebuildcommands  { "touch %{file.name}_prebuild.txt" }
      prebuildmessage   "PRE BUILD MESSAGE %{file.name}"
      postbuildcommands { "touch %{file.name}_postbuild.txt" }
      postbuildmessage  "POST BUILD MESSAGE %{file.name}"

    filter { "files:**.cpp" }
      prebuildcommands  { "touch %{file.name}_prebuild.txt" }
      prebuildmessage   "PRE BUILD MESSAGE %{file.name}"
      postbuildcommands { "touch %{file.name}_postbuild.txt" }
      postbuildmessage  "POST BUILD MESSAGE %{file.name}"

    filter {} -- reset filter
  
