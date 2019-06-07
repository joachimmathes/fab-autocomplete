<p align="center">
  <img src="http://www.fabfile.org/_static/logo.png" height="100px"/>
  <h1 align="center">Fab Auto Complete</h1>
  <br>
</p>

### Description:

A handy auto completion script for [fabric](http://www.fabfile.org/)


### Important note

This is a fork of [fab-autocomplete] by [Sreenivas Alapati].

If you are interested in why I forked the original repository, read
on. Otherwise, continue with [Installation](#installation).

I decided to provide a fork of this great little script, since I
added an additional dependency. This [fab-bash-completion.sh] makes use
of the highly recommended package [jq]. Thus, I consider this a new
project rather than providing a pull request.

The reason for using jq is fabric's `-F` option to print the task list
to stdout in JSON format (`fab -l -F json`). JSON is not only much better
to parse than the default flat output, it also avoids an issue which
occurs when fabric task descriptions are used. If the description
lines are too long a line break will disrupt the grep and awk pipeline
of the original [fab-autocomplete].

I decided to accept the additional dependency, since [jq] is a really
useful tool anyway.


### Installation:

1. Install [jq] on your system.
2. Download or clone the repo.
3. On Ubuntu and similar Linux systems copy the file
   `fab-bash-completion.sh` to `/etc/bash_completion.d/`.


### Usage

* Type **fab** and **\<tab\>** to get the functions .
* Type **fab** and **--\<tab\>** for the flags.


### Features:

* Auto completion for
  + Functions
  + Flags
* Supports the following shells
  + bash


[fab-autocomplete]: https://github.com/cg-cnu/fab-autocomplete
[jq]: https://stedolan.github.io/jq/
[Sreenivas Alapati]: https://github.com/cg-cnu
[fab-bash-completion.sh]: ./fab-bash-completion.sh
