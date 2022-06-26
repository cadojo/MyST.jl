"""
Markedly Restructured Text parsing in Julia!

!!! warning
    This package is super-new. Check back in early 2023!

# Extended Help

## License

$(LICENSE)

## Imports

$(IMPORTS)

## Exports

$(EXPORTS)
"""
module MyST


#
# Boilerplate for pretty docstrings!
#

include(joinpath(@__DIR__, "Boilerplate", "DocStringExtensions.jl"))


#
# Install the parser
#

# This is the problem! https://github.com/JuliaPy/PyCall.jl#using-pycall-from-julia-modules

using PyCall: pyimport_conda

markdown_it = pyimport_conda("markdown_it", "markdown_it", "conda-forge")

front_matter_plugin = pyimport_conda(
    "mdit_py_plugins.front_matter", "mdit_py_plugins", "conda-forge",
).front_matter_plugin

footnote_plugin = pyimport_conda(
    "mdit_py_plugins.footnote", "mdit_py_plugins", "conda-forge",
).footnote_plugin

deflist_plugin = pyimport_conda(
    "mdit_py_plugins.deflist", "mdit_py_plugins", "conda-forge",
).deflist_plugin

tasklists_plugin = pyimport_conda(
    "mdit_py_plugins.tasklists", "mdit_py_plugins", "conda-forge",
).tasklists_plugin

parser = markdown_it.MarkdownIt("commonmark")
parser.enable("table").enable("strikethrough")
parser.use(front_matter_plugin).use(footnote_plugin).use(deflist_plugin).use(tasklists_plugin)


end # module
