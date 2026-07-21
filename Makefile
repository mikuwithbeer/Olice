COMPILER = odin
ARGS     =

NAME        = Olice
VERSION     = 0.1.0
SOURCE_PATH = src
OUTPUT_PATH = build
OUTPUT_NAME = $(OUTPUT_PATH)/$(NAME)

FLAGS_DEBUG   = -debug
FLAGS_RELEASE = -o:speed
FLAGS_DEFAULT = -vet -strict-style

.PHONY: all debug release clean run

all: debug

debug:
	@mkdir -p $(OUTPUT_PATH)
	@$(COMPILER) build $(SOURCE_PATH) -out=$(OUTPUT_NAME) $(FLAGS_DEFAULT) $(FLAGS_DEBUG)

release:
	@mkdir -p $(OUTPUT_PATH)
	@$(COMPILER) build $(SOURCE_PATH) -out=$(OUTPUT_NAME) $(FLAGS_DEFAULT) $(FLAGS_RELEASE)

run: debug
	@./$(OUTPUT_NAME) $(ARGS)

clean:
	@rm -rf $(OUTPUT_PATH)
