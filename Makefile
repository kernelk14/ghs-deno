JS = deno
OPT1 = run
OPT2 = compile
ARGS = --allow-all --unstable
FILE = main.js
EXE = ghs-deno


.PHONY: run build all clean both

all:
	@echo "Maybe you need to run these subcommands:\n"
	@echo "    run    -    Run only the file\n"
	@echo "    build  -    Build only the executable\n"
	@echo "    both   -    Do both running and building\n"
	@echo "    clean  -    Little housekeeping\n"

both:
	@echo "Doing both running and compilation..."
	$(JS) $(OPT1) $(ARGS) $(FILE)
	$(JS) $(OPT2) $(ARGS) $(FILE)

build:
	@echo "Compiling $(FILE)..."
	$(JS) $(OPT2) $(ARGS) $(FILE)
	@echo "Compiled $(FILE) to $(EXE)."

run:
	@echo "Running $(FILE)..."
	time $(JS) $(OPT1) $(ARGS) $(FILE)
clean:
	rm $(EXE)
