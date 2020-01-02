# * Arguments

# For consistency, we use only var=val options, not hyphen-prefixed options.

ifdef auto-install
	AUTO_INSTALL = "--auto-install"
endif

ifdef sandbox
	SANDBOX = "--sandbox"
endif

ifdef sandbox-dir
	SANDBOX_DIR = "--sandbox-dir" "$(sandbox-dir)"
endif

# ** Verbosity

# Since the "-v" in "make -v" gets intercepted by Make itself, we have
# to use a variable.

verbose = $(v)

ifneq (,$(findstring vv,$(verbose)))
	VERBOSE = "-vv"
else ifneq (,$(findstring v,$(verbose)))
	VERBOSE = "-v"
endif

# * Rules

# TODO: Handle cases in which "test" or "tests" are called and a
# directory by that name exists, which can confuse Make.

%:
	@./makem.sh $(VERBOSE) $(SANDBOX) $(SANDBOX_DIR) $(AUTO_INSTALL) $(@)
