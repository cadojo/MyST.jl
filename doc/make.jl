using Documenter
using MyST

makedocs(
    sitename = "MyST",
    format = Documenter.HTML(),
    modules = [MyST]
)

deploydocs(
    target    = "build",
    repo      = "github.com/cadojo/MyST.jl.git",
    branch    = "gh-pages",
    devbranch = "main",
    versions  = ["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
